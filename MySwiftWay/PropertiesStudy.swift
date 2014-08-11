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
        
    }
}




































