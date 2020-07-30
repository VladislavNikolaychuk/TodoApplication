//
//  ProductsViewController.swift
//  TodoApplication
//
//  Created by Vladislav Nikolaychuck on 28.07.2020.
//  Copyright © 2020 Vladislav Nikolaychuck. All rights reserved.
//

import UIKit

class ProductsViewController: BaseController, ProductsViewProtocol {
    
    @IBOutlet weak var alert: UILabel!
    @IBOutlet weak var productsCollectionView: ProductCollectionView!
    var presenter: ProductsPresenterProtocol?
    
    func showAlert(with message: String) {
        hideLoader()
        alert.text = message
    }
    
    func showProductsList(_ list: [Product]) {
        hideLoader()
        productsCollectionView.products = list
        productsCollectionView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = Text.products.localized
        showLoader()
        presenter?.viewDidLoad()
        productsCollectionView.register(UINib(nibName: "ProductCell", bundle: nil),
                                    forCellWithReuseIdentifier: CellID.productCell.rawValue)
        productsCollectionView.dataSource = productsCollectionView
        productsCollectionView.delegate = productsCollectionView
        productsCollectionView.productDidTap = { [weak self] product in
            self?.presenter?.navigateToProductPreview(product: product)
        }
        
    }
    @IBAction func logoutAction(_ sender: Any) {
        AppRouter.runAuthFlow()
    }
}
