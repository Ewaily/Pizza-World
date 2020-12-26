//
//  HomeViewModel.swift
//  PizzaWorld
//
//  Created by Muhammad Ewaily on 10/20/20.
//

import Foundation
import RxSwift
import RxCocoa


protocol HomeViewModelOutput {
    var slideToItem: (PublishSubject<Int>) { get set }
    var navigateToItemDetails: PublishSubject<Product> { get set }
}

protocol HomeViewModelInput {
    func viewDidLoad()
    func scrollToNextSlide()
    func didSelectItemAtIndexPath(_ indexPath: IndexPath)
}

class HomeViewModel: ViewModel, HomeViewModelInput, HomeViewModelOutput{
    
    
    
    
    private var sliderTimer: Timer?
//    private var slides = [1,2,3,4]
    var slides: BehaviorRelay<[Int]> = .init(value: [1])
    var tableViewSlides: BehaviorRelay<[Product]> = .init(value: [
        Product(title: "Product 1"),
        Product(title: "Product 2"),
        Product(title: "Product 3"),
        Product(title: "Product 4"),
        Product(title: "Product 5")
    ])
    
    private var currentSlide = 0
//    Outputs
    
//    var sliderToNextItem: ((Int) -> Void)?
    var slideToItem: (PublishSubject<Int>) = .init()
    var navigateToItemDetails: PublishSubject<Product> = .init()
    
// MARK:-     Inputs
    func viewDidLoad() {
        sliderTimer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(scrollToNextSlide), userInfo: nil, repeats: true)
    }

    func didSelectItem() {
        slides.accept([1,2,3])
    }
    
    func didSelectItemAtIndexPath(_ indexPath: IndexPath) {
        let model = tableViewSlides.value[indexPath.row]
        navigateToItemDetails.onNext(model)
    }
    
    
    @objc func scrollToNextSlide() {
        let nextSlide = currentSlide + 1
        currentSlide = nextSlide % slides.value.count
//        sliderToNextItem?(currentSlide)
        slideToItem.onNext(currentSlide)
    }
    
    
    
// MARK:-    Public variables
    var numberOfItems: Int {
        return slides.value.count
    }
}
