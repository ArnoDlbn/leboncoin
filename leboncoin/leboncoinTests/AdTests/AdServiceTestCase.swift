//
//  leboncoinTests.swift
//  leboncoinTests
//
//  Created by Arnaud Dalbin on 18/11/2021.
//

import XCTest
@testable import leboncoin

class AdServiceTestCase: XCTestCase {
    
    func testGetAdsShouldPostFailedCallbackIfError() {
        let adService = AdService(adSession: URLSessionMock(data: nil, response: nil, error: ResponseDataMock.error))
        
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        
        adService.getAds(completionHandler: { (ads, error) in
            XCTAssertNil(ads)
            XCTAssertNotNil(error)
            guard let error = error as? ErrorCases else {
                XCTAssert(false)
                return
            }
            if case ErrorCases.failure = error {
                XCTAssert(true)
            } else {
                XCTAssert(false)
            }
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGetAdsShouldPostFailedCallbackIfNoData() {
        let adService = AdService(adSession: URLSessionMock(data: nil, response: ResponseDataMock.responseOK, error: nil))
        
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        
        adService.getAds(completionHandler: { (ads, error) in
            XCTAssertNil(ads)
            XCTAssertNotNil(error)
            guard let error = error as? ErrorCases else {
                XCTAssert(false)
                return
            }
            if case ErrorCases.noData = error {
                XCTAssert(true)
            } else {
                XCTAssert(false)
            }
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGetAdsShouldPostFailedCallbackIncorrectResponse() {
        let adService = AdService(adSession: URLSessionMock(data: ResponseDataMock.adCorrectData, response: ResponseDataMock.responseKO, error: nil))
        
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        
        adService.getAds(completionHandler: { (ads, error) in
            XCTAssertNil(ads)
            XCTAssertNotNil(error)
            guard let error = error as? ErrorCases else {
                XCTAssert(false)
                return
            }
            if case ErrorCases.wrongResponse(statusCode: 500) = error {
                XCTAssert(true)
            } else {
                XCTAssert(false)
            }
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGetAdsShouldPostFailedCallbackIncorrectData() {
        let adService = AdService(adSession: URLSessionMock(data: ResponseDataMock.IncorrectData, response: ResponseDataMock.responseOK, error: nil))
        
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        
        adService.getAds(completionHandler: { (ads, error) in
            XCTAssertNil(ads)
            XCTAssertNotNil(error)
            guard let error = error as? ErrorCases else {
                XCTAssert(false)
                return
            }
            if case ErrorCases.errorDecode = error {
                XCTAssert(true)
            } else {
                XCTAssert(false)
            }
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGetAdsShouldPostSuccessCallbackIfNoErrorAndCorrectData() {
        let adService = AdService(adSession: URLSessionMock(data: ResponseDataMock.adCorrectData, response: ResponseDataMock.responseOK, error: nil))
        
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        
        adService.getAds(completionHandler: { (ads, error) in
            let idFirstAd: Int = 1461267313
            let idSecondAd: Int = 1691247255
            let idThirdAd: Int = 1664493117
            
            XCTAssertEqual(idFirstAd, ads![0].id)
            XCTAssertEqual(idSecondAd, ads![1].id)
            XCTAssertEqual(idThirdAd, ads![2].id)
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: 0.01)
    }
}
