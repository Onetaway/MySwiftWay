//
//  ArrayStudy.swift
//  MySwiftWay
//
//  Created by sanlen on 8/11/14.
//  Copyright (c) 2014 Onet away. All rights reserved.
//

import UIKit

struct Resolution {
    
    // Type inferred to be Int
    var width = 0
    var height = 0
}

class VideoMode: NSObject {
    
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String? // optional type default value is nil
}









































