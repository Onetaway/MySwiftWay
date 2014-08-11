//
//  AppDelegate.swift
//  MySwiftWay
//
//  Created by sanlen on 8/11/14.
//  Copyright (c) 2014 Onet away. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
                            
    var window: UIWindow?
    
    func classAndStrctureStudy() {
        // Class and Structure
        let someResolution = Resolution()
        let someVideoMode = VideoMode()
        
        println("The width of someResolution is \(someResolution.width)")
        println("The height of someResolution is \(someResolution.height)")
        
        println("The width of someVideoMode is \(someVideoMode.resolution.width)")
        
        someVideoMode.resolution.width = 1280;
        println("The new width of someVidoeMode is \(someVideoMode.resolution.width)")
        
        // 只有结构体才有 Memberwise Initializers
        let vga = Resolution(width: 640, height: 480)
        println("The width of vga is \(vga.width)")
        println("The height of vga is \(vga.height)")
        
        // 结构和枚举都是值类型的，Swift中的所有基本数据类型都是值类型，包括:integers, floating-point numbers, Booleans, strings, arrays and dictionaries，因为它们的背后实现都是结构体
        let hd = Resolution(width: 1920, height: 1080)
        var cinema = hd // new copy assign to cinema
        cinema.width = 2048
        println("cinema is now \(cinema.width) pixels wide")
        println("hd is still \(hd.width) pixels wide")
        
        // 但是类是引用类型的
        let tenEighty = VideoMode();
        tenEighty.resolution = hd;
        tenEighty.interlaced = true;
        tenEighty.name = "1080i"
        tenEighty.frameRate = 25.0
        
        let alsoTenEighty = tenEighty;
        alsoTenEighty.frameRate = 30.0
        
        println("The frameRate of tenEighty is now \(tenEighty.frameRate)")
        
        // Identity Operators for class
        if tenEighty === alsoTenEighty {
            println("tenEighty and alsoTenEighty refer to the same ViewMode instance")
        } else {
            println("tenEighty and alsoTenEighty refer to different ViewMode instance")
        }
        
        // 应该用class还是structure，当出现下述情况时，可以考虑使用结构
        // 1. 需要封装相对少量的简单的数组类型
        // 2. 需要值拷贝而不是引用拷贝的时候
        // 3. 结构里面的属性本身也需要是值类型
        // 4. 结构体不需要从其他已经存在的类型中继承属性或者行为
        
        // Assignment and Copy Behavior for Strings, Arrays and Dictionaries
        // Swift的String Array Dictionary 都是用结构体实现的，所以他们赋值给其他变量或者常量时，是拷贝了一份全新的变量，而不是传递引用。这点和 NSString NSArray NSDictionary不同，特别注意。
        
        //TODO: 特别注意：在你的代码中，看起来是每一次赋值的时候都进行拷贝，但是Swift实际上只会在需要的时候进行真正的拷贝，这是因为Swift管理了所有的值拷贝并进行的优化。
    }
    
    func propertyStudy() {
        
        // 这一步初始化之后，DataManager里面的 importer属性并没有被创建，因为被标记为lazy
        let manager = DataManager();
        
        manager.data.append("Some data")
        manager.data.append("Some more data")
        
        // 当第一次使用到importer的时候，importer才会被创建
        println(manager.importer.fileName)
    }
    
    func application(application: UIApplication!, didFinishLaunchingWithOptions launchOptions: NSDictionary!) -> Bool {
        
        //classAndStrctureStudy();
        
        propertyStudy();
        
        return true
    }

    func applicationWillResignActive(application: UIApplication!) {
        
    }

    func applicationDidEnterBackground(application: UIApplication!) {
      
    }

    func applicationWillEnterForeground(application: UIApplication!) {
        
    }

    func applicationDidBecomeActive(application: UIApplication!) {
        
    }

    func applicationWillTerminate(application: UIApplication!) {
        
    }


}

