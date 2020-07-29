//
//  ProductsPresenter.swift
//  TodoApplication
//
//  Created by Vladislav Nikolaychuck on 28.07.2020.
//  Copyright © 2020 Vladislav Nikolaychuck. All rights reserved.
//

import UIKit

class ProductsPresenter: ProductsPresenterProtocol {
    
    var view: ProductsViewProtocol?
    var interactor: ProductsInteractorInputProtocol?
    var router: ProductsRouterProtocol?
    var products: [Product] = []
    
    func viewDidLoad() {
        interactor?.fetchProducts()
    }
    
    func navigateToProductPreview() {
        guard let view = view else { return }
        router?.navigateToProductController(from: view)
    }
    
}

extension ProductsPresenter: ProductsInteractorOutputProtocol {
    
    func fetchProductList(_ list: [Product]) {
        self.products = list
        view?.showProductsList(list)
    }
    
    func fetchProductListFail(_ message: String) {
        view?.showAlert(with: message)
    }
}
