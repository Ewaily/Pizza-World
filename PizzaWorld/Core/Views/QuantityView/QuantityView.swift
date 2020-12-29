//
//  QuantityView.swift
//  PizzaWorld
//
//  Created by Muhammad Ewaily on 28/12/2020.
//

import RxCocoa
import RxSwift
import UIKit

class QuantityView: NibLoadingView {
    @IBOutlet var quantityLabel: UILabel!
    var currentValue: BehaviorRelay<Int> = .init(value: 0)
    lazy var currentValueObservable: Observable<Int> = {
        currentValue.asObservable()
    }()

    let disposeBag = DisposeBag()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    @IBAction func didPrressMinusButton(_ sender: UIButton) {
        guard currentValue.value > 0 else { return }
        currentValue.accept(currentValue.value - 1)
    }
    
    @IBAction func didPrressPlusButton(_ sender: UIButton) {
        currentValue.accept(currentValue.value + 1)
    }
    
    func setup() {
        currentValueObservable.subscribe { [weak self] quantity in
            guard let self = self, let quantity = quantity.element else { return }
            self.quantityLabel.text = "\(quantity)"
        }.disposed(by: disposeBag)
    }
}
