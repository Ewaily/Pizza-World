//
//  HomeViewController.swift
//  PizzaWorld
//
//  Created by Muhammad Ewaily on 10/20/20.
//

import UIKit
import RxCocoa
import RxSwift
class HomeViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    
    let disposeBag = DisposeBag()
    let viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        registerCell()
        viewModel.viewDidLoad()
        bind()
    }

    func bind() {
        viewModel.slideToItem.subscribe { [weak self] (index) in
            self?.collectionView.scrollToItem(at: IndexPath(row: index, section: 0), at: .centeredHorizontally, animated: true)
        }.disposed(by: disposeBag)
        
        viewModel.slides.subscribe { [weak self] (_) in
            self?.collectionView.reloadData()
        }.disposed(by: disposeBag)
    }
    
    private func setupUI() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func registerCell() {
        collectionView.registerCell(cellClass: SliderCell.self)
    }
    
    init() {
        super.init(nibName: "HomeViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


// MARK: - Slider UICollectionView

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(indexPath: indexPath) as SliderCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.bounds.size
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.didSelectItem()
    }
}


