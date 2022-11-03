//
//  CarListViewModel.swift
//  AppCarros
//
//  Created by Rodrigo Garcia on 30/10/22.
//

import UIKit

class CarListViewModel: NSObject {
    
    let request = Request()
    var cars: [CarList]?
    
    var numberOfItens: Int {
        return cars?.count ?? 0
    }
    
    var collectionViewTopAnchor: CGFloat {
        return 100
    }
    
    var navBarItemTitle: String {
        return "LogOut"
    }
    
    var navBarItemImage: String {
        return "door.sliding.right.hand.open"
    }
    
    var navigationItemTitle: String {
        return "Carros"
    }
    
    var collectionViewLayoutHeight: CGFloat {
        return 300
    }
    
    func getRequest(completion: @escaping (Bool) -> Void ) {
        request.makeRequest { [weak self] cars, sucess in
            if sucess {
                guard let self = self else { return }
                self.cars = cars
                completion(true)
            } else{
                completion(false)
            }
        }
    }
    
    func itensByIndex(indexPath: IndexPath) -> CarList? {
        return cars?[indexPath.row]
    }
    
    func namesCar() -> String? {
        return cars?.first?.nome
    }
}
