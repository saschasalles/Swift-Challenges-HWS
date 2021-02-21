//
//  main.swift
//  Swift-Coding-Challenge-HWS
//
//  Created by Sascha Sallès on 21/02/2021.
//

import Foundation

func challenge1(forString string: String) -> Bool{
    let primmaryArr = Array(string)
    let uniqueArr = Set(primmaryArr)
    return primmaryArr.count != uniqueArr.count ? false :  true
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

func challenge3(with first: String, second: String ) -> Bool {
    return first.sorted() == second.sorted()
}

// challenge3(with: "abc", second: "cbAa")


func charCount(forString string: String) -> () {
    let duplicates = Set(string.sorted())
    
    let _: [()] = duplicates.map{ val in
        print("\(val) est contenu \(string.reduce(0) { $1 == val ? $0 + 1 : $0 }) fois")
    }
}

// charCount(forString: "eee eee d")

func charCount2(input: String, count: String) -> Int {
   let array = input.map { String($0) }
   let counted = NSCountedSet(array: array)
   return counted.count(for: count)
}

// charCount2(input: "eee eee d", count: "e")


func removeDups(forString string:String) -> String {
    let array = string.map { String($0) }
    let ordered = NSOrderedSet(array: array)
    let cleanArr:[String] = Array(ordered) as! Array<String>
    return cleanArr.joined()
}

// removeDups(forString: "Hello World")


// Note to myself -> https://www.hackingwithswift.com/articles/108/how-to-use-regular-expressions-in-swift

func cleanSpaces(forString string:String) -> String {
    return string.replacingOccurrences(of: " +", with: " ", options: .regularExpression)
}

// cleanSpaces(forString: "    a")


func stringIsRotated(forString string: String) {
    // TODO
}
