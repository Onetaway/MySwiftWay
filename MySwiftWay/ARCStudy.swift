//
//  ARCStudy.swift
//  MySwiftWay
//
//  Created by sanlen on 8/12/14.
//  Copyright (c) 2014 Onet away. All rights reserved.
//

import UIKit

// strong reference cycle demo
class Person {
    let name: String
    
    init(name: String) {
        self.name = name
        println("\(name) is being initialized")
    }
    
    // 强引用了Apartment实例
    var apartment: Apartment?
    
    deinit {
        println("\(name) is being deinitialized")
    }
}


class Apartment {
    
    let number: Int
    
    init(number: Int) {
        self.number = number
        println("Apartment #\(number) is being initialized")
    }
    
    weak var tenant: Person?
    
    deinit {
        println("Apart #\(number) is being deinitialized")
    }
}

// 情形1: 两个属性都可能是nil(用weak), weak适用于在将来可能成为nil的引用，每一个weak引用必须是一个optional type
// 情形2: 一个属性可以是nil，但是另一个属性不能是nil(用unowned)。unowned适用于一旦初始化就永远不可能成为nil的引用，因此unowned引用必须是non-optional type
// 情形3: 两个属性都不能为nil. 一个类用 unowned 属性，另一个属性用 implicitly unwrappered optional type

class Customer {
    
    let name: String
    var card: CreditCard?
    
    init(name: String) {
        self.name = name
        println("\(name) is being initialized")
    }
    
    deinit {
        println("\(name) is being deinitialized")
    }
}

class CreditCard {
    
    let number: UInt64
    unowned let customer: Customer
    
    init(number: UInt64, customer: Customer) {
        self.number = number
        self.customer = customer
        println("Card #\(number) is being initialized")
    }
    
    deinit {
        println("Card #\(number) is being deinitialized")
    }
}


// 情形3 Demo
class Country {
    
    let name: String
    let capitalCity: City!
    
    init(name: String, capitalName: String) {
        self.name = name
        self.capitalCity = City(name: capitalName, country: self)
    }
}

class City {
    
    let name: String
    unowned let country: Country
    
    init(name: String, country: Country) {
        self.name = name
        self.country = country
    }
}






























