//
//  BaseWireFrame.swift
//  PizzaWorld
//
//  Created by Muhammad Ewaily on 26/12/2020.
//

import Foundation
import UIKit
import RxCocoa
import RxSwift

protocol ViewModel {
    
}

class BaseWireFrame<T: ViewModel>: UIViewController {
    let viewModel: T
    var coordinator: Coordinator
    lazy var disposeBag:  DisposeBag = {
        return DisposeBag()
    }()
    
    init(viewModel: T, coordinator: Coordinator) {
        self.viewModel = viewModel
        self.coordinator = coordinator
        super.init(nibName: String(describing: type(of: self)), bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind(viewMode: viewModel)
    }

    func bind(viewMode: T) {
        fatalError("Please override bind function")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
