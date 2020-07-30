//
//  ProductProtocols.swift
//  TodoApplication
//
//  Created by Vladislav Nikolaychuck on 29.07.2020.
//  Copyright © 2020 Vladislav Nikolaychuck. All rights reserved.
//

import Foundation

protocol ProductViewProtocol: class {

    var presenter: ProductPresenterProtocol? { get set }
    
    // PRESENTER -> VIEW
    func showAlert(with message: String)
    func showProduct(_ product: Product)
    func showReviewsList(_ list: [Review])
}


protocol ProductPresenterProtocol: class {
    
    var view: ProductViewProtocol? { get set }
    var interactor: ProductInteractorInputProtocol? { get set }
    var router: ProductRouterProtocol? { get set }
    var product: Product { get set }
    
    // VIEW -> PRESENTER
    func viewDidLoad()
    func navigateToProductPreview()
}

protocol ProductInteractorInputProtocol: class {
    
    var presenter: ProductInteractorOutputProtocol? { get set }
    
    // PRESENTER -> INTERACTOR
    func fetchReviews()
}

protocol ProductInteractorOutputProtocol: class {
    
    // INTERACTOR -> PRESENTER
    func fetchReviewsList(_ list: [Review])
    func fetchReviewsListFail(_ message: String)
}

protocol ProductRouterProtocol: class {

    // PRESENTER -> ROUTER
    func navigateToProductController(from view: ProductViewProtocol)
}

