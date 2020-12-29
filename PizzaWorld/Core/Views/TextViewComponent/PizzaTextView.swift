//
//  PizzaTextView.swift
//  PizzaWorld
//
//  Created by Muhammad Ewaily on 28/12/2020.
//

import UIKit

class PizzaTextView: NibLoadingView {
    @IBOutlet weak var textView: UITextView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    func setup() {
        
    }
}
