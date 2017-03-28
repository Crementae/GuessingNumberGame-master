//
//  Alamofire + PromiseKit.swift
//  GuessingNumberGame
//
//  Created by Adisorn Chatnaratanakun on 3/27/2560 BE.
//  Copyright © 2560 Adisorn Chatnaratanakun. All rights reserved.
//

import Foundation
import ObjectMapper
import AlamofireObjectMapper
import Alamofire
import PromiseKit


extension DataRequest {
    
    
    public func responseObject<T: Mappable>() -> Promise<T> {
        
        let (promise, fulfill, reject) = Promise<T>.pending()
        
        // Use responseObject method of AlamofireObjectMapper
        responseObject { (response: DataResponse<T>) in
            
            switch response.result {
                
            case .success(let value):
                
                fulfill(value)
                
            case .failure(let error):
                
                guard let res = response.response else {
                    reject(error)
                    return
                }
                reject(HTTPClientError.ResponseError(statusCode: res.statusCode))
            }
        }
        return promise
    }
    
    public func responseObject<T: Mappable>(pathString: String ) -> Promise<T> {
        
        let (promise, fulfill, reject) = Promise<T>.pending()
        
        // Use responseObject method of AlamofireObjectMapper
        responseObject(keyPath: pathString) { (response: DataResponse<T>) in
            
            switch response.result {
                
            case .success(let value):
                
                fulfill(value)
                
            case .failure(let error):
                
                guard let res = response.response else {
                    reject(error)
                    return
                }
                reject(HTTPClientError.ResponseError(statusCode: res.statusCode))
            }
        }
        return promise
    }
    
    
    public func responseArray<T: Mappable>() -> Promise<[T]?> {
        
        let (promise, fullfil, reject) = Promise<[T]?>.pending()
        
        
        responseArray {
            (response: DataResponse<[T]>) in
            
            switch response.result {
                
            case .success(let value):
                fullfil(value)
                
            case .failure(let error):
                
                guard let res = response.response else {
                    reject(error)
                    return
                }
                reject(HTTPClientError.ResponseError(statusCode: res.statusCode))
            }
        }
        return promise
    }
    
    public func responseArray<T: Mappable>(pathString: String) -> Promise<[T]?> {
        
        let (promise, fulfill, reject) = Promise<[T]?>.pending()
        
        // Use responseObject method of AlamofireObjectMapper
        responseArray(keyPath: pathString) { (response: DataResponse<[T]>) in
            
            switch response.result {
                
            case .success(let value):
                
                fulfill(value)
                
            case .failure(let error):
                
                guard let res = response.response else {
                    reject(error)
                    return
                }
                reject(HTTPClientError.ResponseError(statusCode: res.statusCode))
            }
        }
        return promise
    }
}
