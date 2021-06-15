//
//  CalculatorViewModel.swift
//  oonishiReonKadai7
//
//  Created by 大西玲音 on 2021/05/28.
//

import RxSwift
import RxCocoa

protocol CalculatorViewModelInput {
//    func calculateButtonDidTapped(firstNum: Int, secondNum: Int, calculator: Calculator)
    func calculateButtonDidTapped(firstText: String?, secondText: String?)
}

protocol CalculatorViewModelOutput {
    var resultNum: Driver<Int> { get }
}

protocol CalculatorViewModelType {
    var inputs: CalculatorViewModelInput { get }
    var outputs: CalculatorViewModelOutput { get }
}

final class CalculatorViewModel: CalculatorViewModelInput, CalculatorViewModelOutput {
//    func calculateButtonDidTapped(firstNum: Int, secondNum: Int, calculator: Calculator) {
//        let resultNum = calculator.calculate(firstNum: firstNum, secondNum: secondNum)
//        resultNumRelay.accept(resultNum)
//    }
    
    private let calculator: CalculatorProtocol
    
    init(calculator: CalculatorProtocol) {
        self.calculator = calculator
    }
    
    func calculateButtonDidTapped(firstText: String?, secondText: String?) {
        guard let firstNum = firstText.flatMap({ Int($0) }),
              let secondNum = secondText.flatMap({ Int($0) }) else { return }
        let resultNum = calculator.calculate(firstNum: firstNum, secondNum: secondNum)
        resultNumRelay.accept(resultNum)
    }
    
    var resultNum: Driver<Int> {
        resultNumRelay.asDriver(onErrorDriveWith: .empty())
    }
    private let resultNumRelay = PublishRelay<Int>()

}

extension CalculatorViewModel: CalculatorViewModelType {
    var inputs: CalculatorViewModelInput {
        return self
    }
    
    var outputs: CalculatorViewModelOutput {
        return self
    }
}

