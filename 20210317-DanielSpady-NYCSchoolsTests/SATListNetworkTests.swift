//
//  SATListNetworkTests.swift
//  20210317-DanielSpady-NYCSchoolsTests
//
//  Created by Daniel Spady on 2021-03-18.
//

import XCTest
@testable import _0210317_DanielSpady_NYCSchools

class SATListNetworkTests: XCTestCase {
    
    // Test to make sure Response is being decoded properly
    func testSATResponseIsNotNil() {
        // Given
        var satList: [SATResult]?
        let satRequest = SATRequest()
        let expectation = XCTestExpectation(description: "The Response Result should not be nil")
            
        // When
        SchoolUtillity.satList(satRequest) { response in
            satList = response.result
            XCTAssertNotNil(satList)
            expectation.fulfill()
        }
    
        // Then
        wait(for: [expectation], timeout: 5)
    }

    // Test should fail if JSON changes
    func testSATListCount() {
        // Given
        var satList: [SATResult]?
        let satRequest = SATRequest()
        let expectation = XCTestExpectation(description: "There should be 478 SAT results in the List")

        // When
        SchoolUtillity.satList(satRequest) { response in
            satList = response.result
            XCTAssertEqual(satList?.count, 478)
            expectation.fulfill()
        }

        // Then
        wait(for: [expectation], timeout: 5)
    }

    // Test should fail if JSON model changes
    func testJSONDataInTheSATList() {
        // Given
        var satList: [SATResult]?
        let satRequest = SATRequest()
        let expectationDescription = "HENRY STREET SCHOOL FOR INTERNATIONAL STUDIES"
        let expectation = XCTestExpectation(description: expectationDescription)

        // When
        SchoolUtillity.satList(satRequest) { response in
            satList = response.result
            XCTAssertEqual(satList?[0].schoolName, expectationDescription)
            expectation.fulfill()
        }

        // Then
        wait(for: [expectation], timeout: 5)
    }

    // Test to make sure Request is handling errors
    func testErrorNetworkCall() {
        // Given
        let expectation = XCTestExpectation(description: "Test Request Can Handle Errors")
        class MockRequest: BaseRequest {
            override var url: URL? {
                let urlString = "https://wwww.badlink.error"
                return URL(string: urlString)
            }
        }
        let errorRequest = MockRequest()

        // When
        SchoolUtillity.satList(errorRequest) { response in
            if let error = response.error {
                XCTAssertNotNil(error)
                expectation.fulfill()
            }
        }

        // Then
        wait(for: [expectation], timeout: 5)
    }    
}
