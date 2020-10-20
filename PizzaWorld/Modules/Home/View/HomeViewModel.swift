//
//  HomeViewModel.swift
//  PizzaWorld
//
//  Created by Muhammad Ewaily on 10/20/20.
//

import Foundation
import RxSwift
import RxCocoa

class HomeViewModel {
    private var sliderTimer: Timer?
    var slides: BehaviorRelay<[Int]> = .init(value: [1])
    private var currentSlide = 0
//    Outputs
    
    var sliderToNextItem: ((Int) -> Void)?
    var slideToItem: (PublishSubject<Int>) = .init()
    
// MARK:-     Inputs
    func viewDidLoad() {
        sliderTimer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(scrollToNextSlide), userInfo: nil, repeats: true)
    }

    func didSelectItem() {
        slides.accept([1,2,3])
    }
    
    @objc func scrollToNextSlide() {
        let nextSlide = currentSlide + 1
        currentSlide = nextSlide % slides.value.count
        sliderToNextItem?(currentSlide)
        slideToItem.onNext(currentSlide)
    }
    
    
// MARK:-    Public variables
    var numberOfItems: Int {
        return slides.value.count
    }
}
