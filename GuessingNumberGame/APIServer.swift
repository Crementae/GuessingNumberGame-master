//
//  APIServer.swift
//  GuessingNumberGame
//
//  Created by Adisorn Chatnaratanakun on 3/27/2560 BE.
//  Copyright © 2560 Adisorn Chatnaratanakun. All rights reserved.
//

import Foundation
import PromiseKit
import AlamofireObjectMapper


class APIServer: NSObject {
    
    private let httpClient: HTTPClient
    
    override init() {
        httpClient = HTTPClient()
    }
    
    func generateRandomNumber() -> Promise<Random> {
        
        let (promise, fullfil, reject) = Promise<Random>.pending()
        
        let url = "https://api.random.org/json-rpc/1/invoke"
        
        let paramsData: [String: AnyObject] = ["apiKey":"485ff6dc-548a-4480-81c1-b680c6554c4a" as AnyObject, "n":1 as AnyObject, "min":1000 as AnyObject , "max": 9999 as AnyObject, "replacement": true as AnyObject, "base":10 as AnyObject]
        
        let params: [String: AnyObject] = ["jsonrpc": "2.0" as AnyObject, "method": "generateIntegers" as AnyObject,"params": paramsData as AnyObject, "id":20305 as AnyObject]
    
        
        let response: Promise<Random> = httpClient.post(url: url, params: params).responseObject(pathString: "result")
        
        
        response.then { (data:Random) -> () in
            fullfil(data)
        }.catch { (error) in
            if case HTTPClientError.ResponseError(let statusCode) = error {
                if 200..<300 ~= statusCode {
                    fullfil(Random())
                }
            }
            reject(error)
        }
        return promise
    }
    
}
