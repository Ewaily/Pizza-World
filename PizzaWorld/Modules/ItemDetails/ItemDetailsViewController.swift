//
//  ItemDetailsViewController.swift
//  PizzaWorld
//
//  Created by Muhammad Ewaily on 26/12/2020.
//

import UIKit

class ItemDetailsViewController: BaseWireFrame<ItemDetailsViewModel> {

    @IBOutlet weak var pizzaNameLabel: UILabel!
    @IBOutlet weak var pizzaDetailsLabel: UILabel!
    @IBOutlet weak var ratingView: RatingView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad()
    }

    override func bind(viewModel: ItemDetailsViewModel) {
        viewModel.displayMainData.subscribe { [weak self] (viewModel) in
            guard let self = self , let viewModel = viewModel.element else { return }
            self.pizzaNameLabel.text = viewModel.mainTitle
            self.ratingView.configureWithRating(rating: viewModel.rating)
        }.disposed(by: disposeBag)
    }
    
    @IBAction func addToCartButton(_ sender: UIButton) {
        viewModel.didPressAddToCart()
    }
}
