//
//  Calculator.swift
//  oonishiReonKadai7
//
//  Created by 大西玲音 on 2021/05/28.
//

import Foundation

enum Calculator {
    case plus
    case minus
    func calculate(firstNum: Int, secondNum: Int) -> Int {
        switch self {
            case .plus: return firstNum + secondNum
            case .minus: return firstNum - secondNum
        }
    }
}
