//
//  HomeViewController.swift
//  PizzaWorld
//
//  Created by Muhammad Ewaily on 10/20/20.
//

import UIKit
import RxCocoa
import RxSwift
class HomeViewController: BaseWireFrame<HomeViewModel> {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        registerCell()
        setupTableView()
        viewModel.viewDidLoad()
    }

    
    override func bind(viewModel: HomeViewModel) {
        viewModel.slideToItem.subscribe { [weak self] (index) in
            self?.collectionView.scrollToItem(at: IndexPath(row: index, section: 0), at: .centeredHorizontally, animated: true)
        }.disposed(by: disposeBag)
        
        viewModel.slides.subscribe { [weak self] (_) in
            self?.collectionView.reloadData()
        }.disposed(by: disposeBag)
        
        viewModel.navigateToItemDetails.subscribe { [weak self] (product) in
            guard let self = self, let product = product.element  else { return }
            self.coordinator.main.navigate(to: .ItemDetails(product: product), with: .push)
        }.disposed(by: disposeBag)
    }
    
    private func setupUI() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func setupTableView() {
        tableView.rx.setDelegate(self).disposed(by: disposeBag)
        viewModel.tableViewSlides.asObservable().bind(to: tableView.rx.items(cellIdentifier: String(describing: PopularCell.self), cellType: PopularCell.self)) { index, model, cell in
            cell.productNameLabel.text = model.title
            cell.ratingView.configureWithRating(rating: index, style: .compact)
            
        }.disposed(by: disposeBag)
        
        tableView.rx.itemSelected.subscribe { [weak self]  (indexPath) in
            guard let self = self, let indexPath = indexPath.element else { return }
            self.viewModel.didSelectItemAtIndexPath(indexPath)
        
        }.disposed(by: disposeBag)
    }
    
    private func registerCell() {
        collectionView.registerCell(cellClass: SliderCell.self)
        tableView.registerCellNib(cellClass: PopularCell.self)
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
}


