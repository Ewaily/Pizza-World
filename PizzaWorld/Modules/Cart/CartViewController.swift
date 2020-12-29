//
//  CartViewController.swift
//  PizzaWorld
//
//  Created by Muhammad Ewaily on 29/12/2020.
//

import RxCocoa
import RxSwift
import UIKit

class CartViewController: BaseWireFrame<CartViewModel> {
    @IBOutlet var placeOlderButton: UIButton!
    @IBOutlet var tableView: UITableView!
    
    @IBAction func placeOlderButtonClicked(_ sender: UIButton) {}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    private func configureTableView() {
        registerCells()
        tableView.rx.setDelegate(self).disposed(by: disposeBag)
        viewModel.outputs.cartItemsObservables.bind(to: tableView.rx.items(cellIdentifier: String(describing: CartItemCell.self), cellType: CartItemCell.self)) { [weak self] _, model, cell in
            guard self != nil else { return }
            cell.configure(with: model)
        }.disposed(by: disposeBag)
        
        viewModel.itemHeaderDidChangeObservable.subscribe { [weak self] _ in
            guard let self = self else { return }
            self.tableView.reloadData()
        }.disposed(by: disposeBag)
    }
    
    private func registerCells() {
        tableView.registerCellNib(cellClass: CartHeaderCell.self)
        tableView.registerCellNib(cellClass: CartItemCell.self)
        tableView.registerCellNib(cellClass: CartTotalFooterCell.self)
    }
    
    override func bind(viewModel: CartViewModel) {}
}

extension CartViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeue() as CartHeaderCell
        guard let cartViewModel = viewModel.cartHeaderViewModel else {
            return cell
        }
        cell.configure(with: cartViewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60.0
    }
}
