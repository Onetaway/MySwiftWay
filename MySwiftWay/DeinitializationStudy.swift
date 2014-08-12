//
//  Deinitialization.swift
//  MySwiftWay
//
//  Created by sanlen on 8/12/14.
//  Copyright (c) 2014 Onet away. All rights reserved.
//

import UIKit

// 析构函数只能用在类类型上

struct Bank {
    static var coinsInBank = 10000
    static func vendCoins(var numberOfCoinsToVend: Int) -> Int {
        numberOfCoinsToVend = min(numberOfCoinsToVend, coinsInBank)
        coinsInBank -= numberOfCoinsToVend
        return numberOfCoinsToVend
    }
    
    static func receiveCoins(coins: Int) {
        coinsInBank += coins
    }
}


class Player {
    
    var coinsInPurse: Int
    
    init(coins: Int) {
        coinsInPurse = Bank.vendCoins(coins)
    }
    
    func winCoins(coins: Int) {
        coinsInPurse += Bank.vendCoins(coins)
    }
    
    // 析构函数没有参数，没有圆括号
    deinit {
        Bank.receiveCoins(coinsInPurse)
    }
}








































