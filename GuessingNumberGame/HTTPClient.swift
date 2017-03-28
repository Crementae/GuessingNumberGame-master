//
//  HTTPClient.swift
//  GuessingNumberGame
//
//  Created by Adisorn Chatnaratanakun on 3/27/2560 BE.
//  Copyright © 2560 Adisorn Chatnaratanakun. All rights reserved.
//

import Foundation
import Alamofire
import PromiseKit

enum HTTPClientError: Error, CustomStringConvertible {
    
    case ResponseError(statusCode: Int)
    case CannotConnectToServer(errorMessage: String)
    case Unknown
    
    var description: String {
        
        switch self {
        case .ResponseError(let httpStatusCode):
            return "Http response error with http code: \(httpStatusCode)"
        case .CannotConnectToServer(let errorMessage):
            return errorMessage
        default:
            return "Unknown error"
        }
    }
}


class HTTPClient {
    
    func post(url: String, params: [String:AnyObject]) -> DataRequest {
        let header: HTTPHeaders = ["Content-Type": "application/json-rpc"]
        let request = Alamofire.request(url, method: .post, parameters: params, encoding: JSONEncoding.default, headers: header).responseJSON { (DataResponse) in
            print("DataRequest: \(DataResponse.request)")
            print("DataResponse: \(DataResponse.response)")
            print("DataResult: \(DataResponse.result)")
            print("debugPrint: \(DataResponse.debugDescription)")
            debugPrint(DataResponse)
        }
        return request
    }
    
    func get(url: String) -> DataRequest {
        return Alamofire.request(url, method: .get)
    }
    
}
