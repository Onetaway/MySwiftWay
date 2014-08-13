//
//  optionalChainingStudy.swift
//  MySwiftWay
//
//  Created by sanlen on 8/13/14.
//  Copyright (c) 2014 Onet away. All rights reserved.
//

import UIKit

class PersonOptionalChaining {
    var residence: ResidenceOptionalChaining?
    
    init() {
        
    }
}

class ResidenceOptionalChaining {
    
    var rooms = [Room]()
    var numberOfRooms: Int {
        return rooms.count
    }
    
    init() {
        
    }
    
    subscript(i: Int) -> Room {
        get {
            return rooms[i]
        }
        
        set {
            rooms[i] = newValue
        }
    }
    
    // 该函数实际返回的是 ()，也就是一个空的元组
    func printNumberOfRooms() {
        println("The number of rooms is \(numberOfRooms)")
    }
    
    var address: Address?
}

class Room {
    let name: String
    init(name: String) {
        self.name = name
    }
}

class Address {
    
    var buildingName: String?
    var buildingNumber: String?
    var street: String?
    
    init() {
        
    }
    
    func buildingIdentifier() -> String? {
        
        if buildingName != nil {
            return buildingName
        } else if buildingNumber != nil {
            return buildingNumber
        } else {
            return nil
        }
    }
}


































