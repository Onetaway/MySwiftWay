//
//  Inheritance.swift
//  MySwiftWay
//
//  Created by sanlen on 8/11/14.
//  Copyright (c) 2014 Onet away. All rights reserved.
//

// 继承学习

import UIKit

class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    
    func makeNosie() {
        // Do nothing
    }
}

class Bicycle: Vehicle {
    var hasBasket = false
}

class Tandem: Bicycle {
    var currentNumberOfPassengers = 0
}

// Override Methods
class Train: Vehicle {
    override func makeNosie() {
        println("Choo Choo")
    }
}

// Override Properties
class Car: Vehicle {
    var gear = 1
    override var description: String {
        return super.description + "in gear \(gear)"
    }
}


// Override Property Observer
class AutomaticCar: Car {
    override var currentSpeed: Double {
        
        didSet {
            gear = Int(currentSpeed / 10.0) + 1
        }
    }
}
































