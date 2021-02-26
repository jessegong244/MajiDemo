//
//  MJNetworking.swift
//  MajiDemo
//
//  Created by 龚伟强 on 2021/2/25.
//

import Foundation
import Moya

let MjProvider = MoyaProvider<MjAPI>()


enum MjAPI {
    case base
}

extension MjAPI: TargetType {
    //服务器地址
    public var baseURL: URL {
         return URL(string: "https://api.github.com/")!
    }

    var path: String {
        switch self {
            case .base: return ""

        }
    }
    var method: Moya.Method {
        return .get
    }
    
    var task: Task {
        var parmeters:[String:Any] = [:]
        switch self {
        case .base:
            parmeters = ["":""]
        }
        return .requestParameters(parameters: parmeters, encoding: URLEncoding.default)
    }
    
    var sampleData: Data {
        return "".data(using: String.Encoding.utf8)!
        
    }
    var headers: [String : String]? { return nil }
}


