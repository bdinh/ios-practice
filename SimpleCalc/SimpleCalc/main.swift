//
//  main.swift
//  SimpleCalc
//
//  Created by Bao Dinh on 4/6/17.
//  Copyright © 2017 Bao Dinh. All rights reserved.
//
// Able to handle doubles and negatives

import Foundation
print("Welcome to Simple Console Calculator!")
print("Enter an expression separeted by returns,")
print("Or try one of my more complex operations.")
print("Type \"quit\" to exit or \"detail\" for a list of operations.")


func printDetails() -> Void {
    print("For expressions separated by returns, please enter a number follow by one for the \nfollowing, '+', '-', '*', '/', '%' followed by another number.")
    print("Calculator supports count, avg and fact operations.")
    print("Follow syntax to use operations: ex. 1 2 3 4 5 avg (can substitute other operation)")
    print("Fact operation only accepts one number")
}

func fact(n: Int) -> Int {
    if n == 0 {
        return 1
    } else {
        return n * fact(n: n-1)
    }
}

func avg(array: Array<String>) -> Int {
    var sum = 0
    for n in array {
        sum += Int(n)!
    }
    return sum / array.count
}
var result = ""
var count = 0
while count < 3 {
    let response = readLine(strippingNewline: true)!
    let parse = response.characters.split(separator: " ").map(String.init)
    
    if parse.count == 1 {
        count += 1
        if parse[0] == "quit" {
            count = 4
        } else if parse[0] == "detail" {
            printDetails()
        } else {
            result = result + " \(response)"
        }
        if count == 3 {
            let answerArray = result.characters.split(separator: " ").map(String.init)
            var answer = 0.0
            if answerArray[1] == "+" {
                answer = Double(answerArray[0])! + Double(answerArray[2])!
            } else if answerArray[1] == "-" {
                answer = Double(answerArray[0])! - Double(answerArray[2])!
            } else if answerArray[1] == "*" {
                answer = Double(answerArray[0])! * Double(answerArray[2])!
            } else if answerArray[1] == "/" {
                answer = Double(answerArray[0])! / Double(answerArray[2])!
            } else if answerArray[1] == "%" {
                var answer = 0
                answer = Int(answerArray[0])! % Int(answerArray[2])!
            } else {
                print("Please enter a valid expression.")
                print("Can not regonize '\(answerArray[1])'")
                break
            }
            if floor(answer) == answer {
                print("Result: \(Int(answer))")
            } else {
                print("Result: \(answer)")
            }
        }
    } else {
        let answerArray = response.characters.split(separator: " ").map(String.init)
        if response.contains("count") {
            print("\(response) => \(answerArray.count - 1)")
        } else if response.contains("avg") {
            var array = Array(answerArray[0...answerArray.count - 2])
            print("\(response) => \(avg(array: array))")
        } else if response.contains("fact") && parse.count == 2 {
            let n = Int(answerArray[0])!
            print("\(response) => \(fact(n: n))")
        } else {
            print("Please enter a valid expression.")
            print("Can not regonize '\(response)'")
        }
        count = 3
    }
}



    
