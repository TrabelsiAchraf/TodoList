//
//  APILoginService.swift
//  TodoList
//
//  Created by Achraf TRABELSI on 27/11/2018.
//  Copyright © 2018 Achraf Trabelsi. All rights reserved.
//

import Foundation
import Alamofire

typealias compeletionLoginClosure = ((_ success: Bool, _ user: ReceivedUser, _ error: APIServiceError?) -> ())

protocol APILoginServiceProtocol {
    func login(user: LoginUser, compeletionLoginHandler: @escaping compeletionLoginClosure)
    func register(user: SendUser, compeletionLoginHandler: @escaping compeletionLoginClosure)
}

class APILoginService: APILoginServiceProtocol {
    func register(user: SendUser, compeletionLoginHandler: @escaping compeletionLoginClosure) {
        callRegisterAPI(user: user)
    }
    
    func login(user: LoginUser, compeletionLoginHandler: @escaping compeletionLoginClosure) {
        callLoginAPI(user: user)
        let fakeUser = ReceivedUser(id: "", email: "trabelsi.achraf@gmail.com", password: "12345", name: "Trabelsi Achraf", urlPicture: "https://pbs.twimg.com/profile_images/765367699912392704/dY7-_hnB_400x400.jpg")
        compeletionLoginHandler(true, fakeUser, nil)
    }
    
    func callLoginAPI(user: LoginUser) {
        let params: Parameters = ["name": user.email,
                                  "password": user.password]
        
        Alamofire.request("http://localhost:3000/api/v1/login", method: .post, parameters: params, encoding: JSONEncoding.default)
            .responseJSON { response in
                debugPrint(response)
        }
    }
    
    func callRegisterAPI(user: SendUser) {
        let params: Parameters = ["name": user.name,
                                  "password": user.password,
                                  "email": user.email]
        
        Alamofire.request("http://localhost:3000/api/v1/users", method: .post, parameters: params, encoding: JSONEncoding.default)
            .responseJSON { (response) in
                debugPrint(response)
                do {
                    let root = try JSONDecoder().decode(ReceivedUser.self, from: response.data!)
                } catch {}
        }
    }
}
