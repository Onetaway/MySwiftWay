//
//  InitializerStudy.swift
//  MySwiftWay
//
//  Created by sanlen on 8/11/14.
//  Copyright (c) 2014 Onet away. All rights reserved.
//

import UIKit

// 类和结构的stored properties必须在创建的时候设置初始值
struct Fahrenheit {
    var temperature: Double
    
    init() {
        temperature = 32.0
    }
}

// 自定义初始化，如果不想使用外部参数名初始化，使用 下划线_
struct Celsius {
    var temperatureInCelsius: Double
    
    // 前一个是外部参数名，后一个是内部参数名
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
    
    init(_ celsius: Double) {
        temperatureInCelsius = celsius
    }
}

// 如果没有写外部参数名，Swift会自动提供，并使其等于内部参数名
struct Color {
    let red, green, blue: Double
    
    init(red: Double, green: Double, blue: Double) {
        self.red = red
        self.green = green
        self.blue = blue
    }
    
    init(white: Double) {
        red = white
        green = white
        blue = white
    }
}

// Optional property are automatically initialized with a value of nil
// 在初始化的时候修改不可变属性
class SurveyQuestion {
    let text: String
    var response: String?
    
    init(text: String) {
        self.text = text
    }
    
    func ask() {
        println(text)
    }
}


// 值类型的初始化代理，就是初始化函数可以调用其他的初始化函数来初始化
// 因为值类型(结构体和枚举)不支持继承，所以他们的初始化代理相对简单一些 使用self.init



// 类的继承和初始化
class Vehicle2 {
    var numberOfWheels = 0
    var description: String {
        return "\(numberOfWheels) wheel(s)"
    }
}

class Bicycle2: Vehicle2 {
    override init() {
        super.init()
        numberOfWheels = 2
    }
}



class Food {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    convenience init() {
        self.init(name: "[Unnamed]")
    }
}

class RecipeIngredient: Food {
    
    var quantity: Int
    
    // 子类的指定初始化方法调用父类的指定初始化方法
    init(name: String, quantity: Int) {
        self.quantity = quantity
        super.init(name: name)
    }
    
    override convenience init(name: String) {
        self.init(name: name, quantity: 1)
    }
}

class ShoppingListItem: RecipeIngredient {
    var purchased = false
    var description: String {
        var output = "\(quantity) x \(name)"
            output += purchased ? "打勾" : "打叉"
            
        return output
    }
}

// Required Initializers。在初始化方法前面加required关键字，表示所有子类都需要实现这个初始化方法

class SomeClass2 {
    required init() {
        
    }
}

class SomeSubClass2: SomeClass2 {
    required init() {
        
    }
}



// 使用闭包或者函数，设置默认属性值
struct Checkerboard {
    let boardColors: [Bool] = {
        var temporaryBoard = [Bool]()
        var isBlack = false
        
        for i in 1...10 {
            for j in 1...10 {
                temporaryBoard.append(isBlack)
                isBlack = !isBlack
            }
            
            isBlack = !isBlack
        }
        return temporaryBoard
    }()
    
    func squareIsBlackAtRow(row: Int, column: Int) -> Bool {
        return boardColors[(row * 10) + column]
    }
    
}
































