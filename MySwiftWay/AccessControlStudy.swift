//
//  AccessControlStudy.swift
//  MySwiftWay
//
//  Created by sanlen on 8/26/14.
//  Copyright (c) 2014 Onet away. All rights reserved.
//

import UIKit

// Swift 访问控制层级的指导规则：高访问层级的实体不能定义在低访问层级的实体内

// 默认的访问权限是 internal

public class SomePublicClass {          // explicitly public class
    public var somePublicProperty = 0   // explicitly public class member
    var someInternalProperty = 0        // implicitly internal class member
    private func somePrivateMethod() {} // explicitly private class member
}

class SomeInternalClass {               // implicitly internal class
    var someInternalProperty = 0        // implicitly internal class member
    private func somePrivateMethod() {} // explicitly private class member
}

private class SomePrivateClass {    // explicitly private class
    var somePrivateProperty = 0     // implicitly private class member
    func somePrivateMethod() {}     // implicitly private class member
}

// 元组类型的访问控制，级别低的优先。比如元组的两个元素，一个是 internal ，另一个是
// private，则元组的访问控制权限就是 private

// Subclassing
// 子类的访问权限不能超过父类，但是子类可以覆盖父类的方法，从而修改方法的访问权限
public class A {
    private func someMethod() {}
}

internal class B: A {
    override internal func someMethod() {
        super.someMethod()
    }
}

// Getters And Setters
struct TrackedString {
    private(set) var numberOfEdits = 0
    var value: String = "" {
        didSet {
            numberOfEdits++
        }
    }
}




























