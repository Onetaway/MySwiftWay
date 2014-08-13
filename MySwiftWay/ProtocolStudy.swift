//
//  ProtocolStudy.swift
//  MySwiftWay
//
//  Created by Onet away on 8/13/14.
//  Copyright (c) 2014 Onet away. All rights reserved.
//

import UIKit

protocol FullyNamed {
    var fullName: String { get }
}

struct PersonProtocol: FullyNamed {
    var fullName: String
}

class StarShip: FullyNamed {
    var prefix: String?
    var name: String
    
    init(name: String, prefix: String? = nil) {
        self.name = name
        self.prefix = prefix
    }
    
    var fullName: String {
        return (prefix != nil ? prefix! + " " : "") + name
    }
}

protocol RandomNumberGennerator {
    func random() -> Double
}

class LinearCongruentialGenerator: RandomNumberGennerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    
    func random() -> Double {
        lastRandom = ((lastRandom * a + c) % m)
        return lastRandom / m
    }
}






























