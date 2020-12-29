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
    var viewModel: T!
    var coordinator: Coordinator!
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
        bind(viewModel: viewModel)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    func bind(viewModel: T) {
        fatalError("Please override bind function")
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
