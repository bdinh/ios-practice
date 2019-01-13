//
//  main.swift
//  SimpleDomainModel
//
//  Created by Ted Neward on 4/6/16.
//  Copyright © 2016 Ted Neward. All rights reserved.
//

import Foundation

print("Hello, World!")

public func testMe() -> String {
  return "I have been tested"
}

open class TestMe {
  open func Please() -> String {
    return "I have been tested"
  }
}


////////////////////////////////////
// Money
//
public struct Money {
  public var amount : Int
  public var currency : String
  
  public func convert(_ to: String) -> Money {
    var newAmount = amount
    if to == "USD" {
        if self.currency == "GBP" {
            newAmount = 2 * newAmount
        } else if self.currency == "EUR" {
            newAmount = 2 * newAmount / 3
        } else if self.currency == "CAN" {
            newAmount = 4 * newAmount / 5
        }
        return Money(amount: newAmount, currency: to)
    } else if to == "GBP" {
        if self.currency == "USD" {
            newAmount = newAmount / 2
        } else if self.currency == "EUR" {
            newAmount = 3 * newAmount
        } else if self.currency == "CAN" {
            newAmount = 5 * newAmount / 2
        }
    } else if to == "EUR" {
        if self.currency == "GBP" {
            newAmount = newAmount / 3
        } else if self.currency == "USD" {
            newAmount = 3 * newAmount / 2
        } else if self.currency == "CAN" {
            newAmount = 5 * newAmount / 6
        }
    } else if to == "CAN" {
        if self.currency == "GBP" {
            newAmount = 2 * newAmount / 5
        } else if self.currency == "EUR" {
            newAmount = 6 * newAmount / 5
        } else if self.currency == "USD" {
            newAmount = 5 * newAmount / 4
        }
    }
    return Money(amount: newAmount, currency: to)
  }
    
    
  public func add(_ to: Money) -> Money {
    if self.currency == to.currency {
        return Money(amount: self.amount + to.amount, currency: self.currency)
    } else {
        let conv = self.convert(to.currency)
        return Money(amount: conv.amount + to.amount, currency: to.currency)
    }
  }
    
  public func subtract(_ from: Money) -> Money {
    if self.currency == from.currency {
        return Money(amount: self.amount + from.amount, currency: self.currency)
    } else {
        let conv = self.convert(from.currency)
        return Money(amount: conv.amount - from.amount, currency: from.currency)
    }
  }
}

////////////////////////////////////
// Job
//
open class Job {
  fileprivate var title : String
  fileprivate var type : JobType

  public enum JobType {
    case Hourly(Double)
    case Salary(Int)
  }
  
  public init(title : String, type : JobType) {
    self.title = title
    self.type = type
  }
  
  open func calculateIncome(_ hours: Int) -> Int {
    switch self.type {
    case .Hourly(let totalPay):
        return Int(totalPay * Double(hours))
    case .Salary(let totalSalary):
        return Int(totalSalary)
    default:
        return 0
    }
  }
  
  public func raise(_ amt : Double) {
    switch self.type {
    case .Hourly(let totalPay):
        self.type = JobType.Hourly(totalPay + amt)
    case .Salary(let totalSalary):
        self.type = JobType.Salary(totalSalary + Int(amt))
    }
  }
}

////////////////////////////////////
// Person
//
open class Person {
  open var firstName : String = ""
  open var lastName : String = ""
  open var age : Int = 0

  fileprivate var _job : Job? = nil
  open var job : Job? {
    get { return _job}
    set(value) {
        if self.age < 16 {
            _job = nil
        } else {
            _job = value
        }
    }
  }
  
  fileprivate var _spouse : Person? = nil
  open var spouse : Person? {
    get { return _spouse}
    set(value) {
        if self.age < 18 {
            _spouse = nil
        } else {
            _spouse = value
        }
    }
  }
  
  public init(firstName : String, lastName: String, age : Int) {
    self.firstName = firstName
    self.lastName = lastName
    self.age = age
  }
  
  open func toString() -> String {
    return ("[Person: firstName:\(self.firstName) lastName:\(self.lastName) age:\(self.age) job:\(self.job) spouse:\(self.spouse)]")
  }
}

////////////////////////////////////
// Family
//
open class Family {
  fileprivate var members : [Person] = []
  
  public init(spouse1: Person, spouse2: Person) {
    if spouse1.spouse == nil && spouse2.spouse == nil {
        spouse1.spouse = spouse2
        spouse2.spouse = spouse1
        self.members.append(spouse1)
        self.members.append(spouse2)
    }
  }
  
  open func haveChild(_ child: Person) -> Bool {
    var canHaveChild : Bool = false
    for person in members {
        if person.age > 20 {
            canHaveChild = true
        }
    }
    if canHaveChild {
        self.members.append(child)
    }
    return canHaveChild
    
  }
  open func householdIncome() -> Int {
    var total = 0
    for person in members {
        if person._job != nil {
            total += (person._job?.calculateIncome(2000))!
        }
    }
    return total
  }
}







