//
//  Request.swift
//  AppCarros
//
//  Created by Rodrigo Garcia on 30/10/22.
//

import UIKit
import Alamofire

class Request: NSObject {
    
    // MARK: POST Methods
    func loginRequest(user:String, pass: String, completion: @escaping (Bool) -> Void) {
        
        let url = "https://carros-springboot.herokuapp.com/api/v2/login"
        let param = ["username":user, "password":pass]
        
        AF.request(url, method: .post, parameters: param, encoder: JSONParameterEncoder.default).response { response in
            if response.response?.statusCode == 200 {
                do {
                    let login = try JSONDecoder().decode(Login.self, from: response.data ?? Data())
                    UserDefaults.standard.setValue(login.token ?? "", forKey: "token")
                    completion(true)
                }catch {
                    completion(false)
                }
            } else {
                completion(false)
            }
        }
    }
    
    // MARK: GET Methods
    func makeRequest(completion: @escaping ([CarList]?, Bool) -> Void) {
        
        let token = UserDefaults.standard.object(forKey: "token") as? String ?? ""
        let url = "https://carros-springboot.herokuapp.com/api/v2/carros"
        let key = ["Authorization":"Bearer \(token)"]
        let headers = HTTPHeaders(key)
        AF.request(url, method: .get, headers: headers).response { response in
            if response.response?.statusCode == 200 {
                do {
                    let carList = try JSONDecoder().decode([CarList].self, from: response.data ?? Data())
                    completion(carList, true)
                }catch {
                    completion(nil, false)
                }
            }else {
                completion(nil, false)
            }
        }
    }
}
