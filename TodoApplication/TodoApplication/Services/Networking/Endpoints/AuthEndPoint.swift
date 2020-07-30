//
//  AuthEndPoint.swift
//  TodoApplication
//
//  Created by Vladislav Nikolaychuck on 27.07.2020.
//  Copyright © 2020 Vladislav Nikolaychuck. All rights reserved.
//

import Foundation
import Alamofire

enum AuthEndpoint {
    case login(username: String, password: String)
    case signUp(username: String, password: String)
    case getProducts
    case getReviews
}

extension AuthEndpoint: EndPointType {
    
    var baseURL: URL? {
        return URL(string: environmentBaseURL)
    }
    
    
    var path: String {
        switch self {
        case .login:
            return "login/"
        case .signUp:
            return "register/"
        case .getProducts:
            return "products/"
        case .getReviews:
            return "reviews/1"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .login:
            return .post
        case .signUp:
            return .post
        case .getProducts:
            return .get
        case .getReviews:
            return .get
        }
    }
    
    //swiftlint:disable pattern_matching_keywords
    var options: [String: Any]? {
        switch self {
        case .login(let userName, let password):
            let options: [String: Any] = [
                "username": userName,
                "password": password
            ]
            return options
        case .signUp(let userName, let password):
            let options: [String: Any] = [
                "username": userName,
                "password": password
            ]
            return options
        case .getProducts:
            return nil
        case .getReviews:
            return nil
        }
    }
    
    var encoding: ParameterEncoding {
        switch self {
        case .login:
            return JSONEncoding.default
        case .signUp:
            return JSONEncoding.default
        case .getProducts:
            return URLEncoding.default
        case .getReviews:
            return URLEncoding.default
        }
    }
    //swiftlint:enable pattern_matching_keywords
}
