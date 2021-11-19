//
//  ItemService.swift
//  leboncoin
//
//  Created by Arnaud Dalbin on 18/11/2021.
//

import Foundation

class AdService {
    
    // MARK: - Properties
    
    // URLSession
    var adSession = URLSession(configuration: .default)
    // URLSessionDataTask
    var task: URLSessionDataTask?
    // initialize URLSession
    init(adSession: URLSession = URLSession(configuration: .default)) {
        self.adSession = adSession
    }
    
    // MARK: - Methods
    
    // send a request to Leboncoin API and return this response
    func getAds(completionHandler: @escaping ([Ad]?, Swift.Error?) -> Void) {
        // call
        guard let request = URL(string: "https://raw.githubusercontent.com/leboncoin/paperclip/master/listing.json") else { return }
        task = adSession.dataTask(with: request) {(data, rresponse, error) in DispatchQueue.main.async {
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
                let responseJSON = try JSONDecoder().decode([Ad].self, from: data)
                completionHandler(responseJSON, nil)
            } catch let jsonError as NSError {
                completionHandler(nil, ErrorCases.errorDecode)
                print("JSON decode failed: \(jsonError.localizedDescription)")
                print(String(describing: error))
                print(String(describing: jsonError))
            }
        }
        }
        task?.resume()
    }
}
