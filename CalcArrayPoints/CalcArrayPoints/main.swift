//
//  main.swift
//  CalcArrayPoints
//
//  Created by Bao Dinh on 4/6/17.
//  Copyright © 2017 Bao Dinh. All rights reserved.
//

import Foundation


// BUILD A CALCULATOR

func add (left: Int, right: Int) -> Int {
    return left + right
}

func subtract (left: Int, right: Int) -> Int {
    return left - right
}

func multiply (left: Int, right: Int) -> Int {
    return left * right
}

func divide (left: Int, right: Int) -> Int {
    return left / right
}

func mathOperation (left: Int, right: Int, operation: (Int, Int) -> Int) -> Int {
    return operation(left, right)
}


// ARRAY FUN

func add (array: Array<Int>) -> Int {
    var result = 0
    for n in array {
        result = result + n
    }
    return result
}


func multiply (array: Array<Int>) -> Int {
    var result = 1
    for n in array {
        result = result * n
    }
    return result
}


func count (array: Array<Int>) -> Int {
    return array.count
}

func average (array: Array<Int>) -> Int {
    return add(array: array) / count(array: array)
}

func reduce (array: Array<Int>, operation: (Array<Int>) -> Int) -> Int {
    return operation(array)
}


// POINTS

func add (p1: (Int, Int), p2: (Int, Int)) -> (Int, Int){
    let result = ((p1.0 + p2.0), (p1.1 + p2.1))
    return result
}

func subtract (p1: (Int, Int), p2: (Int, Int)) -> (Int, Int){
    let result = ((p1.0 - p2.0), (p1.1 - p2.1))
    return result
}

func add (p1: [String: Int], p2: [String: Int]) -> [String: Int] {
    let test = p1["x"]
    let test2 = p1["y"]
    let test3 = p2["x"]
    let test4 = p2["y"]
    if test != nil && test2 != nil  && test3 != nil  && test4 != nil {
        let result = ["x": Int(p1["x"]! + p2["x"]!),
                      "y": Int(p1["y"]! + p2["y"]!)]
        return result
    } else {
        return [:]
    }
}

func subtract (p1: [String: Int], p2: [String: Int]) -> [String: Int] {
    let test = p1["x"]
    let test2 = p1["y"]
    let test3 = p2["x"]
    let test4 = p2["y"]
    if test != nil && test2 != nil  && test3 != nil  && test4 != nil {
        let result = ["x": Int(p1["x"]! - p2["x"]!),
                      "y": Int(p1["y"]! - p2["y"]!)]
        return result
    } else {
        return [:]
    }
}


