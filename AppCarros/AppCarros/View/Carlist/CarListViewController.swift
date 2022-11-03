//
//  CarListViewController.swift
//  AppCarros
//
//  Created by Rodrigo Garcia on 30/10/22.
//

import UIKit

class CarListViewController: UIViewController {
    
    let viewModel = CarListViewModel()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.backgroundColor = .systemGreen
        navigationController?.navigationBar.tintColor = .white
        self.navigationItem.title = viewModel.navigationItemTitle
        setupUI()
        makeConstraints()
        request()
        configureBarButton()
    }
    
    func setupUI() {
        view.addSubview(collectionView)
        collectionView.register(CarCell.self, forCellWithReuseIdentifier: CarCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    func makeConstraints() {
        
        NSLayoutConstraint.activate([
            
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: viewModel.collectionViewTopAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func request() {
        viewModel.getRequest { [weak self] sucess in
            if sucess {
                self?.collectionView.reloadData()
            }
        }
    }
    
    func configureBarButton(){
        
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(
                title: viewModel.navBarItemTitle,
                image: UIImage(systemName: viewModel.navBarItemImage),
                target: self ,
                action: #selector(logoutButton(_ :)))
        ]
    }
    
    @objc func logoutButton(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
    }
}
