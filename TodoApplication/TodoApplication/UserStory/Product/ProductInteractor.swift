//
//  ProductInteractor.swift
//  TodoApplication
//
//  Created by Vladislav Nikolaychuck on 29.07.2020.
//  Copyright © 2020 Vladislav Nikolaychuck. All rights reserved.
//

import Foundation

class ProductInteractor: ProductInteractorInputProtocol {
    
    private let networkManager = NetworkManager()
    var presenter: ProductInteractorOutputProtocol?
    
    func fetchReviews() {
        let request = AuthEndpoint.getReviews
        networkManager.fetch(endPoint: request, responseType: [Review].self) { (result, error) in
            if let result = result {
                self.presenter?.fetchReviewsList(result)
            } else {
                let error = error ?? Text.smthWentWrong.localized
                self.presenter?.fetchReviewsListFail(error)
            }
        }
    }
}
