//
//  LoginCarsViewModel.swift
//  AppCarros
//
//  Created by Rodrigo Garcia on 31/10/22.
//

import UIKit

class LoginCarsViewModel: NSObject {
    
    let request = Request()
    
    var loginTextFieldWidthAnchor: CGFloat {
        return 300
    }
    
    var loginTextFieldHeightAnchor: CGFloat {
        return 50
    }
    
    var passWordTextFieldTopAnchorConstantValue: CGFloat {
        return 10
    }
    
    var passWordTextFieldWidthAnchor: CGFloat {
        return 300
    }
    
    var passWordTextFieldHeightAnchor: CGFloat {
        return 50
    }
    
    var buttonLoginTopAnchorConstantValue: CGFloat {
        return 40
    }
    
    var buttonLoginWidthAnchor: CGFloat {
        return 300
    }
    
    var buttonLoginHeightAnchor: CGFloat {
        return 50
    }
    
    var imageLogoCarCenterYAnchorConstant: CGFloat {
        return -200
    }
    
    var imageLogoCarWidth: CGFloat {
        return 300
    }
    
    var imageLogoCarHeight: CGFloat {
        return 300
    }
    
    var buttonForgotPasswordCenterXAnchor: CGFloat {
        return 90
    }
    
    var buttonForgotPasswordWidth: CGFloat {
        return 150
    }
    
    var buttonForgotPasswordHeight: CGFloat {
        return 30
    }
    
    var labelAditionalTopAnchor: CGFloat {
        return 10
    }
    
    var labelAditionalCenterXAnchor: CGFloat {
        return -20
    }
    
    var labelAditionalWidthAnchor: CGFloat {
        return 180
    }
    
    var labelAditionalHeightAnchor: CGFloat {
        return 30
    }
    
    var buttonCreateAccountTopAnchor: CGFloat {
        return 10
    }
    
    var buttonCreateAccountLeadingAnchor: CGFloat {
        return -20
    }
    
    var buttonCreateAccountWidthAnchor: CGFloat {
        return 100
    }
    
    var buttonCreateAccountHeightAnchor: CGFloat {
        return 30
    }
    
    var buttonHelpBottomAnchor: CGFloat {
        return -50
    }
    
    var buttonHelpWidthAnchor: CGFloat {
        return 100
    }
    
    var buttonHelpHeightAnchor: CGFloat {
        return 30
    }
    
    var errorAlertControllerTitle: String {
        return "Erro"
    }
    
    var errorAlertControllerMessage: String {
        return "Usuario ou senha incorretas!"
    }
    
    var errorAlertActionTitle: String {
        return "Ok"
    }
    
    var helpAlertControllerTitle: String {
        return "Carros"
    }
    
    var helpAlertControllerMessage: String {
        return "Voce pode se logar com os seguintes usuarios \n  \n admin/123 \n user/123 "
    }
    
    var helpAlertActionTitle: String {
        return "Ok"
    }
    
    var createAccountAlertControllerTitle: String {
        return "Carros"
    }
    
    var createAccountAlertControllerMessage: String {
        return "Em breve"
    }
    
    var createAccountAlertActionTitle: String {
        return "Ok"
    }
    
    var emptyLabelAlertControllerTitle: String {
        return "Carros"
    }
    
    var emptyLabelAlertControllerMessage: String {
        return "Usuario e senha em branco, favor inserir dados."
    }
    
    var emptyLabelAlertActionTitle: String {
        return "Ok"
    }
               
    func makeRequest(user:String, pass: String, completion: @escaping (Bool) -> Void){
        request.loginRequest(user: user, pass: pass) { sucess in
                completion(sucess)
        }
    }
}

