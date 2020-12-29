//
//  SizeItemCell.swift
//  PizzaWorld
//
//  Created by Muhammad Ewaily on 27/12/2020.
//

import UIKit

class SizeItemCell: UICollectionViewCell {

    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var checkButton: UIButton!
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var numberOfSlicesLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(_ viewModel: SizeItemCellViewModel) {
        sizeLabel.text = viewModel.topStrings
    }
    
    private func handleSelectedCellState() {
        checkButton.isHidden = false
        cellImage.image = #imageLiteral(resourceName: "SelectedPizza")
        sizeLabel.textColor = .black
        numberOfSlicesLabel.textColor = .black
        priceLabel.textColor = #colorLiteral(red: 0.1254901961, green: 0.6705882353, blue: 0.1725490196, alpha: 1)
        cellView.borderColor = #colorLiteral(red: 0.8980392157, green: 0.1607843137, blue: 0.2431372549, alpha: 1)
    }
    
    private func handleUnSelectedCellState() {
        checkButton.isHidden = true
        cellImage.image = #imageLiteral(resourceName: "unselectedPizza")
        sizeLabel.textColor = #colorLiteral(red: 0.6823529412, green: 0.6823529412, blue: 0.6823529412, alpha: 1)
        numberOfSlicesLabel.textColor = #colorLiteral(red: 0.6823529412, green: 0.6823529412, blue: 0.6823529412, alpha: 1)
        priceLabel.textColor = #colorLiteral(red: 0.6823529412, green: 0.6823529412, blue: 0.6823529412, alpha: 1)
        cellView.borderColor = #colorLiteral(red: 0.8784313725, green: 0.8784313725, blue: 0.8784313725, alpha: 1)
    }
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                handleSelectedCellState()
            }
            else {
                handleUnSelectedCellState()
            }
        }
    }
}
