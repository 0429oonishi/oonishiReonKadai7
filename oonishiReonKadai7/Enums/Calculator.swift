//
//  Calculator.swift
//  oonishiReonKadai7
//
//  Created by 大西玲音 on 2021/05/28.
//

import Foundation

protocol CalculatorProtocol {
    func calculate(firstNum: Int, secondNum: Int) -> Int
}

struct AdditionCalculator: CalculatorProtocol {
    func calculate(firstNum: Int, secondNum: Int) -> Int {
        firstNum + secondNum
    }
}

struct SubtractionCalculator: CalculatorProtocol {
    func calculate(firstNum: Int, secondNum: Int) -> Int {
        firstNum - secondNum
    }
}
