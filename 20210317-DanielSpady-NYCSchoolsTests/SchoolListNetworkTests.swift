//
//  SchoolListNetworkTests.swift
//  20210317-DanielSpady-NYCSchoolsTests
//
//  Created by Daniel Spady on 2021-03-17.
//

import XCTest
@testable import _0210317_DanielSpady_NYCSchools

class ResturauntNetworkTests: XCTestCase {

    // Test to make sure Response is being decoded properly
    func testResponseIsNotNil() {
        // Given
        var schoolList: [SchoolResult]?
        let schoolRequest = SchoolRequest()
        let expectation = XCTestExpectation(description: "The Response Result should not be nil")
            
        // When
        SchoolUtillity.schoolList(schoolRequest) { response in
            schoolList = response.result
            XCTAssertNotNil(schoolList)
            expectation.fulfill()
        }
    
        // Then
        wait(for: [expectation], timeout: 5)
    }

    // Test should fail if JSON changes
    func testSchoolListCount() {
        // Given
        var schoolList: [SchoolResult]?
        let schoolRequest = SchoolRequest()
        let expectation = XCTestExpectation(description: "There should be 440 schools in the List")

        // When
        SchoolUtillity.schoolList(schoolRequest) { response in
            schoolList = response.result
            XCTAssertEqual(schoolList?.count, 440)
            expectation.fulfill()
        }

        // Then
        wait(for: [expectation], timeout: 5)
    }

    // Test should fail if JSON model changes
    func testJSONDataInTheSchoolList() {
        // Given
        var schoolList: [SchoolResult]?
        let schoolRequest = SchoolRequest()
        let expectation = XCTestExpectation(description: "The First Model should be Clinton School Writers & Artists, M.S. 260")

        // When
        SchoolUtillity.schoolList(schoolRequest) { response in
            schoolList = response.result
            XCTAssertEqual(schoolList?[0].schoolName, "Clinton School Writers & Artists, M.S. 260")
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
        SchoolUtillity.schoolList(errorRequest) { response in
            if let error = response.error {
                XCTAssertNotNil(error)
                expectation.fulfill()
            }
        }

        // Then
        wait(for: [expectation], timeout: 5)
    }
}
