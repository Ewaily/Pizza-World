//
//  CartHeaderCell.swift
//  PizzaWorld
//
//  Created by Muhammad Ewaily on 29/12/2020.
//

import UIKit

class CartHeaderCell: UITableViewCell {

    @IBOutlet weak var itemsCountLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    func configure(with viewModel: CartHeaderCellViewModel) {
        itemsCountLabel.text = viewModel.itemsCount
        totalLabel.text = viewModel.totalCost
    }
}
