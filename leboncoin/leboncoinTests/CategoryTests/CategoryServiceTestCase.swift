//
//  CategoryServiceTestCase.swift
//  leboncoinTests
//
//  Created by Arnaud DALBIN on 24/11/2021.
//

import XCTest
@testable import leboncoin

class CategoryServiceTestCase: XCTestCase {
    
    func testGetCategoriesShouldPostFailedCallbackIfError() {
        let categoryService = CategoryService(categorySession: URLSessionMock(data: nil, response: nil, error: ResponseDataMock.error))
        
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        
        categoryService.getCategories(completionHandler: { (categories, error) in
            XCTAssertNil(categories)
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
    
    func testGetCategoriesShouldPostFailedCallbackIfNoData() {
        let categoryService = CategoryService(categorySession: URLSessionMock(data: nil, response: ResponseDataMock.responseOK, error: nil))
        
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        
        categoryService.getCategories(completionHandler: { (categories, error) in
            XCTAssertNil(categories)
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
    
    func testGetCategoriesShouldPostFailedCallbackIncorrectResponse() {
        let categoryService = CategoryService(categorySession: URLSessionMock(data: ResponseDataMock.categoryCorrectData, response: ResponseDataMock.responseKO, error: nil))
        
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        
        categoryService.getCategories(completionHandler: { (categories, error) in
            XCTAssertNil(categories)
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
    
    func testGetCategoriesShouldPostFailedCallbackIncorrectData() {
        let categoryService = CategoryService(categorySession: URLSessionMock(data: ResponseDataMock.IncorrectData, response: ResponseDataMock.responseOK, error: nil))
        
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        
        categoryService.getCategories(completionHandler: { (categories, error) in
            XCTAssertNil(categories)
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
    
    func testGetCategoriesShouldPostSuccessCallbackIfNoErrorAndCorrectData() {
        let categoryService = CategoryService(categorySession: URLSessionMock(data: ResponseDataMock.categoryCorrectData, response: ResponseDataMock.responseOK, error: nil))
        
        let expectation = XCTestExpectation(description: "Wait for queue change.")
        
        categoryService.getCategories(completionHandler: { (categories, error) in
            let firstCategoryName: String = "Véhicule"
            let secondCategoryName: String = "Mode"
            let thirdCategoryName: String = "Bricolage"
            
            XCTAssertEqual(firstCategoryName, categories![0].name)
            XCTAssertEqual(secondCategoryName, categories![1].name)
            XCTAssertEqual(thirdCategoryName, categories![2].name)
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: 0.01)
    }
}
