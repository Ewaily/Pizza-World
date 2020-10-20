//
//  SliderCell.swift
//  PizzaWorld
//
//  Created by Muhammad Ewaily on 10/20/20.
//

import UIKit

class SliderCell: UICollectionViewCell {

    @IBOutlet weak var ratingView: RatingView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        ratingView.configureWithRating(rating: 4)
    }

}
