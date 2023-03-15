//
//  ProfileTests.swift
//  BankUnitTests
//
//  Created by Asadullah Behlim on 15/03/23.
//

import Foundation
import XCTest

@testable import Bank

class ProfileTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        
    }
    
    func testCanParse() throws {
        let json = """
        {
        "id": "1",
        "first_name" : "kevin",
        "last_name" : "Flynn",
       }
       """
        
        let data = json.data(using: .utf8)!
        let result = try! JSONDecoder().decode(Profile.self, from: data)
        
        XCTAssertEqual(result.id, "1")
        XCTAssertEqual(result.firstName, "kevin")
        XCTAssertEqual(result.lastName, "Flynn")

    }
}
