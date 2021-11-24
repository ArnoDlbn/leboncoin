//
//  ResponseDataMock.swift
//  leboncoinTests
//
//  Created by Arnaud DALBIN on 24/11/2021.
//

import Foundation

class ResponseDataMock {
    
    // MARK: - Data
    
    static var adCorrectData: Data? {
        let bundle = Bundle(for: ResponseDataMock.self)
        let url = bundle.url(forResource: "Ad", withExtension: "json")!
        return try? Data(contentsOf: url)
    }
    
    static var categoryCorrectData: Data? {
        let bundle = Bundle(for: ResponseDataMock.self)
        let url = bundle.url(forResource: "Category", withExtension: "json")!
        return try? Data(contentsOf: url)
    }
    
    static let IncorrectData = "erreur".data(using: .utf8)
    
    // MARK: - Response
    
    static let responseOK = HTTPURLResponse(
        url: URL(string: "https://leboncoin.com")!,
        statusCode: 200, httpVersion: nil, headerFields: [:])!

    static let responseKO = HTTPURLResponse(
        url: URL(string: "https://leboncoin.com")!,
        statusCode: 500, httpVersion: nil, headerFields: [:])!
    
    // MARK: - Error
    
    class ServiceError: Error {}
    static let error = ServiceError()
}
