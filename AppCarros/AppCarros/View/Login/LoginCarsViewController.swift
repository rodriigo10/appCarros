//
//  LoginCarsViewController.swift
//  AppCarros
//
//  Created by Rodrigo Garcia on 31/10/22.
//

import UIKit
import Alamofire

class LoginCarsViewController: UIViewController {
    
    let viewModel = LoginCarsViewModel()
    
    var imageLogoCar: UIImageView = {
        let image = UIImageView(frame: .zero)
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "logo")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    var loginTextField: UITextField = {
        let login = UITextField(frame: .zero)
        login.translatesAutoresizingMaskIntoConstraints = false
        login.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        login.leftViewMode = .always
        login.placeholder = "Login"
        login.layer.borderWidth = 0.5
        login.clipsToBounds = true
        login.layer.cornerRadius = 10
        return login
    }()
    
    var passWordTextField: UITextField = {
        let login = UITextField(frame: .zero)
        login.translatesAutoresizingMaskIntoConstraints = false
        login.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        login.leftViewMode = .always
        login.placeholder = "Senha"
        login.layer.borderWidth = 0.5
        login.clipsToBounds = true
        login.layer.cornerRadius = 10
        login.isSecureTextEntry = true
        return login
    }()
    
    var buttonLogin: UIButton = {
        let button = UIButton(frame: .zero)
        button.clipsToBounds = true
        button.backgroundColor = UIColor(red: 21/255, green: 61/255, blue: 110/255, alpha: 1.0)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 7
        button.layer.borderWidth = 0.5
        button.setTitle("Login", for: .normal)
        button.addTarget(self, action: #selector(buttonPlay(_:)), for: .touchUpInside)
        return button
    }()
    
    var buttonForgotPassword: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Esqueçi a senha", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(buttonForgotPass(_ :)), for: .touchUpInside)
        return button
    }()
    
    var buttonCreateAccount: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Criar conta", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(buttonCreateAcc(_ :)), for: .touchUpInside)
        return button
    }()
    
    var buttonHelp: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Ajuda", for: .normal)
        button.setImage(UIImage(systemName: "person.fill.questionmark"), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(buttonHelper(_ :)), for: .touchUpInside)
        return button
    }()
    
    var labelAditional: UILabel = {
        let label = UILabel(frame: .zero)
        label.backgroundColor = .clear
        label.font = .systemFont(ofSize: 15)
        label.text = "Ainda não é cadastrado?"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupKeyboardHiding()
        addSubViews()
        makeConstraints()
    }
    
    func addSubViews() {
        view.addSubview(imageLogoCar)
        view.addSubview(loginTextField)
        view.addSubview(passWordTextField)
        view.addSubview(buttonLogin)
        view.addSubview(buttonForgotPassword)
        view.addSubview(labelAditional)
        view.addSubview(buttonCreateAccount)
        view.addSubview(buttonHelp)
    }
    
    func makeConstraints() {
        
        NSLayoutConstraint.activate([
            
            imageLogoCar.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: viewModel.imageLogoCarCenterYAnchorConstant),
            imageLogoCar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageLogoCar.widthAnchor.constraint(equalToConstant: viewModel.imageLogoCarWidth),
            imageLogoCar.heightAnchor.constraint(equalToConstant: viewModel.imageLogoCarHeight)
        ])
        
        NSLayoutConstraint.activate([
            
            loginTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginTextField.widthAnchor.constraint(equalToConstant: viewModel.loginTextFieldWidthAnchor),
            loginTextField.heightAnchor.constraint(equalToConstant: viewModel.loginTextFieldHeightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            
            passWordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: viewModel.passWordTextFieldTopAnchorConstantValue),
            passWordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passWordTextField.widthAnchor.constraint(equalToConstant: viewModel.passWordTextFieldWidthAnchor),
            passWordTextField.heightAnchor.constraint(equalToConstant: viewModel.passWordTextFieldHeightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            
            buttonLogin.topAnchor.constraint(equalTo: passWordTextField.bottomAnchor, constant: viewModel.buttonLoginTopAnchorConstantValue),
            buttonLogin.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonLogin.widthAnchor.constraint(equalToConstant: viewModel.buttonLoginWidthAnchor),
            buttonLogin.heightAnchor.constraint(equalToConstant: viewModel.buttonLoginHeightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            
            buttonForgotPassword.topAnchor.constraint(equalTo: passWordTextField.bottomAnchor),
            buttonForgotPassword.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: viewModel.buttonForgotPasswordCenterXAnchor),
            buttonForgotPassword.widthAnchor.constraint(equalToConstant: viewModel.buttonForgotPasswordWidth),
            buttonForgotPassword.heightAnchor.constraint(equalToConstant: viewModel.buttonLoginHeightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            
            labelAditional.topAnchor.constraint(equalTo: buttonLogin.bottomAnchor, constant: viewModel.labelAditionalTopAnchor),
            labelAditional.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: viewModel.labelAditionalCenterXAnchor),
            labelAditional.widthAnchor.constraint(equalToConstant: viewModel.labelAditionalWidthAnchor),
            labelAditional.heightAnchor.constraint(equalToConstant: viewModel.labelAditionalHeightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            
            buttonCreateAccount.topAnchor.constraint(equalTo: buttonLogin.bottomAnchor, constant: viewModel.buttonCreateAccountTopAnchor),
            buttonCreateAccount.leadingAnchor.constraint(equalTo: labelAditional.trailingAnchor, constant: viewModel.buttonCreateAccountLeadingAnchor),
            buttonCreateAccount.widthAnchor.constraint(equalToConstant: viewModel.buttonCreateAccountWidthAnchor),
            buttonCreateAccount.heightAnchor.constraint(equalToConstant: viewModel.buttonCreateAccountHeightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            
            buttonHelp.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: viewModel.buttonHelpBottomAnchor),
            buttonHelp.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonHelp.widthAnchor.constraint(equalToConstant: viewModel.buttonHelpWidthAnchor),
            buttonHelp.heightAnchor.constraint(equalToConstant: viewModel.buttonHelpHeightAnchor)
        ])
    }
    
    @objc func buttonPlay(_ sender: UIButton!) {
        
        let user = loginTextField.text ?? ""
        let password = passWordTextField.text ?? ""
        
        viewModel.makeRequest(user: user, pass: password) { [weak self] sucess in
            guard let self = self else { return }
            if sucess{
                let carListViewController = UINavigationController(rootViewController: CarListViewController())
                carListViewController.modalPresentationStyle = .fullScreen
                self.present(carListViewController, animated: true)
            }else if user.isEmpty && password.isEmpty {
                self.emptyLabelAlert()
            }else {
                self.errorAlert()
            }
        }
    }
    
    @objc func buttonForgotPass(_ sender: UIButton!) {
        let recoveryPassword = RecoveryPasswordViewController()
        self.present(recoveryPassword, animated: true)
    }
    
    @objc func buttonCreateAcc(_ sender: UIButton!) {
        createAccountAlert()
    }
    
    @objc func buttonHelper(_ sender: UIButton!) {
        helpAlert()
    }
    
    func errorAlert() {
        
        let alertController = UIAlertController(
            title: viewModel.errorAlertControllerTitle,
            message: viewModel.errorAlertControllerMessage,
            preferredStyle: .alert)
        
        let buttonOk = UIAlertAction(
            title: viewModel.errorAlertActionTitle,
            style: .default) { [weak self] buttonOK in
                guard let  self = self else { return }
                self.passWordTextField.text = ""
                self.loginTextField.text = ""
            }
        
        alertController.addAction(buttonOk)
        self.present(alertController, animated: true)
    }
    
    func helpAlert() {
        let alertController = UIAlertController(
            title: viewModel.helpAlertControllerTitle,
            message: viewModel.helpAlertControllerMessage,
            preferredStyle: .alert)
        
        let buttonOk = UIAlertAction(
            title: viewModel.helpAlertActionTitle,
            style: .default,
            handler: nil )
        
        alertController.addAction(buttonOk)
        self.present(alertController, animated: true)
    }
    
    func createAccountAlert() {
        let alertController = UIAlertController(
            title: viewModel.createAccountAlertControllerTitle,
            message: viewModel.createAccountAlertControllerMessage,
            preferredStyle: .alert)
        
        let buttonOk = UIAlertAction(
            title: viewModel.createAccountAlertActionTitle,
            style: .default,
            handler: nil )
        
        alertController.addAction(buttonOk)
        self.present(alertController, animated: true)
    }
    
    func emptyLabelAlert() {
        let alertController = UIAlertController(
            title: viewModel.emptyLabelAlertControllerTitle,
            message: viewModel.emptyLabelAlertControllerMessage,
            preferredStyle: .alert)
        
        let buttonOk = UIAlertAction(
            title: viewModel.emptyLabelAlertActionTitle,
            style: .default,
            handler: nil )
        
        alertController.addAction(buttonOk)
        self.present(alertController, animated: true)
    }
}

extension LoginCarsViewController {
    
    func setupKeyboardHiding() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    @objc func keyboardWillShow(sender: NSNotification) {
        view.frame.origin.y = view.frame.origin.y - 150
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        view.frame.origin.y = 0
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}
