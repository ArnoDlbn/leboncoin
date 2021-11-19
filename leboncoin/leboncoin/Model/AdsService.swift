//
//  ItemService.swift
//  leboncoin
//
//  Created by Arnaud Dalbin on 18/11/2021.
//

import Foundation

class AdsService {
    
    // MARK: - Properties
    
    // URLSession
    var adsSession = URLSession(configuration: .default)
    // URLSessionDataTask
    var task: URLSessionDataTask?
    // initialize URLSession
    init(adsSession: URLSession = URLSession(configuration: .default)) {
        self.adsSession = adsSession
    }
    
    // MARK: - Methods
    
    // send a request to Leboncoin API and return this response
    func getAds(completionHandler: @escaping (Ads?, Swift.Error?) -> Void) {
        // call
        guard let request = URL(string: "https://raw.githubusercontent.com/leboncoin/paperclip/master/listing.json") else { return }
        task = adsSession.dataTask(with: request) {(data, rresponse, error) in DispatchQueue.main.async {
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
                let responseJSON = try JSONDecoder().decode(Ads.self, from: data)
                completionHandler(responseJSON, nil)
            } catch {
                completionHandler(nil, ErrorCases.errorDecode)
            }
        }
        }
        task?.resume()
    }
}
