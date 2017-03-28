//
//  LibrayAPI.swift
//  GuessingNumberGame
//
//  Created by Adisorn Chatnaratanakun on 3/27/2560 BE.
//  Copyright © 2560 Adisorn Chatnaratanakun. All rights reserved.
//

import Foundation
import PromiseKit

class LibrayAPI: NSObject {
    
    private let apiServer: APIServer
    static let sharedInstance = LibrayAPI()
    
    override init() {
        apiServer = APIServer()
    }
    
    func generateNumber() -> Promise<Random> {
        return apiServer.generateRandomNumber()
    }
    
}
