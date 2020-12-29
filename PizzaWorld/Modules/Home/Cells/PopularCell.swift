//
//  PopularCell.swift
//  PizzaWorld
//
//  Created by Muhammad Ewaily on 10/20/20.
//

import UIKit

class PopularCell: UITableViewCell {

    @IBOutlet weak var ratingView: RatingView!
    
    @IBOutlet weak var productNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        ratingView.stackView.removeAllArrangedSubviews()
    }
}
