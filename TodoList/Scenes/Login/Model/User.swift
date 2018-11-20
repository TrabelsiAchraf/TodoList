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

struct SendUser: UserProtocol {
    var email: String
    var password: String
}

struct ReceivedUser: UserProtocol {
    var email: String
    var password: String
    var name: String
    var urlPicture: String
}
