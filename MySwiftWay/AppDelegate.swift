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
    
    //TODO: 学习实例
    
    func basicStudy() {
        // Tuples
        let http404Error = (404, "Not Found")
        println(http404Error)
        let (statusCode, statusMessage) = http404Error
        println("The status code is \(statusCode)")
        println("The status message is \(statusMessage)")
    
        let (justTheStatusCode, _) = http404Error
        println("The status code is \(justTheStatusCode)")
        
        // access value
        println("The status code is \(http404Error.0)")
        println("The status meaage is \(http404Error.1)")
        
        // 命名元组
        let http200Status = (statusCode: 200, description: "OK")
        println("The status code is \(http200Status.statusCode)")
        println("The status message is \(http200Status.description)")
    
        // Optionals
        let possibleNumber = "123"
        let convertedNumber = possibleNumber.toInt()
        
        // nil. nil不能用在 non-optional 的常量或者变量上
        var serverResponseCode: Int? = 404
        serverResponseCode = nil
        
        // optional 变量没有赋值的时候，自动默认地被设置为 nil
        // Swift 的 nil 和 ObjC 的 nil 不一样。Swift 的 nil 不是一个指针，它只是表示一个类型缺少一个值
        // Optional 的任何类型都可以被设置为 nil，而不再仅仅是对象类型
        var surveyAnswer: String?
        
        // 强制解包
        if convertedNumber != nil {
            println("convertedNumber contains some integer value \(convertedNumber!)")
        }
        
        // Optional Binding
        if let actualNumber = possibleNumber.toInt() {
            println("\(possibleNumber) has an integer value of \(actualNumber)")
        } else {
            println("\(possibleNumber) could not be converted to an integer")
        }
        
        // 隐式解包
        let possibleString: String? = "An optional string"
        println(possibleString!)
        let assumedString: String! = "An implicitly unwrapped optional string"
        println(assumedString)
        
        if assumedString != nil {
            println(assumedString)
        }
        
        if let definiteString = assumedString {
            println(definiteString)
        }
        
        // 断言
        let age = -3
        //assert(age >= 0, "A person's age cannot be less than zero")
        
    }
    
    func basicOperatorStudy() {
        
        // Nil Coalescing Operator (a ?? b)
        // 解释: a 必须是一个 optional type，b 必须是和 a 里面保存的值类型相同的一个值
        // ?? 运算符所用: 如果 a 有值，那么就 unwrapping a；如果 a 为 nil，就返回 b
        // a ?? b 等价于 a != nil ? a! : b。短路原则同样适用
        let defaultColorName = "red"
        var userDefinedColor: String?
        var colorNameToUse = userDefinedColor ?? defaultColorName
        println(colorNameToUse)
        userDefinedColor = "green"
        colorNameToUse = userDefinedColor ?? defaultColorName
        println(colorNameToUse)
        
        // Range Operator ...   ..<
        for index in 1...5 {
            println("\(index) times 5 is \(index * 5)")
        }
        
        let names = ["Anna", "Ales", "Brian", "Jack"]
        let count = names.count
        for i in 0 ..< count {
            println("Person \(i + 1) is called \(names[i])")
        }
    }
    
    // 完成
    func collectionTypeStudy() {
        // Array
        var shoppingList = ["Eggs", "Milk"]
        println("The shopping list contains \(shoppingList.count) items")
        
        // Accessing and modify array
        if shoppingList.isEmpty {
            println("The shopping list is empty")
        } else {
            println("The shopping list is not empty")
        }
        
        shoppingList.append("Flour")
        shoppingList += ["Baking Powder"]
        shoppingList += ["Chocolate Spread", "Cheese", "Butter"]
        println("The shopping list now contains \(shoppingList.count) items")
        
        var firstItem = shoppingList[0]
        println(firstItem)
        
        shoppingList[0] = "Six eggs"
        println(shoppingList)
        
        shoppingList[4...6] = ["Bananas", "Apples"]
        println(shoppingList)
        
        shoppingList.insert("Maple Syrup", atIndex: 0)
        println(shoppingList)
        
        let mapLeSyrup = shoppingList.removeAtIndex(0)
        println(shoppingList)
        
        firstItem = shoppingList[0]
        println(firstItem)
        
        let apples = shoppingList.removeLast()
        println(shoppingList)
        
        // Iterating Over an Array
        for item in shoppingList {
            println(item)
        }
        
        for (index, value) in enumerate(shoppingList) {
            println("Item: \(index + 1): \(value)")
        }
        
        // Creating and Initializing an Array
        var someInts = [Int]()
        println("someInts is of type [Int] with \(someInts.count) items.")
        someInts.append(3)
        println(someInts)
        someInts = []
        println(someInts)
        
        var threeDoubles = [Double](count: 3, repeatedValue: 0.0)
        println(threeDoubles)
        var anotherThreeDoubles = [Double](count:3, repeatedValue: 2.5)
        println(anotherThreeDoubles)
        
        var sixDoubles = threeDoubles + anotherThreeDoubles
        println(sixDoubles)
        
        // Dictionary
        var airports = ["TYO": "Tokyo", "DUB": "Dublin"]
        
        // Accessing and modify a dictionary
        println("The airports dictionary contains \(airports.count) items")
        if airports.isEmpty {
            println("The airport dictionary is empty")
        } else {
            println("The airport dictionary is not empty")
        }
        
        airports["LHR"] = "London" // 加在了第0个位置
        println(airports)
        
        airports["LHR"] = "Lodon Heathrow"
        println(airports)
        
        if let oldValue = airports.updateValue("Dublin International", forKey: "DUB") {
            println("The old value for DUB is \(oldValue)")
        }
        println(airports)
        
        if let airportName = airports["DUB"] {
            println("The airportName is \(airportName)")
        } else {
            println("The airport is not in the airports dictionary")
        }
        
        airports["APL"] = "Apple International"
        println(airports)
        
        airports["APL"] = nil
        println(airports)
        
        if let removedValue = airports.removeValueForKey("DUB") {
            println("removedValue is \(removedValue)")
        } else {
            println("The aiport is not in the airport dictionary")
        }
        
        // 遍历一个字典，对字典遍历的时候，每一个 item 都被看成是一个 Tuple
        for (airportCode, airportName) in airports {
            println("\(airportCode): \(airportName)")
        }
        // 只遍历 key
        for airportCode in airports.keys {
            println("Airport code: \(airportCode)")
        }
        // 只遍历 values
        for airportName in airports.values {
            println("Airport name: \(airportName)")
        }
        // 只使用 key 创建数组
        let airportCodes = [String](airports.keys)
        println(airportCodes)
        // 只使用 value 创建数组
        let airportNames = [String](airports.values)
        println(airportNames)
        
        // 创建一个空的字典
        var namesOfIntegers = [Int: String]()
        println(namesOfIntegers)
        namesOfIntegers[16] = "sixteen"
        println(namesOfIntegers)
        namesOfIntegers = [:] // 清空字典
        println(namesOfIntegers)
    
    }
    
    // 完成
    func subscriptStudy() {
        let threeTimesTable = TimesTable(multiplier: 3)
        println("Six times three is \(threeTimesTable[6])")
        
        // 下标用法
        var numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
        numberOfLegs["bird"] = 2
        println(numberOfLegs)
        
        // Subscript Options
        var matrix = Matrix(rows: 2, columns: 2)
        matrix[0, 1] = 1.5
        matrix[1, 0] = 3.2
        
        let someValue = matrix[2, 2]
    }
    
    func enumStudy() {
        // Swift 的枚举可以指定任意类型，与 C 和 ObjC不同，这些枚举成员变量不被赋予默认的
        // 0, 1, 2, 3，而是全新的类型
        enum CompassPoint {
            case North
            case South
            case East
            case West
        }
        
        enum Planet {
            case Mercury, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
        }
        
        var directionToHead = CompassPoint.West
        directionToHead = .East
        directionToHead = .South
        
        switch directionToHead {
        case .North:
            println("North")
        case .South:
            println("South")
        case .West:
            println("West")
        case .East:
            println("East")
        }
        
        let somePlanet = Planet.Mars
        switch somePlanet {
        case .Earth:
            println("Mostly harmless")
        default:
            println("Not a safe place for humans")
        }
        
        // Associated Values
        enum Barcode {
            case UPCA(Int, Int, Int, Int)
            case QRCode(String)
        }
        var productBarcode = Barcode.UPCA(8, 85998, 51226, 8)
        productBarcode = .QRCode("SDFJFHGJGKFGFH")
        switch productBarcode {
        case .UPCA(let numberSystem, let manufacturer, let product, let check):
            println("UPC-A: \(numberSystem), \(manufacturer), \(product), \(check).")
        case .QRCode(let productCode):
            println("QR code: \(productCode)")
        }
        // 如果所有的关联值都是 let 或者 var ，则可以在 case 后面写 let 或 var作为简写方式
        switch productBarcode {
        case let .UPCA(numberSystem, manufacturer, product, check):
            println("UPC-A: \(numberSystem), \(manufacturer), \(product), \(check).")
        case let .QRCode(productCode):
            println("QR code: \(productCode)")
        }
        
        // Raw Values
        enum Planet2: Int {
            case Mercury = 1, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
        }
        let earthsOrder = Planet2.Earth.toRaw()
        println("earthsOrder's raw value is \(earthsOrder)")
        let possiblePlanet = Planet2.fromRaw(7) // 返回的是一个 optional type
        println("possiblePlanet from raw is \(possiblePlanet)")
        
        let positionToFind = 9
        if let somePlanet = Planet2.fromRaw(positionToFind) {
            switch somePlanet {
            case .Earth:
                println("Mostly harmless")
            default:
                println("Not a safe place for humans")
            }
        } else {
            println("There isn't a planet at the position \(positionToFind)")
        }
        
    }
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
        
        // Computed Properties
        var square = Rect(origin: Point(x: 0.0, y: 0.0), size: Size(width: 10.0, height: 10.0))
        let initialSquareCenter = square.center
        println("The initialSquareCenter is (\(initialSquareCenter.x), \(initialSquareCenter.y))")
        
        square.center = Point(x: 15.0, y: 15.0)
        println("square.origin is now at (\(square.origin.x), \(square.origin.y))")
        
        // Read-only computed 
        let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
        println("fourByFiveByTwo's volume is \(fourByFiveByTwo.volume)")
        
        // Property Observer
        let stepCounter = StepCounter()
        stepCounter.totalSteps = 200
        stepCounter.totalSteps = 360
        stepCounter.totalSteps = 896
        
        // Type Properties
        println(SomeClass.computedTypeProperty)
        println(SomeStructure.storedTypeProperty)
        
        SomeStructure.storedTypeProperty = "Another value"
        println(SomeStructure.storedTypeProperty)
    }
    func inheritanceStudy() {
        
        let someVehicle = Vehicle()
        println("Vehicle: \(someVehicle.description)")
        
        let bicycle = Bicycle()
        bicycle.hasBasket = true
        bicycle.currentSpeed = 15.0
        println("Bicycle: \(bicycle.description)")
        
        let tandem = Tandem()
        tandem.hasBasket = true
        tandem.currentNumberOfPassengers = 2
        tandem.currentSpeed = 22.0
        println("Tandem: \(tandem.description)")
        
        let train = Train();
        train.makeNosie();
        
        /*let car = Car();
        car.currentSpeed = 25.0
        car.gear = 3
        println("Car: \(car.description)")
        
        let automatic = AutomaticCar()
        automatic.currentSpeed = 35.0
        println("AutomaticCar: \(automatic.description)")*/
        
        
    }
    func initializerStudy() {
        
        var f = Fahrenheit();
        println("The default temperature is \(f.temperature) Fahrenheit")
        
        let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
        let freezingPointOfWater = Celsius(fromKelvin: 273.15)
        
        let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)
        let halfGray = Color(white: 0.5)
        //let veryGreen = Color(0.0, 1.0, 0.0) // compile-error require external parameter names
        let bodyTemperature = Celsius(37.0)
        
        let cheeseQuestion = SurveyQuestion(text: "Do you like cheese?")
        cheeseQuestion.ask()
        cheeseQuestion.response = "Yes, I do like cheese"
        
        // 类的继承和初始化
        let vehicle2 = Vehicle2()
        println("Vehicle2: \(vehicle2.description)")
        let bicycle2 = Bicycle2()
        println("Bicycle2: \(bicycle2.description)")
        let namedMeat = Food(name: "Bacon")
        println("namedMeat's name is \(namedMeat.name)")
        let mysteryMeat = Food()
        println("mysteryMeat's name is \(mysteryMeat.name)")
        let oneMysteryItem = RecipeIngredient()
        let oneBacon = RecipeIngredient(name: "Bacon")
        let sixEggs = RecipeIngredient(name: "Eggs", quantity: 6)
        
        var breakfastList = [ShoppingListItem(), ShoppingListItem(name: "Bacon"), ShoppingListItem(name: "Eggs", quantity: 6)]
        breakfastList[0].name = "Orange juice"
        breakfastList[0].purchased = true
        
        for item in breakfastList {
            println(item.description)
        }
        
        // 使用闭包给属性设置默认值
        let board = Checkerboard()
        println(board.squareIsBlackAtRow(0, column: 1))
        println(board.squareIsBlackAtRow(9, column: 9))
        
    }
    func deinitializationStudy() {
        var playerOne: Player? = Player(coins: 100)
        println("A new player has joined the game with \(playerOne!.coinsInPurse) coins")
        println("There are now \(Bank.coinsInBank) coins left in the bank")
        playerOne!.winCoins(2000)
        println("PlayerOne won 2000 coins and now has \(playerOne!.coinsInPurse) coins")
        println("The bank now only has \(Bank.coinsInBank) coins left")
        
        playerOne = nil
        println("PlayerOne has left the game")
        println("The bank now has \(Bank.coinsInBank) coins")
    
    }
    func arcStudy() {
        
        var reference1: Person?
        var reference2: Person?
        var reference3: Person?
        
        // Strong reference from reference1 to the Person instance. reference -> Person instance
        reference1 = Person(name: "John Appleseed")
        reference2 = reference1
        reference3 = reference1
        // 现在有3个strong reference 指向"John Appleseed"
        
        reference1 = nil
        reference2 = nil
        reference3 = nil
        // 当3个强引用全部为nil时，arc才会释放"John Appleseed"实例
        
        // 强循环引用实例
        var john: Person?
        var number73: Apartment?
        
        john = Person(name: "John")
        number73 = Apartment(number: 73)
        
        // 产生强引用循环，注意发生引用循环的位置，是john里面的apartment成员变量
        // 和number73里面的tenant成员变量
        john!.apartment = number73
        number73!.tenant = john
        
        john = nil
        number73 = nil
        
        // unowned示例
        var mike: Customer?
        mike = Customer(name: "Mike")
        mike!.card = CreditCard(number: 121212121212, customer: mike!)
        mike = nil
        
        // 情形3
        var country = Country(name: "Canada", capitalName: "Ottawa")
        println("\(country.name)'s capital city is called \(country.capitalCity.name)")
    }
    func closureStudy() {
        let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
        
        // 使用类似函数指针写法
        func backwards(s1: String, s2: String) -> Bool {
            return s1 > s2
        }
        var reversed = sorted(names, backwards)
        println("函数指针写法: \(reversed)")
        
        // 闭包写法
        reversed = sorted(names, { (s1: String, s2: String) -> Bool in
            s1 < s2
        })
        println("完整闭包写法: \(reversed)")
        
        // 从上下文进行类型推断写法，函数返回值也可以推断
        reversed = sorted(names, { s1, s2 in return s1 > s2 })
        println("类型推断写法: \(reversed)")
        
        // 默认参数写法
        reversed = sorted(names, { return $0 > $1 })
        println("$0 $1写法: \(reversed)")
        
        // 运算符函数写法
        reversed = sorted(names, <)
        println("运算符函数写法: \(reversed)")
        
        // 尾闭包，函数调用的最后一个参数是闭包的时候，可以把这个闭包写在函数圆括号的后面(外面)，而不用写在圆括号里面
        reversed = sorted(names) { return $0 > $1}
        println("尾闭包写法: \(reversed)")
        
        let digitNames = [0: "Zero", 1: "One", 2: "Two", 3: "Three",
            4: "Four", 5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"]
        let numbers = [16, 58, 510]
        let string = numbers.map {
            (var number) -> String in
            var output = ""
            
            while number > 0 {
                output = digitNames[number % 10]! + output
                number /= 10
            }
            
            return output
        }
        println(string)
        
        // Capture Values。下面这个函数返回的是一个函数
        func makeIncrementor(forIncrement amount: Int) -> () -> Int {
            
            var runningTotal = 0
            
            func incrementor() -> Int {
                runningTotal += amount
                return runningTotal
            }
            
            return incrementor
        }
        let incrementByTen = makeIncrementor(forIncrement: 10)
        
        // 闭包没有修改值的时候，它会得到一份该值的拷贝
        // 闭包修改了某个值的时候，它持有对该值的引用
        println("\(incrementByTen())")
        println("\(incrementByTen())")
        println("\(incrementByTen())")
        
        // functions 和 closure 是引用类型
        
        
        
    }
    
    // 完成
    func optionalChainingStudy() {
        
        // Optional Chaining as an Alternative to Forced Unwrapping
        let john = PersonOptionalChaining()
        //john.residence = ResidenceOptionalChaining()
        //let roomCount = john.residence!.numberOfRooms  // runtime error
        if let roomCount = john.residence?.numberOfRooms {
            println("John's residence has \(roomCount) rooms")
        } else {
            println("Unable to retrieve the number of rooms")
        }
        
        // Accessing Properties Through Optional Chaining
        let someAddress = Address()
        someAddress.buildingNumber = "29"
        someAddress.buildingName = "Acacia Road"
        john.residence?.address = someAddress
        
        // Calling Methods Through Optional Chaining
        // 下面 printNumberOfRooms() 这个函数返回的不再是 Void，而是 Void?
        // 因为在 optional chaining 中的返回值总是 optional type 的
        if john.residence?.printNumberOfRooms() != nil {
            println("It was possible to print the number of rooms")
        } else {
            println("It was not possible to print the number of rooms")
        }
        
        if (john.residence?.address = someAddress) != nil {
            println("It was possible to set the address")
        } else {
            println("It was not possible to set the address")
        }
        
        // Access Subscript Through Optional Chaining
        if let firstRoomName = john.residence?[0].name {
            println("The first room is \(firstRoomName)")
        } else {
            println("Unable to retrieve the first room name")
        }
        john.residence?[0] = Room(name: "Bathroom") // 失败，因为 residence 现在还是 nil
        let johnHouse = ResidenceOptionalChaining()
        johnHouse.rooms.append(Room(name: "Living Room"))
        johnHouse.rooms.append(Room(name: "Kitchen"))
        john.residence = johnHouse
        
        if let firstNameRoom = john.residence?[0].name {
            println("First room name is \(firstNameRoom)")
        } else {
            println("Unable to retrieve the first room name")
        }
        
        // 字典中的 key 返回的是 optional type
        var testScores = ["Dave": [86, 67, 89], "Tim": [79, 94, 78]]
        testScores["Dave"]?[0] = 91
        testScores["Tim"]?[0]++
        testScores["Brian"]?[0] = 72
        println(testScores)
        
        // 连接多级 Optional Chain
        if let johnsStreet = john.residence?.address?.street {
            println("John's street name is \(johnsStreet)")
        } else {
            println("Unable to retrieve the address.")
        }
        
        let johnsAddress = Address()
        johnsAddress.buildingName = "The Larches"
        johnsAddress.street = "Laurel Street"
        john.residence!.address = johnsAddress
        
        if let johnsStreet = john.residence?.address?.street {
            println("John's street name is \(johnsStreet)")
        } else {
            println("Unable to retrieve the address.")
        }
        
        // Chaining on Methods With Optional Return Values
        if let buildingIdentifier = john.residence?.address?.buildingIdentifier() {
            println("John's building identifier is \(buildingIdentifier)")
        }
        
        if let beginsWithThe = john.residence?.address?.buildingIdentifier()?.hasPrefix("The") {
            if beginsWithThe {
                println("John's building identifier begins with \"The\" ")
            } else {
                println("John's building identifier does not begins with \"The\" ")
            }
        }
    }
    
    // 完成
    /*func typeCastingStudy() {
        let library = [Movie(name: "Casablanca", director: "Michael Curtiz"),
                       Song(name: "Blue Suede Shoes", artist: "Elvis Presley"),
                       Movie(name: "Citizen Kane", director: "Orson Welles"),
                       Song(name: "The One And Only", artist: "Chesney Hawkes"),
                       Song(name: "Never Gonna Give You Up", artist: "Rick Astley")]
        
        // Checking Type. 使用 is 关键字
        var movieCount = 0
        var songCount = 0
        for item in library {
            if item is Song {
                ++songCount
            } else if item is Movie {
                ++movieCount
            }
        }
        println("Media Library contains \(songCount) songs and \(movieCount) movies")
        
        // Downcasting 类型转换操作符 as
        for item in library {
            if let movie = item as? Movie {
                println("Movie: '\(movie.name)', dir.\(movie.director)")
            } else if let song = item as? Song {
                println("Song: '\(song.name)', by \(song.artist)")
            }
        }
        
        // AnyObject 可以表示任何一个类的实例
        // Any 可以表示除了函数之外的任何类型的实例(不仅仅只是类的实例)
        let someObjects: [AnyObject] = [Movie(name: "2001: A Space Odyssey", director: "Stanley Kubrick"),
                                        Movie(name: "Moon", director: "Duncan Jones"),
                                        Movie(name: "Alien", director: "Ridley Scott")]
        
        for object in someObjects {
            let movie = object as Movie
            println("Movie: '\(movie.name)', dir. \(movie.director)")
        }
        
        // even shorter 写法
        for movies in someObjects as [Movie] {
            println("更短的写法 Movie: '\(movies.name)', dir. \(movies.director)")
        }
        
        // Any 用法
        var things = [Any]()
        things.append(0)
        things.append(0.0)
        things.append(42)
        things.append(3.1415926)
        things.append("Hello")
        things.append((3.5, 6.3))
        things.append(Movie(name: "Ghostbusters", director: "Ivan Reitman"))
        
        for thing in things {
            switch thing {
            case 0 as Int:
                println("zero as an Int")
            case 0 as Double:
                println("zero as a Double")
            case let someInt as Int:
                println("an integer value of \(someInt)")
            case let someDouble as Double where someDouble > 0:
                println("a positive double value of \(someDouble)")
            case is Double:
                println("some other double value that I don't want to print")
            case let someString as String:
                println("a string value of \"\(someString)\"")
            case let (x, y) as (Double, Double):
                println("an (x, y) point at \(x), \(y)")
            case let movie as Movie:
                println("a movie called '\(movie.name)', dir.\(movie.director)")
            default:
                println("something else")
            }
        
        }
        
    }*/
    
    func extensionStudy() {
        
        // extension 没有名字。Swift 中的 extension 可以:
        // 1. 添加 computed properties 和 computed static properties
        // 2. 定义实例方法和类方法
        // 3. 提供新的构造函数
        // 4. 定义下标
        // 5. 定义和使用新的 nested types
        // 6. 让已经存在的类型遵守某个协议
        // 7. extension 可以给类添加新的函数，但是不能覆盖已经存在的函数
        
        // 添加 computed properties
        let oneInch = 25.4.mm
        println("One inch is \(oneInch) meters")
        let threeFeet = 3.ft
        println("Three feet is \(threeFeet) meters")
        
        // 添加构造函数
        let defaultRect = RectExtension()
        let memberwiseRect = RectExtension(origin: PointExtension(x: 2.0, y: 2.0), size: SizeExtension(width: 5.0, height: 5.0))
        let centerRect = RectExtension(center: PointExtension(x: 4.0, y: 4.0), size: SizeExtension(width: 3.0, height: 3.0))
    
        // 添加方法
        3.repetitions({
            println("Hello World")
        })
        3.repetitions() {
            println("GoodBye")
        }
        var someInt = 4
        someInt.square()
        println(someInt)
        
        // 添加下标
        746381295[0] // returns 5
        746381295[1] // returns 9
        746381295[2] // returns 2
        746381295[8] // returns 7
        
        // 添加 Nested Types
        
        
        
    
    
    }
    
    
    func accessControlStudy() {
        
    }
    
    func genericStudy() {
        func swapTwoValues<T>(inout a: T, inout b: T) {
            let temporaryA = a
            a = b
            b = temporaryA
        }
        
        var someInt = 3
        var anotherInt = 107
        swapTwoValues(&someInt, &anotherInt)
        println("someInt is now \(someInt)")
        println("anotherInt is now \(anotherInt)")
        
        var someString = "hello"
        var anotherString = "world"
        swapTwoValues(&someString, &anotherString)
        println("someString is now \(someString)")
        println("anotherString is now \(anotherString)")
    }
    func protocolStudy() {
        let john = PersonProtocol(fullName: "John Gates")
        println(john.fullName)
        var ncc1701 = StarShip(name: "Enterprise", prefix: "USS")
        println(ncc1701.fullName)
        
        // Method Requirements
        let generator = LinearCongruentialGenerator()

    }
    
    func application(application: UIApplication!, didFinishLaunchingWithOptions launchOptions: NSDictionary!) -> Bool {
        
        //basicStudy()
        //basicOperatorStudy()
        //classAndStrctureStudy()
        //propertyStudy()
        //inheritanceStudy()
        //initializerStudy()
        //deinitializationStudy()
        //arcStudy()
        //closureStudy()
        //enumStudy()
        //subscriptStudy()
        //collectionTypeStudy()
        //optionalChainingStudy()
        //typeCastingStudy()
        //extensionStudy()
        

        //accessControlStudy()
        //genericStudy()

        //protocolStudy()
        

        return true
    }



}






































