//
//  ViewController.swift
//  TheBeginning
//
//  Created by MCS Devices on 11/30/17.
//  Copyright © 2017 MCS Devices. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    // MARK: Properties
    let constant: String = "Hi"
    var variable: String = "World!"
    let names = ["Moy", "Tracy", "Edgar", "Moisés"]
    

    // MARK: Functions
    
    func stringInterpolation () {
        print("\n- STRING INTERPOLATION")
        
        /// Type annotation colon, space followed by the type -> (: Type) (All the next ones are String)
        var red, green, blue: String
        
        red = "rojo"
        green = "verde"
        blue = "azul"
        
        /* String interpolation */
        print("My colors are: \(red), \(green)", terminator: " ")
        print("and \(blue)")
    }
    
    func closuresExamples () {
        print("\n- CLOSURES")
        /// Closures
        func backward(_ s1: String, _ s2: String) -> Bool {
            return s1 > s2
        }
        
        let reversedNames = names.sorted(by: backward)
        print("Reversed names: \(reversedNames)")
        
        let forwardedNames = names.sorted(by: <)
        print("Forwarded Names: \(forwardedNames)")
        
        // Closure without using a trailing closure
        let reversedNames2 = names.sorted(by: { (s1: String, s2: String) -> Bool in
            return s1 > s2
        })
        print("Reversed Names 2: \(reversedNames2)")
        
        /// Trailing Closures
        let reversedNames3 = names.sorted() { $0 > $1 }
        print("Reversed Names 3: \(reversedNames3)")
        
        // If the only param is the trailign closure, you dont need to write the parenthesis
        let reversedNames4 = names.sorted {$0 > $1}
        print("Reversed Names 4: \(reversedNames4)")
        
        /// Closure capturing values
        func makeIncrementer(forIncrement amount: Int) -> () -> Int {
            var runningTotal = 0
            func incrementer() -> Int {
                // It uses a variable from the outside of the function
                runningTotal += amount
                return runningTotal
            }
            return incrementer
        }
        
        let incrementByTen = makeIncrementer(forIncrement: 10)
        print(incrementByTen())
        print(incrementByTen())
        
        let incrementBySeven = makeIncrementer(forIncrement: 7)
        print(incrementBySeven())
        
        print(incrementByTen())
        
        /// Escaping Closures
        let instance = SomeClass()
        instance.doSomething()
        print(instance.x)
        // Prints "200"
        
        completionHandlers.first?()
        print(instance.x)
        // Prints "100"
        
        
        /// AUTOCLOSURES (Executed until the variable with the closure is called)
        var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
        print(customersInLine.count)
        // Prints "5"
        
        let customerProvider = { customersInLine.remove(at: 0) }
        print(customersInLine.count)
        // Prints "5"
        
        print("Now serving \(customerProvider())!")
        // Prints "Now serving Chris!"
        print(customersInLine.count)
        // Prints "4"
    }
    
    func tuples () {
        print("\n- TUPLES")
        
        /// TUPLES
        let httpError = (404, "Not Found")
        let anotherTuple = (errorCode: 404, errorMessage: "Not Found")
        print("Another tuple: \(anotherTuple.errorCode) - \(anotherTuple.errorMessage)")
        
        print("Http Error: \(httpError.0) - Message: \(httpError.1)")
        
        let (errorCode, errorMessage) = httpError
        print("Http Error: \(errorCode) - Message: \(errorMessage)")
    }
    
    func optionals () {
        print("\n- OPTIONALS")
        
        /// OPTIONALS (Use it in situations where a value may be absent)
        let possibleNumber = "123"
        let convertedNumber = Int(possibleNumber)
        // convertedNumber is inferred to be of type "Int?", or "optional Int"
        
        
        if convertedNumber != nil {
            // Using "!" to declare that we definitely have a value, because it already reach the condition if
            // FORCE UNWRAPPING
            print("Optional Value: \(convertedNumber!)")
        }
        
        var serverResponse: Int? = 404
        serverResponse = nil // Optionals, also means it can be nil at anymoment
        if let temporaryConstant = serverResponse {
            print("Server Response: \(temporaryConstant)")
        } else {
            print("Server Response is nil")
        }
        
        var surveyAnswer: String?
        // surveyAnswer is automatically set to nil
        surveyAnswer = "The answer is Dog"
        /// OPTIONAL BINDING
        if let temporaryConstant = surveyAnswer {
            print("surveyAnswer has a String value: \(temporaryConstant)")
        } else {
            print("surveyAnswer could not be converted to an String")
        }
        
        /// IMPLICITY UNWRAPPED OPTIONALS
        let assumedString: String!
        assumedString = "Assingning String inmediately"
        // No need of unrapping
        print(assumedString)
    }
    
    func debuggingWithAssertionAndPreconditions () {
        print("\n-DEBUGGINS WITH ASSERTIONS AND PRECONDITIONS")
        
        /// DEBUGGING WITH ASSERTIONS
        let age = 3
        assert(age >= 0, "A person's age can't be less than zero.")
        // This assertion fails because -3 is not >= 0.
        
        // Another kind of evaluation
        if age > 10 {
            print("You can ride the roller-coaster or the ferris wheel.")
        } else if age > 0 {
            print("You can ride the ferris wheel.")
        } else {
            assertionFailure("A person's age can't be less than zero.")
        }
        
        /// ENFORCING PRECONDITIONS
        // In the implementation of a subscript...
        let index = 1
        precondition(index > 0, "Index must be greater than zero.")
        print("Hello " + " World")
    }
    
    func rangeOperators () {
        print("\n- RANGE OPERATORS")
        
        // Closed Range Operator (Runs from "a" to "b" and includes them)
        for index in 1...5 {
            print("\(index) times 5 is \(index * 5)")
        }
        
        // Half-Open Range Operator (Runs from "a" to "b" but it doesn't includes "b") - Useful for arrays
        let names = ["Anna", "Alex", "Brian", "Jack Frost"]
        let count = names.count
        
        for i in 0..<count {
            print("Person \(i + 1) is called \(names[i])")
        }
        
        // One-Sided Ranges (Runs for ranges that continue as far as possible in one direction)
        //for name in names[2...] {
        //    print(name)
        //}
    
        //for name in names[...2] {
        //    print(name)
        //}
        
        for name in names[..<2] {
            print(name)
        }
    }
    
    func stringExamples () {
        print("\n- STRING")
        
        var welcome = "Hello There"
        let exclamationPoint = "!"
        
        welcome.append(exclamationPoint)
        print("Welcome Message: \(welcome) has \(welcome.count) characters")
        
        // Getting elements by index
        let index = welcome.index(welcome.startIndex, offsetBy: 9)
        
        print("First Char: \(welcome[welcome.startIndex])\n" +
            "Last Char \(welcome[welcome.index(before: welcome.endIndex)])\n" +
            "Position 2 Char: \(welcome[welcome.index(after: welcome.startIndex)])\n" +
            "Position 9th Char: \(welcome[index])")
        
        // Inserting Characters to String
        welcome.insert("!", at: welcome.endIndex)
        print("Welcome Message With Insert: \(welcome)")
        
        welcome.remove(at: welcome.index(before: welcome.endIndex))
        print("Welcome Message With Delete: \(welcome)")
        
        // SubString
        let indice = welcome.index(of: " ") ?? welcome.endIndex
        let beginning = welcome[..<indice] // Substring using a reference of the original string (rehuse the memory of "welcome" string instead of creating a new storage in memory)
        
        // Convert the result to a String for long-term storage (new storage in memory).
        let newString = String(beginning)
        
        print("New String: \(newString)")
        
        /// PREFIX AND SUFIX
        let romeoAndJuliet = [
            "Act 1 Scene 1: Verona, A public place",
            "Act 1 Scene 2: Capulet's mansion",
            "Act 1 Scene 3: A room in Capulet's mansion",
            "Act 1 Scene 4: A street outside Capulet's mansion",
            "Act 1 Scene 5: The Great Hall in Capulet's mansion",
            "Act 2 Scene 1: Outside Capulet's mansion",
            "Act 2 Scene 2: Capulet's orchard",
            "Act 2 Scene 3: Outside Friar Lawrence's cell",
            "Act 2 Scene 4: A street in Verona",
            "Act 2 Scene 5: Capulet's mansion",
            "Act 2 Scene 6: Friar Lawrence's cell"
        ]
        
        var act1SceneCount = 0
        
        for scene in romeoAndJuliet {
            if scene.hasPrefix("Act 1 ") {
                act1SceneCount += 1
            }
        }
        print("There are \(act1SceneCount) scenes in Act 1")
        
        var mansionCount = 0
        var cellCount = 0
        
        for scene in romeoAndJuliet {
            if scene.hasSuffix("Capulet's mansion") {
                mansionCount += 1
            } else if scene.hasSuffix("Friar Lawrence's cell") {
                cellCount += 1
            }
        }
        print("\(mansionCount) mansion scenes; \(cellCount) cell scenes")
    }
    
    func arrayExamples () {
        print("\n- ARRAYS")
        
        let someInts = [Int]()// Empty array
        // Array with an array literal
        let someStrings: [String] = ["Bob", "Ana", "Tim"]
        // Set 3 elements to the array with the value in "repeating"
        let threeDoubles = Array(repeating: 1.0, count: 3)
        let anotherThreeDoubles = Array(repeating: 2.0, count: 3)
        
        // New array base in two arrays combination
        var sixDoubles = threeDoubles + anotherThreeDoubles
        
        print("someInts is of type [Int] with \(someInts.count) type: \(someInts.debugDescription) items.")
        
        // To verify if the array has values
        if sixDoubles.isEmpty {
            print("The array \"sixDoubles\" is empty")
        } else {
            for element in sixDoubles {
                print("Array with default values: \(element)")
            }
        }
        
        // Add elements to the end of an array
        sixDoubles.append(3.0)
        
        // Append an array with one or more compatible items
        sixDoubles += [4.0]
        sixDoubles += [5.0, 6.0, 7.0]
        
        // Changing one previus saved value
        sixDoubles[0] = 0.0
        
        // Changing a range of elements, if you add onlyone element [1.1] it is gonna add only that element and delete the other in the range
        sixDoubles[2...4] = [1.1, 1.2, 1.3]
        
        // Insert and remove elements at a specifed index
        sixDoubles.remove(at: 9)
        sixDoubles.removeLast() // Delete the last item
        sixDoubles.insert(7.7, at: sixDoubles.endIndex)
        
        // *enumerated() returns a tuple of index and its value
        for (index, value) in sixDoubles.enumerated() {
            print("-- Array with new values: \(value) at index: \(index)")
        }
        
    }
    
    func setExamples () {
        //You can use a set instead of an array when the order of items is not important, or when you need to ensure that an item only appears once.
        print("\n- SET COLLECTION")
        
        let letters = Set<Character>()
        // Initialize a set with an array literal
        var favoriteGenres: Set<String> = ["Rock", "Hip-Hop", "Classical"]
        
        print("\"letters\" is of type Set<Character> with \(favoriteGenres.count) items.")
        
        // Accesing and modifying a Set
        if favoriteGenres.isEmpty {
            print("Set doesn't has values \"I'm not picky\"")
        } else {
            print("Set has values \"I have particular music preferences\"")
        }
        
        favoriteGenres.insert("Indie")
        
        if let removeGenre = favoriteGenres.remove("Hip-Hop") {
            print("Removed Genre: \(removeGenre), because it exist in the SET")
        } else {
            print("NOT removed genre because it doesn't exist")
        }
        
        // Check if a set contains a particular item
        if favoriteGenres.contains("Hip-Hop") {
            print("SET Contains Hip-Hop")
        } else {
            print("SET doesn't contains Hip-Hop")
        }
        
        // Iterating
        for (index, genre) in favoriteGenres.enumerated() {
            print("Genre in SET: \(genre) - Index: \(index)")
        }
        
        // Iterate and sort
        for genre in favoriteGenres.sorted() {
            print("Genre ordered in SET: \(genre)")
        }
        
        /// - OPERATIONS
        // - Use the intersection(_:) method to create a new set with only the values common to both sets.
        // - Use the symmetricDifference(_:) method to create a new set with values in either set, but not both.
        // - Use the union(_:) method to create a new set with all of the values in both sets.
        // - Use the subtracting(_:) method to create a new set with values not in the specified set.
        
        let oddDigits: Set = [1, 3, 5, 7, 9]
        let evenDigits: Set = [0, 2, 4, 6, 8]
        let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]
        
        oddDigits.union(evenDigits).sorted()
        // [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
        oddDigits.intersection(evenDigits).sorted()
        // []
        oddDigits.subtracting(singleDigitPrimeNumbers).sorted()
        // [1, 9]
        oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()
        // [1, 2, 9]
        
        /// Set Membership and Equality
        // - Use the “is equal” operator (==) to determine whether two sets contain all of the same values.
        // - Use the isSubset(of:) method to determine whether all of the values of a set are contained in the specified set.
        // - Use the isSuperset(of:) method to determine whether a set contains all of the values in a specified set.
        // - Use the isStrictSubset(of:) or isStrictSuperset(of:) methods to determine whether a set is a subset or superset, but not equal to, a specified set.
        // - Use the isDisjoint(with:) method to determine whether two sets have no values in common.
        let houseAnimals: Set = ["🐶", "🐱"]
        let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
        let cityAnimals: Set = ["🐦", "🐭"]
        
        houseAnimals.isSubset(of: farmAnimals) // true
        farmAnimals.isSuperset(of: houseAnimals) // true
        farmAnimals.isDisjoint(with: cityAnimals) // true

    }
    
    func dictionaryExamples () {
        print("\n- DICTIONARY")
        
        // Empty Dictionary
        let nameOfIntegers = [Int: String]()
        
        // Initialize Dictionary with a Dictionary Literal
        var airports: [String: String] = ["YYZ": "TorontoPearson", "GEA": "Atlanta Georgia", "DUB": "Dublin"]
        
        // Accesing and Modifying a Dictionary
        print("The Airport dictionary contains \(airports.count) items.")
        
        if airports.isEmpty {
            print("The airports dictionary is empty")
        } else {
            print("The airports dictionary contain values")
        }
        
        // INSERT a new element to the dictionary by subscript (subíndice)
        airports["LHR"] = "London Heathrow"
        
        // UPDATE value of a dictionary element by subscript
        airports["GEA"] = "Georgia"
        // UPDATE value of a dictionary element by "updateValue" function (this returns the old value if exist)
        if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
            print("The oldValue for DUB was \(oldValue)")
        }
        
        // If the dictionary contains a value for the requested key, the subscript returns an optional value containing the existing value for that key. Otherwise, the subscript returns nil (It's a good validation)
        if let airportsName = airports["DUB"] {
            print("The name of the airport is: \(airportsName)")
        } else {
            print("That airport is not in the airports dictionary")
        }
        
        // DELETE Values
        airports["APL"] = "Apple International" // "Apple International" is not the real airport for APL, so delete it
        airports["APL"] = nil // APL has now been removed from the dictionary
        
        if let removedValue = airports.removeValue(forKey: "DUB")  {
            print("The removed airport's name is \(removedValue).")
        } else {
            print("The airports dictionary does not contain a value for DUB.")
        }
        
        // ITERATING over a dictionary
        for (airportCode, airportName) in airports {
            print("- \(airportCode) : \(airportName)")
        }
        
        // Getting only the keys
        for key in airports.keys.sorted() {
            print("KEY: \(key)")
        }
        
        // Getting only the values
        for values in airports.values.sorted() {
            print("VALUES: \(values)")
        }
        
        // If you need to use a dictionary’s keys or values with an API that takes an Array instance, initialize a new array with the keys or values property
        let airportCodes = [String](airports.keys)
        let airportValues = [String](airports.values)
        
        print("Constant with all the keys: \(airportCodes)")
        print("Constant with all the values: \(airportValues)")
    }
    
    func forInLoop () {
        print("\n- FOR IN LOOP")
        
        let names = ["Anna", "Alex", "Brian", "Jack"]
        
        for name in names {
            print("Hello \(name)!")
        }
        
        let base = 3
        let power = 10
        var answer = 1
        // If you don't need each value from a sequence you can ignore it with an underscore "_"
        for _ in 1...power {
            answer *= base
        }
        print("\(base) to the power of \(power) is \(answer)")
        
        let minutes = 60
        let minuteInterval = 5
        
        for tickMark in stride(from: 0, to: minutes, by: minuteInterval) {
            // render the tick mark every 5 minutes (0, 5, 10, 15 ... 45, 50, 55)
        }
    }
    
    func whileLoop () {
        print("\n- WHILE LOOP")
        
        var a = 0
        let b = 5
        
        while a < b {
            print("While Loop Cycle: \(a)")
            a += 1
        }
        
        // Do While in swift is:
        //repeat {
        //    statements
        //} while condition
    }
    
    func switchCondition () {
        print("\n - SWITCH")
        
        let someCharacter: Character = "Z"
        
        switch someCharacter {
        case "a", "A":// To match different possible options
                print("The first letter of the alphabet is: \(someCharacter)")
            case "z", "Z":
                print("The last letter of the alphabet is: \(someCharacter)")
            default:
                print("Some other character")
        }
        
        let numberToAnalize = 51
        
        switch numberToAnalize{
            case 1..<10:
                print("Number between 1 to 9")
            case 10..<51:
                print("Number between 10 to 50")
            default:
                print("Number not between 1 to 50")
        }
        
        // Matching TUPLES
        let somePoint = (1, 1)
        
        switch somePoint {
        case (0, 0):
            print("\(somePoint) is at the origin")
        case (_, 0):
            print("\(somePoint) is on the x-axis")
        case (0, _):
            print("\(somePoint) is on the y-axis")
        case (-2...2, -2...2):
            print("\(somePoint) is inside the box")
        default:
            print("\(somePoint) is outside of the box")
        }
        // Prints "(1, 1) is inside the box"
    }
    
    func continueStatement () {
        print("\n- CONTINUE STATEMENT")
        
        // Tells a loop to stop what it is doing and start again at the beginning of the next iteration through the loop.
        
        let puzzleInput = "great minds think alike"
        var puzzleOutput = ""
        let charactersToRemove: [Character] = ["a", "e", "i", "o", "u", " "]
        
        for character in puzzleInput {
            if charactersToRemove.contains(character) {
                continue
            } else {
                puzzleOutput.append(character)
            }
        }
        print(puzzleOutput)
        // Prints "grtmndsthnklk"
    }
    
    func breakStatement () {
        print("\n- BREAK STATEMENT")
        
        // Ends execution of an entire control flow statement immediately
        
        let puzzleInput = "great minds think alike"
        var puzzleOutput = ""
        let charactersToRemove: [Character] = ["a", "e", "i", "o", "u", " "]
        
        for character in puzzleInput {
            if charactersToRemove.contains(character) {
                break
            } else {
                puzzleOutput.append(character)
            }
        }
        print(puzzleOutput)
        // Prints "gr"
        print("You finished!")
    }
    
    /// MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// STRING INTERPOLATION
        stringInterpolation()
        
        /// CLOSURES
        closuresExamples()
        
        /// TUPLES
        tuples()
        
        /// OPTIONALS
        optionals()
        
        /// DEBUGGIN WITH ASSERTIONS AND PRECONDITIONS
        debuggingWithAssertionAndPreconditions()
        
        /// RANGE OPERATORS
        rangeOperators()
        
        /// STRING
        stringExamples()
        
        /// COLLECTIONS
        /// - Array
        arrayExamples()
        /// - Set
        setExamples()
        /// - Dictionary
        dictionaryExamples()
        
        /// CONTROL FLOW
        /// - For In Loop
        forInLoop()
        /// - While Loop
        whileLoop()
        
        /// CONDICIONAL STATEMENTS
        /// - Switch
        switchCondition()
        
        /// CONTROL TRANSFER STATEMENTS
        /// - Continue
        continueStatement()
        /// - Break
        breakStatement()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}



var completionHandlers: [() -> Void] = []
func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}

func someFunctionWithNonescapingClosure(closure: () -> Void) {
    closure()
}

class SomeClass {
    var x = 10
    func doSomething() {
        someFunctionWithEscapingClosure { self.x = 100 }
        someFunctionWithNonescapingClosure { x = 200 }
    }
}


