//
//  TestProjectWithNetwrokLayerTests.swift
//  TestProjectWithNetwrokLayerTests
//
//  Created by BKS-GGS on 10/01/23.
//

import XCTest
@testable import TestProjectWithNetwrokLayer

final class TestProjectWithNetwrokLayerTests: XCTestCase {
    var apiManager: APIManager?
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        apiManager = APIManager()
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        apiManager = nil
    }
    
    func testGetNewsFromPass() throws {
        let expectation = expectation(description: "Expecting News Url Response")
        apiManager?.getNewsFrom(url: SERVER.NewsURL.rawValue, closure: { response in
            XCTAssertNotNil(response)
            expectation.fulfill()
        })
        
        /*
         APIManager performing an asynchronous operation, while the tests run synchronously.
         This means that the test finishes running while your network request is still processing.
         This will make XCTest wait for up to 10 seconds, giving your request expectation time to fulfill
         */
        waitForExpectations(timeout: 5) { error in
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
        }
    }
    
    func testGetNewsFromFail() throws {
        apiManager?.getNewsFrom(url: "wwwgoogleeeecom", closure: { response in
            XCTAssertNil(response)
        })
    }
    
    func testGetNewsFromWithNoUrl() throws {
        apiManager?.getNewsFrom(url: "", closure: { response in
            XCTAssertNil(response)
        })
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}
