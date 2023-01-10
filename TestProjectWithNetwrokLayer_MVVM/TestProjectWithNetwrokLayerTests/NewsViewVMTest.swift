//
//  NewsViewVMTest.swift
//  TestProjectWithNetwrokLayerTests
//
//  Created by BKS-GGS on 10/01/23.
//

import XCTest
@testable import TestProjectWithNetwrokLayer

final class NewsViewVMTest: XCTestCase {
    var newsViewModel: NewViewVM?

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        newsViewModel = NewViewVM()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        self.newsViewModel = nil
    }

    func testFetchNews() throws {
        let expectation = expectation(description: "Expecting News Url Response")
        self.newsViewModel?.fetchNews(closure: { responseArray in
            XCTAssertNotNil(responseArray)
            expectation.fulfill()
        })
        
        /*
         APIManager performing an asynchronous operation, while the tests run synchronously.
         This means that the test finishes running while your network request is still processing.
         This will make XCTest wait for up to 10 seconds, giving your request expectation time to fulfill
         */
        waitForExpectations(timeout: 5) { error in
           XCTAssertNil(error)
        }
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
