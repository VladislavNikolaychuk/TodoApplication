//
//  ProductViewController.swift
//  TodoApplication
//
//  Created by Vladislav Nikolaychuck on 29.07.2020.
//  Copyright © 2020 Vladislav Nikolaychuck. All rights reserved.
//

import UIKit

class ProductViewController: BaseController, ProductViewProtocol {
    
    var presenter: ProductPresenterProtocol?
    @IBOutlet private weak var alert: UILabel!
    @IBOutlet private weak var productImage: UIImageView!
    @IBOutlet private weak var productName: UILabel!
    @IBOutlet private weak var productDescription: UILabel!
    @IBOutlet weak var reviewCollectionView: ReviewCollectionView!
    
    func showAlert(with message: String) {
        hideLoader()
        alert.text = message
    }
    
    func showProduct(_ product: Product) {
        productName.text = product.title
        productDescription.text = product.text
        productImage.setupImage(imageName: product.image)
    }
    
    func showReviewsList(_ list: [Review]) {
        hideLoader()
        reviewCollectionView.reviews = list
        reviewCollectionView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showLoader()
        presenter?.viewDidLoad()
        navigationItem.title = productName.text
        reviewCollectionView.register(UINib(nibName: "ReviewCell", bundle: nil),
                                      forCellWithReuseIdentifier: CellID.reviewCell.rawValue)
        reviewCollectionView.dataSource = reviewCollectionView
        reviewCollectionView.delegate = reviewCollectionView
        
    }
}
