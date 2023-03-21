//
//  AccountSummaryViewControllerTests.swift
//  BankUnitTests
//
//  Created by Asadullah Behlim on 20/03/23.
//

import Foundation
import XCTest

@testable import Bank

class AccountSummaryViewControllerTests: XCTestCase {
    var vc: AccountSummaryViewController!
    var mockManager: MockProfileManager!
    
    class MockProfileManager: ProfileManagable {
        func fetchProfile(forUserId userId: String, completion: @escaping (Result<Bank.Profile, Bank.NetworkError>) -> Void) {
            if error != nil {
                completion(.failure(error!))
                return
            }
            profile = Profile(id: "1", firstName: "FirstName", lastName: "LastName")
            completion(.success(profile!))
        }
        
        var profile: Profile?
        var error: NetworkError?
        
    }
    
    override func setUp()  {
        super.setUp()
        vc = AccountSummaryViewController()
        mockManager = MockProfileManager()
        vc.profileManager = mockManager
    }
    
    func testTitleAndMessageForServerError() throws {
        let titleAndMessage = vc.titleAndMessageForTesting(for: .serverError)
        XCTAssertEqual("Server Error", titleAndMessage.0)
        XCTAssertEqual("We could not process your request. Please try again.", titleAndMessage.1)
        
    }
    
    func testTitleAndMessageForDecodingError() throws {
        let titleAndMessage = vc.titleAndMessageForTesting(for: .decodingError)
        XCTAssertEqual("Network Error", titleAndMessage.0)
        XCTAssertEqual("Ensure you are connected to the internet. Please try again.", titleAndMessage.1)
    }
    
    func testAlertForServerError() throws {
        mockManager.error = NetworkError.serverError
        vc.forceFetchProfile()
        XCTAssertEqual("Server Error", vc.errorAlert.title)
        XCTAssertEqual("We could not process your request. Please try again.", vc.errorAlert.message)
    }
    
    func testAlertForDecodingError() throws {
        mockManager.error = NetworkError.decodingError
        vc.forceFetchProfile()
        XCTAssertEqual("Network Error", vc.errorAlert.title)
        XCTAssertEqual("Ensure you are connected to the internet. Please try again.", vc.errorAlert.message)
    }
    
}
