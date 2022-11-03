//
//  CarListCollectionView+Delegate.swift
//  AppCarros
//
//  Created by Rodrigo Garcia on 30/10/22.
//

import UIKit

extension CarListViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        let goToDetails = DetailsCarViewController()
        navigationController?.pushViewController(goToDetails, animated: true)
        goToDetails.viewModel.itensByIndex(carList: viewModel.itensByIndex(indexPath: indexPath))
    }
}
