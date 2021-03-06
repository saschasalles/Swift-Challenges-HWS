//
//  main.swift
//  Swift-Coding-Challenge-HWS
//
//  Created by Sascha Sallès on 21/02/2021.
//

import Foundation

// MARK: Strings

func challenge1(forString string: String) -> Bool {
    let primmaryArr = Array(string)
    let uniqueArr = Set(primmaryArr)
    return primmaryArr.count != uniqueArr.count ? false : true
}

// challenge1(forString: "AaBbCc")

assert(challenge1(forString: "No duplicates") == true, "Challenge 1 failed")
assert(challenge1(forString: "abcdefghijklmnopqrstuvwxyz") == true, "Challenge 1 failed")
assert(challenge1(forString: "AaBbCc") == true, "Challenge 1 failed")
assert(challenge1(forString: "Hello, world") == false, "Challenge 1 failed")

func challenge2(forString string: String) -> Bool {
    return string.uppercased() == String(string.uppercased().reversed())
}

// challenge2(forString: "Rats live on no evil star")

func challenge3(with first: String, second: String) -> Bool {
    return first.sorted() == second.sorted()
}

// challenge3(with: "abc", second: "cbAa")


func charCount(forString string: String) -> () {
    let duplicates = Set(string.sorted())
    
    let _: [()] = duplicates.map { val in
        print("\(val) est contenu \(string.reduce(0) { $1 == val ? $0 + 1: $0 }) fois")
    }
}

// charCount(forString: "eee eee d")

func charCount2(input: String, count: String) -> Int {
    let array = input.map { String($0) }
    let counted = NSCountedSet(array: array)
    return counted.count(for: count)
}

// charCount2(input: "eee eee d", count: "e")


func removeDups(forString string: String) -> String {
    let array = string.map { String($0) }
    let ordered = NSOrderedSet(array: array)
    let cleanArr: [String] = Array(ordered) as! Array<String>
    return cleanArr.joined()
}

// removeDups(forString: "Hello World")


// Note to myself -> https://www.hackingwithswift.com/articles/108/how-to-use-regular-expressions-in-swift

func cleanSpaces(forString string: String) -> String {
    return string.replacingOccurrences(of: " +", with: " ", options: .regularExpression)
}

// cleanSpaces(forString: "    a")


// naïve solution

func stringIsRotated(forBase base: String, and compared: String) -> Bool {
    if base.count != compared.count { return false }
    var arrCompared = compared.map { $0 }
    let arrBase = base.map { $0 }
    
    for _ in 0...arrCompared.count {
        if arrBase == arrCompared { return true } else {
            let element = arrCompared.remove(at: 0)
            arrCompared.insert(element, at: arrCompared.endIndex)
        }
    }
    return false
}

//stringIsRotated(forBase: "abc", and: "a")

// nice solution

func stringIsRotated2(forBase base: String, and compared: String) -> Bool {
    guard base.count == compared.count else { return false }
    let combined = base + base
    return combined.contains(compared)
}

//stringIsRotated2(forBase: "abc", and: "a")

func isPangram(forString string: String) -> Bool {
    let removedDups = Set(string)
    let filtered = removedDups.filter { $0 >= "a" && $0 <= "z" }
    return filtered.count < 26 ? false : true
}

//isPangram(forString: "The quick brown fox jumped over the lazy dog")


func naiveCountVowelAndConsonants(forString string: String) -> String {
    let cleaned = string.replacingOccurrences(of: " ", with: "")
    let stringArr = cleaned.map { String($0) }
    let range: Array<String> = ["A", "E", "I", "O", "U"]
    var countRange = 0
    for letter in stringArr {
        for char in range {
            if letter == char || letter == char.lowercased() {
                countRange += 1
            }
        }
    }
    return "String contains \(countRange) vowels and \(stringArr.count - countRange) consonants"
}

//naiveCountVowelAndConsonants(forString: "Mississippi")

func smartCountVowelAndConsonants(forString string: String) -> String {
    let cleaned = string
        .components(separatedBy: .punctuationCharacters)
        .joined(separator: "")
        .replacingOccurrences(of: " ", with: "")
    
    let range = NSRange(location: 0, length: cleaned.count)
    let regex = try! NSRegularExpression(pattern: "[AEIOUaeiou]+")
    let nbOfVowels = regex.numberOfMatches(in: cleaned, options: [], range: range)
    return "String contains \(nbOfVowels) vowels and \(cleaned.count - nbOfVowels) consonants"
    
}

//smartCountVowelAndConsonants(forString: "Swift Coding Challenges")


func threeDifferentLetters(forFirst string1: String, andSecond string2: String) -> Bool {
    if string1.count != string2.count { return false }
    let arrStr2: Array<Character> = string2.map { $0 }
    
    var diff = 0
    string1.enumerated().forEach { (index, letter) in
        if letter != arrStr2[index] { diff += 1 }
    }
    
    return diff > 3 ? false : true
}

//print(threeDifferentLetters(forFirst: "Clamp", andSecond: "Cramp"))


func longestPrefix(forString string: String) -> String {
    let parts = string.components(separatedBy: " ")
    guard let first = parts.first else { return "" }
    var currentPrefix = ""
    var bestPrefix = ""
    for letter in first {
        currentPrefix.append(letter)
        for word in parts {
            if !word.hasPrefix(currentPrefix) {
                return bestPrefix
            }
        }
        bestPrefix = currentPrefix
    }
    return bestPrefix
}


//print(longestPrefix(forString: "swift switch swill swim"))


func runLengthEncoding(forString string: String) -> String {
    guard let last = string.last else { return "" }
    let arr = string.map { $0 }
    var resultString: String = ""
    var count = 1
    for (index, letter) in arr.enumerated() where index + 1 < arr.count {
        if letter == arr[index + 1] {
            count += 1
        } else {
            resultString += String(letter) + String(count)
            count = 1
        }
    }
    resultString += String(last) + String(count)
    return resultString
}

//print(runLengthEncoding(forString: "aaabaaabaaa"))

func stringPermutations(forString string: String, current: String = "") {
    let length = string.count
    let strArray = Array(string)
    if (length == 0) {
        print(current)
    } else {
        for i in 0 ..< length {
            let left = String(strArray[0 ..< i])
            let right = String(strArray[i + 1 ..< length])
            stringPermutations(forString: left + right, current: current +
                                String(strArray[i]))
        } }
}

//stringPermutations(forString: "lol")


func reversedString(forString string: String) -> String {
    let strArr = Array(string.split(separator: " "))
    return strArr.map { String($0.reversed()) }.joined(separator: " ")
}

//print(reversedString(forString: "Swift Coding Challenges"))

// MARK: Numbers

func fizzBuzz() {
    (1...100).forEach { value in
        switch true {
        case value % 3 == 0 && value % 5 == 0:
            print("FizzBuzz")
        case value % 3 == 0:
            print("Fizz")
        case value % 5 == 0:
            print("Buzz")
        default:
            print(String(value))
        }
    }
}

//fizzBuzz()

// better randomization with C func -> arc4random_uniform()
func randomInt(min: Int, max: Int) -> Int {
    let range = min...max
    return range.randomElement() ?? 0
    
}

//print(randomInt(min: 1, max: 100))


func myPow(number: Double, multiplicator: Double) -> Double {
    guard number > 0, multiplicator > 0 else { return 0 }
    if multiplicator == 1 { return number }
    return number * myPow(number: number, multiplicator: multiplicator - 1)
}


//print(myPow(number: 4, multiplicator: 3))


var a = 1
var b = 2
// Swap values

// swap(&a, &b)
// var mytupl = (a, b)
// (a, b) = (b, a)

func isPrime(forNumber number: Int) -> Bool {
    var res: Bool = true
    if (2..<number).first(where: { number % $0 == 0 }) != nil { res = false }
    return res
}

print(isPrime(forNumber: 16777259))
