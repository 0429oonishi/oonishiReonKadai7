//
//  CalculatorView.swift
//  oonishiReonKadai7
//
//  Created by 大西玲音 on 2021/05/28.
//

import UIKit

protocol CalculatorViewDelegate: AnyObject {
    func calculate(firstText: String?, secondText: String?)
}

final class CalculatorView: UIView {
    
    @IBOutlet private weak var firstTextField: UITextField!
    @IBOutlet private weak var secondTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    weak var delegate: CalculatorViewDelegate?
    
    @IBAction private func calculateButtonDidTapped(_ sender: Any) {
        delegate?.calculate(firstText: firstTextField.text, secondText: secondTextField.text)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        firstTextField.keyboardType = .numberPad
        secondTextField.keyboardType = .numberPad
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        firstTextField.resignFirstResponder()
        secondTextField.resignFirstResponder()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadNib()
    }
    
    private func loadNib() {
        guard let view = UINib(nibName: String(describing: type(of: self)), bundle: nil).instantiate(withOwner: self, options: nil).first as? UIView else {
            return
        }
        view.frame = self.bounds
        self.addSubview(view)
    }
    
}
