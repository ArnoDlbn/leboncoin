//
//  CategoriesService.swift
//  leboncoin
//
//  Created by Arnaud Dalbin on 19/11/2021.
//

import Foundation

class CategoryService {
    
    // MARK: - Properties
    
    // URLSession
    var categorySession = URLSession(configuration: .default)
    // URLSessionDataTask
    var task: URLSessionDataTask?
    // initialize URLSession
    init(categorySession: URLSession = URLSession(configuration: .default)) {
        self.categorySession = categorySession
    }
    
    // MARK: - Methods
    
    // send a request to Leboncoin API and return this response
    func getCategories(completionHandler: @escaping ([Category]?, Swift.Error?) -> Void) {
        // call
        guard let request = URL(string: "https://raw.githubusercontent.com/leboncoin/paperclip/master/categories.json") else { return }
        task = categorySession.dataTask(with: request) {(data, rresponse, error) in DispatchQueue.main.async {
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
                let responseJSON = try JSONDecoder().decode([Category].self, from: data)
                completionHandler(responseJSON, nil)
            } catch let jsonError as NSError {
                completionHandler(nil, ErrorCases.errorDecode)
                print("JSON decode failed: \(jsonError.localizedDescription)")
            }
        }
        }
        task?.resume()
    }
}
