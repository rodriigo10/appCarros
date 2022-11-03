//
//  CarCellCollectionViewCell.swift
//  AppCarros
//
//  Created by Rodrigo Garcia on 30/10/22.
//

import UIKit
import SDWebImage

class CarCell: UICollectionViewCell {
    
    static let identifier = "cell"
    
    var imageCarList: UIImageView = {
        let image = UIImageView(frame: .zero)
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    var labelTitleCar: UILabel = {
        let label = UILabel(frame: .zero)
        label.backgroundColor = UIColor(red: 224/255, green: 224/255, blue: 224/255, alpha: 1.0)
        label.font = .systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.borderWidth = 0.5
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func makeConstraints() {
        addSubview(imageCarList)
        addSubview(labelTitleCar)
        
        NSLayoutConstraint.activate([
            
            imageCarList.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            imageCarList.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            imageCarList.topAnchor.constraint(equalTo: topAnchor),
            imageCarList.heightAnchor.constraint(equalToConstant: 250)
        ])
        
        NSLayoutConstraint.activate([
            labelTitleCar.leadingAnchor.constraint(equalTo: leadingAnchor),
            labelTitleCar.trailingAnchor.constraint(equalTo: trailingAnchor),
            labelTitleCar.topAnchor.constraint(equalTo: imageCarList.bottomAnchor),
            labelTitleCar.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func makeCells(object: CarList? ) {
        let imageURL = URL(string: object?.urlFoto ?? "")
        imageCarList.sd_setImage(with: imageURL, completed: nil)
        labelTitleCar.text = object?.nome ?? ""
    }
}
