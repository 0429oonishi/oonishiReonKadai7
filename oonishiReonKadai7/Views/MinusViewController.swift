//
//  MinusViewController.swift
//  oonishiReonKadai7
//
//  Created by 大西玲音 on 2021/05/28.
//

import UIKit
import RxSwift

final class MinusViewController: UIViewController {

    @IBOutlet private var calculatorView: CalculatorView!
    
    private let calculatorViewModel = CalculatorViewModel(
        calculator: SubtractionCalculator()
    )

    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calculatorView.delegate = self
        setupBindings()
        
    }
    
    private func setupBindings() {
        calculatorViewModel.outputs.resultNum
            .map { String($0) }
            .drive(calculatorView.resultLabel.rx.text)
            .disposed(by: disposeBag)
    }
    
}

extension MinusViewController: CalculatorViewDelegate {
    func calculate(firstText: String?, secondText: String?) {
        calculatorViewModel.inputs.calculateButtonDidTapped(
            firstText: firstText,
            secondText: secondText
        )
    }
}
