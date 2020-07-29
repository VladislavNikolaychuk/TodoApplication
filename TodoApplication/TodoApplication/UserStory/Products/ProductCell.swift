//
//  ProductCell.swift
//  TodoApplication
//
//  Created by Vladislav Nikolaychuck on 29.07.2020.
//  Copyright © 2020 Vladislav Nikolaychuck. All rights reserved.
//

import UIKit
import Kingfisher

class ProductCell: UICollectionViewCell {
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    var goToSinglePageAction: (() -> Void)?
            
    func setProductData(product: Product) {
        descriptionLabel.text = product.text
        titleLabel.text = product.title
        mainView.layer.cornerRadius = 8.0
        mainView.layer.borderWidth = 1.0
        let url = URL(string: "http://smktesting.herokuapp.com/static/\(product.image)")
        let size = CGSize(width: imageView.bounds.width, height: imageView.bounds.height)
        let processor = DownsamplingImageProcessor(size: size)
            >> RoundCornerImageProcessor(cornerRadius: 0)
        imageView.kf.indicatorType = .activity
        imageView.kf.setImage(
            with: url,
            placeholder: nil,
            options: [
                .processor(processor),
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
            ])
        {
            result in
            switch result {
            case .success(let value):
                print("Task done for: \(value.source.url?.absoluteString ?? "")")
            case .failure(let error):
                print("Job failed: \(error.localizedDescription)")
            }
        }
        
        let tapGesture = UITapGestureRecognizer(target: self,
                                                action: #selector(choosedProduct))
        self.addGestureRecognizer(tapGesture)
        self.isUserInteractionEnabled = true
    }
    @objc func choosedProduct() {
        self.goToSinglePageAction?()
        print("im here")
    }
}
