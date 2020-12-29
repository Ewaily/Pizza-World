//
//  SizesSelectorView.swift
//  PizzaWorld
//
//  Created by Muhammad Ewaily on 27/12/2020.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class SizesSelectorView: NibLoadingView, UIScrollViewDelegate {
    @IBOutlet weak var collectionView: UICollectionView!
    let disposeBag = DisposeBag()
    let viewModel = SizesSelectorViewModel()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        registerCells()
        setupCollectionView()
    }
    
    
    private func registerCells() {
        collectionView.registerCell(cellClass: SizeItemCell.self)
    }
    
    func setupCollectionView() {
        collectionView.rx.setDelegate(self).disposed(by: disposeBag)
        
        viewModel.output.itemsObservable.bind(to: collectionView.rx.items(cellIdentifier: String(describing: SizeItemCell.self), cellType: SizeItemCell.self)) { [weak self] index, model, cell in
            guard let self = self else {return}
            cell.configure(model)
        }.disposed(by: disposeBag)
    }
    
}

extension SizesSelectorView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.size.width / CGFloat(viewModel.output.numberOfItems)
        return CGSize(width: width, height: collectionView.bounds.size.height)
    }
}
