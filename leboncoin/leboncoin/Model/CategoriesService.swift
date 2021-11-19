//
//  CategoriesService.swift
//  leboncoin
//
//  Created by Arnaud Dalbin on 19/11/2021.
//

import Foundation

class CategoriesService {
    
    // MARK: - Properties
    
    // URLSession
    var categoriesSession = URLSession(configuration: .default)
    // URLSessionDataTask
    var task: URLSessionDataTask?
    // initialize URLSession
    init(categoriesSession: URLSession = URLSession(configuration: .default)) {
        self.categoriesSession = categoriesSession
    }
    
    // MARK: - Methods
    
    // send a request to Leboncoin API and return this response
    func getCategories(completionHandler: @escaping (Categories?, Swift.Error?) -> Void) {
        // call
        guard let request = URL(string: "https://raw.githubusercontent.com/leboncoin/paperclip/master/listing.json") else { return }
        task = categoriesSession.dataTask(with: request) {(data, rresponse, error) in DispatchQueue.main.async {
            // check error
            guard error == nil else {
                completionHandler(nil, ErrorCases.failure)
                return
            }
            // check status response
            guard let response = rresponse as? HTTPURLResponse, response.statusCode == 200 else {
                completionHandler(nil, ErrorCases.wrongResponse(statusCode: (rresponse as? HTTPURLResponse)?.statusCode))
                return
            }
            // check data
            guard let data = data else {
                completionHandler(nil, ErrorCases.noData)
                return
            }
            // check response JSON
            do {
                let responseJSON = try JSONDecoder().decode(Categories.self, from: data)
                completionHandler(responseJSON, nil)
            } catch {
                completionHandler(nil, ErrorCases.errorDecode)
            }
        }
        }
        task?.resume()
    }
}
