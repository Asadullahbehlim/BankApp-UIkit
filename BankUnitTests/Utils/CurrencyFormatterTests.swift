//
//  CurrencyFormatterTests.swift
//  BankUnitTests
//
//  Created by Asadullah Behlim on 23/01/23.
//

import Foundation
import XCTest

@testable import Bank

class Test: XCTestCase {
    var formatter: CurrencyFormatter!
    
    override func setUp()  {
        super.setUp()
        formatter = CurrencyFormatter()
    }
    
    func testBreakDollorIntoCents() throws {
        let result = formatter.breakIntoDollarsAndCents(46556.54)
        XCTAssertEqual(result.0, "46,556")
        XCTAssertEqual(result.1, "54")
        
    }
    
    func testDollorsFormatted() throws {
        let result = formatter.dollarsFormatted(45765.00)
        XCTAssertEqual(result, "$45,765.00")
        
    }
 
// Simple method
//    func testZeroDollorFormat() throws {
//        let result = formatter.dollarsFormatted(0.00)
//        XCTAssertEqual(result, "$0.00")
//    }
    
    func testZeroDollorFormat() throws {
        
        let localSymbol = Locale.current
        let currencySymbol =  localSymbol.currencySymbol!
        
        let result = formatter.dollarsFormatted(34876.55)
        XCTAssertEqual(result, "\(currencySymbol)34,876.55")
    
    }
}
