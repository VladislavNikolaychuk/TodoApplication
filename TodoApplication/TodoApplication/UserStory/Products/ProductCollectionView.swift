//
//  ProductCollectionView.swift
//  TodoApplication
//
//  Created by Vladislav Nikolaychuck on 29.07.2020.
//  Copyright © 2020 Vladislav Nikolaychuck. All rights reserved.
//

import UIKit

class ProductCollectionView: UICollectionView {
    var products: [Product] = []
}

extension ProductCollectionView: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func numberOfSections (in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt
        indexPath: IndexPath) -> UICollectionViewCell {
        if let itemCell = collectionView.dequeueReusableCell(withReuseIdentifier: CellID.productCell.rawValue, for: indexPath) as? ProductCell {
              let product = products[indexPath.row]
            itemCell.setProductData(product: product)
            return itemCell
            
        }
        return UICollectionViewCell()
    }
}

//extension ProductCollectionView: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let width = (UIScreen.main.bounds.width - 32.0 - 21.0 - 6.0) / 2
//        let height = (width / 161) * 200
//        return CGSize(width: width, height: height)
//    }
//}
