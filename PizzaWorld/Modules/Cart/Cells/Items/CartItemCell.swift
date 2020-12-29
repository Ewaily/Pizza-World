//
//  CartItemCell.swift
//  PizzaWorld
//
//  Created by Muhammad Ewaily on 29/12/2020.
//

import UIKit

class CartItemCell: UITableViewCell {

    @IBOutlet weak var pizzaImage: UIImageView!
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var notesLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with viewModel: CartItemCellViewModel) {
        topLabel.text = viewModel.topString
        priceLabel.text = "\(viewModel.price)"
        if let note = viewModel.notesString {
            notesLabel.text = "Notes: " + note
        }
        else {
            notesLabel.text = "Notes: No notes"
        }
    }
    
}
