//
//  User.swift
//  TodoList
//
//  Created by Achraf Trabelsi on 11/19/18.
//  Copyright © 2018 Achraf Trabelsi. All rights reserved.
//

import Foundation

protocol UserProtocol {
    var email: String { get set }
    var password: String { get set }
}

struct LoginUser: UserProtocol {
    var email: String
    var password: String
}

struct SendUser: UserProtocol {
    var name: String
    var email: String
    var password: String
}

struct ReceivedUser: UserProtocol, Codable {
    var id: String
    var email: String
    var password: String
    var name: String
    var urlPicture: String
}

extension ReceivedUser {
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case email
        case password
        case name
        case urlPicture
    }
}

struct SUCCESS: Codable {
    var receivedUser: ReceivedUser
}
