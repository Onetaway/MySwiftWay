//
//  ExtensionStudy.swift
//  MySwiftWay
//
//  Created by sanlen on 8/13/14.
//  Copyright (c) 2014 Onet away. All rights reserved.
//

import UIKit

extension Double {
    
    var km: Double { return self * 1000.0 }
    var m: Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1000.0 }
    var ft: Double { return self / 3.28084 }
}

struct SizeExtension {
    var width = 0.0, height = 0.0
}
struct PointExtension {
    var x = 0.0, y = 0.0
}
struct RectExtension {
    var origin = PointExtension()
    var size = SizeExtension()
}

extension RectExtension {
    init(center: PointExtension, size: SizeExtension) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        
        self.init(origin:PointExtension(x: originX, y: originY), size: size)
    }
}


extension Int {
    func repetitions(task: () -> ()) {
        for i in 0 ..< self {
            task()
        }
    }
    
    // 可以修改自身
    mutating func square() {
        self = self * self
    }
    
    // 添加下标
    subscript(var digitIndex: Int) -> Int {
        var decimalBase = 1
            while digitIndex > 0 {
                decimalBase *= 10
                --digitIndex
            }
            return (self / decimalBase) % 10
    }
    
    // 添加 Nested Types
    
    enum Kind {
        case Negative, Zero, Positive
    }
    
    var kind: Kind {
        switch self {
        case 0:
            return .Zero
        case let x where x > 0:
            return .Positive
        default:
            return .Negative
            }
    }
}




































