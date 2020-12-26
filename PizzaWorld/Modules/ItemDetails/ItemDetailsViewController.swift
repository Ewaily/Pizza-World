//
//  ItemDetailsViewController.swift
//  PizzaWorld
//
//  Created by Muhammad Ewaily on 26/12/2020.
//

import UIKit

class ItemDetailsViewController: BaseWireFrame<ItemDetailsViewModel> {

    @IBOutlet weak var pizzaNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad()
    }

    override func bind(viewMode: ItemDetailsViewModel) {
        viewModel.displayMainData.subscribe { [weak self] (viewModel) in
            guard let self = self , let viewModel = viewModel.element else { return }
            self.pizzaNameLabel.text = viewModel.mainTitle
        }.disposed(by: disposeBag)
    }
}
