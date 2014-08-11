//
//  PropertiesStudy.swift
//  MySwiftWay
//
//  Created by sanlen on 8/11/14.
//  Copyright (c) 2014 Onet away. All rights reserved.
//

// 只有类和结构能有Stored Properties(用来存储一个值)
// 类，结构和枚举都可以有Computed Properties(用来计算一个值)

import UIKit

struct FixedLengthRange {
    var firstValue: Int
    let length: Int
    
}

var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)


class DataImporter {
    var fileName = "data.txt"
}

class DataManager {
    lazy var importer = DataImporter()
    var data = [String]()
}

// Computed Properties
// 计算属性提供一个getter方法和一个可选的setter方法，来间接地设置其他的属性和值

struct Point {
    var x = 0.0
    var y = 0.0
}

struct Size {
    var width = 0.0
    var height = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size();
    
    // Computed Properties
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            
            return Point(x: centerX, y: centerY)
        }
        
        /*set(newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }*/
        
        // Shorthand for set 
        set {
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
        }
        
        
    }
}

// 如何实现read-only的computed properties，只有get方法就可以了. Computed properties只能使用var 关键字声明，即使是只读的computed properties，也必须只能用 var.

struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double {
        return width * height * depth
    }
}

// Property Observer在每次某个属性的值被设置的时候调用，即使新的值和属性的当前值相同的时候，property observer也会被调用。可以为除了lazy stored property之外的任何stored property 添加 property observer

// 属性初始化的时候willSet 和 didSet 是不会被调用的。
class StepCounter {
    var totalSteps: Int = 0 {
        
        willSet(newTotalSteps) {
            println("About to set totalSteps to \(newTotalSteps)")
        }
        
        didSet {
            if totalSteps > oldValue {
                println("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}

// Type Property. 计算型类型属性只能使用var , 值类型的存储型计算属性可以使用var 或者 let

// 对于值类型(结构、枚举)，可以定义存储型属性和计算机型属性
struct SomeStructure {
    
    static var storedTypeProperty = "Some value"
    static var computedTypeProperty: Int {
        return 6
    }
}

enum SomeEnumeration {
    static var storedTypeProperty = "Some value"
    static var computedTypeProperty: Int {
        return 8
    }
}

// 对于类，只能定义计算型属性
class SomeClass {
    class var computedTypeProperty: Int {
        return 42
    }
}














































