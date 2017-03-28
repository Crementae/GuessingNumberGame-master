//
//  Random.swift
//  GuessingNumberGame
//
//  Created by Adisorn Chatnaratanakun on 3/27/2560 BE.
//  Copyright © 2560 Adisorn Chatnaratanakun. All rights reserved.
//

import Foundation
import ObjectMapper

class Random: Mappable {
    
    var randomNumber: RandomNumber?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        
        randomNumber <- map["random"]
        
    }
    
    class RandomNumber: Mappable {
        
        var data: [Int]?
        
        required convenience init?(map: Map) {
            self.init()
        }
        
        func mapping(map: Map) {
            data <- map["data"]
        }
    }
    
}

