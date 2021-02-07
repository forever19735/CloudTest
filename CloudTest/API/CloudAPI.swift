//
//  CloudAPI.swift
//  CloudTest
//
//  Created by 季紅 on 2021/2/3.
//  Copyright © 2021 johnlin. All rights reserved.
//

import Foundation

enum CloudAPI {
    case getData
}

extension CloudAPI: EndPointType {
    var task: HTTPTask {
        return .requestPlain
    }
    
    var parameters: CustomParameters? {
        return nil
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
    
    var baseURL: URL {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com") else {
            fatalError("baseURL could not be configured.")
        }
        return url
    }
    
    var path: String {
        switch self {
        case .getData:
            return "/photos"
        }
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
}
