//
//  File.swift
//  oonishiReonKadai7
//
//  Created by 大西玲音 on 2021/06/15.
//

import Foundation

protocol CalculatorProtocol {
    func calculate(firstNum: Int, secondNum: Int) -> Int
}

struct AdditionCalculator: CalculatorProtocol {
    func calculate(firstNum: Int, secondNum: Int) -> Int {
        return firstNum + secondNum
    }
}

struct SubtractionCalculator: CalculatorProtocol {
    func calculate(firstNum: Int, secondNum: Int) -> Int {
        return firstNum - secondNum
    }
}
