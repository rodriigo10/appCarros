//
//  RecoveryPassword.swift
//  AppCarros
//
//  Created by Rodrigo Garcia on 01/11/22.
//

import UIKit

class RecoveryPasswordViewController: UIViewController {
    
    let viewModel = RecoveryPasswordViewModel()
    
    var recoveryAcess: UITextField = {
        let login = UITextField(frame: .zero)
        login.translatesAutoresizingMaskIntoConstraints = false
        login.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        login.leftViewMode = .always
        login.placeholder = "Insira usuário ou email"
        login.layer.borderWidth = 0.5
        login.clipsToBounds = true
        login.layer.cornerRadius = 10
        return login
    }()
    
    var buttonRecovery: UIButton = {
        let button = UIButton(frame: .zero)
        button.clipsToBounds = true
        button.backgroundColor = UIColor(red: 21/255, green: 61/255, blue: 110/255, alpha: 1.0)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 7
        button.layer.borderWidth = 0.5
        button.setTitle("Enviar", for: .normal)
        button.addTarget(self, action: #selector(buttonSend(_:)), for: .touchUpInside)
        return button
    }()
    
    var buttonCancel: UIButton = {
        let button = UIButton(frame: .zero)
        button.clipsToBounds = true
        button.backgroundColor = .white
        button.setTitleColor(.label, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 7
        button.layer.borderWidth = 0.5
        button.setTitle("Cancelar", for: .normal)
        button.addTarget(self, action: #selector(buttonCancel(_:)), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addSubviews()
        makeConstraints()
        
    }
    
    func addSubviews() {
        view.addSubview(recoveryAcess)
        view.addSubview(buttonRecovery)
        view.addSubview(buttonCancel)
    }
    
    func makeConstraints() {
        
        NSLayoutConstraint.activate([
            
            recoveryAcess.topAnchor.constraint(equalTo: view.topAnchor,constant: viewModel.recoveryAcessTopAnchor),
            recoveryAcess.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            recoveryAcess.widthAnchor.constraint(equalToConstant: viewModel.recoveryAcessWidth),
            recoveryAcess.heightAnchor.constraint(equalToConstant: viewModel.recoveryAcessHeight)
        ])
        
        NSLayoutConstraint.activate([
            
            buttonRecovery.topAnchor.constraint(equalTo: recoveryAcess.bottomAnchor, constant: viewModel.buttonRecoveryTopAnchor),
            buttonRecovery.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: viewModel.buttonRecoveryCenterXAnchor),
            buttonRecovery.widthAnchor.constraint(equalToConstant: viewModel.buttonRecoveryWidthAnchor),
            buttonRecovery.heightAnchor.constraint(equalToConstant: viewModel.buttonRecoveryHeightAnchor)
        ])
        
        NSLayoutConstraint.activate([

            buttonCancel.topAnchor.constraint(equalTo: recoveryAcess.bottomAnchor, constant: viewModel.buttonCancelTopAnchor),
            buttonCancel.trailingAnchor.constraint(equalTo: buttonRecovery.leadingAnchor, constant: viewModel.buttonCancelTrailingAnchor),
            buttonCancel.widthAnchor.constraint(equalToConstant: viewModel.buttonCancelWidthAnchor),
            buttonCancel.heightAnchor.constraint(equalToConstant: viewModel.buttonCancelHeightAnchor)
        ])
    }
    
    @objc func buttonSend(_ sender: UIButton!) {
        alert()
    }
    
    @objc func buttonCancel(_ sender: UIButton!) {
        self.dismiss(animated: true)
    }
    
    func alert() {
        let alert = UIAlertController(
            title: viewModel.alertTitle,
            message: viewModel.alertMessage,
            preferredStyle: .alert)
        
        let actionOk = UIAlertAction(
            title: viewModel.alertActionTitle,
            style: .default)
        
        alert.addAction(actionOk)
        self.present(alert, animated: true)
    }
}
