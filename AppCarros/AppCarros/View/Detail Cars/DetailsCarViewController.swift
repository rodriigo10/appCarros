//
//  DetailsCarViewController.swift
//  AppCarros
//
//  Created by Rodrigo Garcia on 31/10/22.
//

import UIKit
import SDWebImage

class DetailsCarViewController: UIViewController {
    
    let viewModel = CarDetailsViewModel()

    var imageCarDetail: UIImageView = {
        let image = UIImageView(frame: .zero)
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    var labelCarDetailTitle: UILabel = {
        let label = UILabel(frame: .zero)
        label.backgroundColor = UIColor(red: 224/255, green: 224/255, blue: 224/255, alpha: 1.0)
        label.font = .systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    var labelCarDescription: UILabel = {
        let label = UILabel(frame: .zero)
        label.backgroundColor = UIColor(red: 224/255, green: 224/255, blue: 224/255, alpha: 1.0)
        label.font = .systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    var labelCarType: UILabel = {
        let label = UILabel(frame: .zero)
        label.backgroundColor = UIColor(red: 224/255, green: 224/255, blue: 224/255, alpha: 1.0)
        label.font = .systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        makeConstraints()
        details()
        configureBarButton()
    }
    
    func makeConstraints() {
        view.addSubview(imageCarDetail)
        view.addSubview(labelCarDetailTitle)
        view.addSubview(labelCarDescription)
        view.addSubview(labelCarType)
        
        NSLayoutConstraint.activate([
        
            imageCarDetail.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageCarDetail.topAnchor.constraint(equalTo: view.topAnchor, constant: viewModel.imageCarDetailTopAnchor),
            imageCarDetail.heightAnchor.constraint(equalToConstant: viewModel.imageCarDetailHeightAnchor),
            imageCarDetail.widthAnchor.constraint(equalToConstant: viewModel.imageCarDetailWidthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            labelCarDetailTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            labelCarDetailTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            labelCarDetailTitle.topAnchor.constraint(equalTo: imageCarDetail.bottomAnchor),
            labelCarDetailTitle.heightAnchor.constraint(equalToConstant: viewModel.labelCarDetailTitleHeightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            labelCarType.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            labelCarType.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            labelCarType.topAnchor.constraint(equalTo: labelCarDetailTitle.bottomAnchor),
            labelCarType.heightAnchor.constraint(equalToConstant: viewModel.labelCarTypeHeightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            labelCarDescription.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            labelCarDescription.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            labelCarDescription.topAnchor.constraint(equalTo: labelCarType.bottomAnchor),
            labelCarDescription.heightAnchor.constraint(equalToConstant: viewModel.labelCarDescription)
        ])
    }
    
    func details() {
        let imageUrl = URL(string: viewModel.imageCarDetailUrl)
        imageCarDetail.sd_setImage(with: imageUrl, completed: nil)
        labelCarDetailTitle.text = viewModel.titleCarDetail
        labelCarType.text = viewModel.typeCar
        labelCarDescription.text = viewModel.descriptionCar
    }
    
    func errorAlert() {
        let alertController = UIAlertController(title: viewModel.errorAlertTitle, message: viewModel.errorAlertMessage, preferredStyle: .alert)
        let buttonOk = UIAlertAction(title: viewModel.errorAlertActionTitle, style: .default, handler: nil)
        alertController.addAction(buttonOk)
        self.present(alertController, animated: true)
    }
    
    func configureBarButton(){
        
        navigationItem.rightBarButtonItems = [
        UIBarButtonItem(
                title: viewModel.navButtonItemVideoTitle,
                image: UIImage(systemName: viewModel.navButtonItemVideoImage),
                target: self ,
                action: #selector(showMovie(_ :)))
        ]
    }
    
    @objc func showMovie(_ sender: UIBarButtonItem) {
        let videoPlay = VideoPlayViewController()
        if viewModel.videoPlay != "" {
            videoPlay.video = viewModel.videoPlay
            navigationController?.pushViewController(videoPlay, animated: true)
        } else {
            errorAlert()
        }
    }
}
