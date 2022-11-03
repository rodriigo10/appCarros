//
//  CarDetailsViewModel.swift
//  AppCarros
//
//  Created by Rodrigo Garcia on 31/10/22.
//

import UIKit

class CarDetailsViewModel: NSObject {
    
    var carDetail: CarList?
    
    var imageCarDetailUrl: String {
        return carDetail?.urlFoto ?? ""
    }
    
    var titleCarDetail: String {
        return carDetail?.nome ?? ""
    }
    
    var descriptionCar: String {
        return "Descrição: \(carDetail?.descricao ?? "")"
    }
    
    var typeCar: String {
        return "Tipo: \(carDetail?.tipo ?? "")"
    }
    
    var videoPlay: String {
        return carDetail?.urlVideo ?? ""
    }
    
    var imageCarDetailHeightAnchor: CGFloat {
        return 250
    }
    
    var imageCarDetailWidthAnchor: CGFloat {
        return 250
    }
    
    var imageCarDetailTopAnchor: CGFloat {
        return 50
    }
    
    var labelCarDetailTitleHeightAnchor: CGFloat {
        return 50
    }
    
    var labelCarTypeHeightAnchor: CGFloat {
        return 30
    }
    
    var labelCarDescription: CGFloat {
        return 50
    }
    
    var navButtonItemVideoTitle: String {
        return "Movie"
    }
    
    var navButtonItemVideoImage: String {
        return "video.fill"
    }
    
    var errorAlertTitle: String {
        return "Erro"
    }
    
    var errorAlertMessage: String {
        return "Não há Videos para esse carro"
    }
    
    var errorAlertActionTitle: String {
        return "Ok"
    }
    
    func itensByIndex(carList:CarList?) {
        return self.carDetail = carList
    }
}
