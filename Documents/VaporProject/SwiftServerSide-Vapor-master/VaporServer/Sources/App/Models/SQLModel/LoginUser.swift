//
//  User.swift
//  App
//
//  Created by 晋先森 on 2018/5/26.
//

import Authentication

struct LoginUser: BaseSQLModel {
    
    var id: Int?
    
    var userID: String?
    
    static var entity: String { return self.name + "s" }
    
    private(set) var account: String
    var password: String
 
    init(userID: String,account: String,password: String) {
        self.userID = userID
        self.account = account
        self.password = password
    }
   
    static var createdAtKey: TimestampKey? = \LoginUser.createdAt
    static var updatedAtKey: TimestampKey? = \LoginUser.updatedAt
    var createdAt: Date?
    var updatedAt: Date?
    
}


extension LoginUser: BasicAuthenticatable {
    static var usernameKey: WritableKeyPath<LoginUser, String> = \.account
    static var passwordKey: WritableKeyPath<LoginUser, String> = \.password
}

//extension LoginUser: TokenAuthenticatable {
//
//    typealias TokenType = AccessToken
//}
//
//extension LoginUser: Validatable {
//
//    static func validations() throws -> Validations<LoginUser> {
//        var valid = Validations(LoginUser.self)
//        valid.add(\.account, at: [], .account)
//        valid.add(\.password, at: [], .password)
//
//        return valid
//    }
//}
//




