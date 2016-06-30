//
//  SoleraTechTestTests.swift
//  SoleraTechTestTests
//
//  Created by Bruno Rodrigues on 30/06/2016.
//
//

import XCTest
@testable import SoleraTechTest

class SoleraTechTestTests: XCTestCase {
    
    private let url = "http://www.apilayer.net/api/live"
    private let urlWithKey = "http://www.apilayer.net/api/live?access_key=f0e5fa2d8378c05bfc27169861916068"
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
    // MARK: Unit testing
    
    func testAPIResponse() {
        let expectation: XCTestExpectation = self.expectationWithDescription("List of Currencies and Rates")
        
        let serviceManager: ServiceManager = ServiceManager()
        let request: CurrencyRequest = CurrencyRequest(withBaseUrl: url)
        let parser: JSONParser = JSONParser()
        
        serviceManager.process(request, parser: parser) { (retVal) -> Void in
            XCTAssert((retVal) != nil)
            expectation.fulfill()
        }
        waitForExpectationsWithTimeout(500.0) { error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
        }
    }

    func testAPIResponsePerformance() {
        let serviceManager: ServiceManager = ServiceManager()
        let request: CurrencyRequest = CurrencyRequest(withBaseUrl: url)
        let parser: JSONParser = JSONParser()
        
         measureBlock() {
            serviceManager.process(request, parser: parser) { (retVal) -> Void in
                if let resp = retVal as! CurrencyResponse? {
                    print(resp)
                } else {
                    print("No Results")
                }
            }
        }
    }
    
    func testAsynchronousURLConnection() {
        let URL = NSURL(string: urlWithKey)!
        let expectation = expectationWithDescription("GET \(URL)")
        
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(URL) { data, response, error in
            XCTAssertNotNil(data, "data should not be nil")
            XCTAssertNil(error, "error should be nil")
            
            if let HTTPResponse = response as? NSHTTPURLResponse,
                responseURL = HTTPResponse.URL
            {
                XCTAssertEqual(responseURL.absoluteString, URL.absoluteString, "HTTP response URL should be equal to original URL")
                XCTAssertEqual(HTTPResponse.statusCode, 200, "HTTP response status code should be 200")
            } else {
                XCTFail("Response was not NSHTTPURLResponse")
            }
            
            expectation.fulfill()
        }
        
        task.resume()
        
        waitForExpectationsWithTimeout(task.originalRequest!.timeoutInterval) { error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
            task.cancel()
        }
    }
}
