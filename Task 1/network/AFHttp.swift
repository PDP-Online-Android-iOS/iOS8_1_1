//
//  AFHttp.swift
//  Task 1
//
//  Created by Ogabek Matyakubov on 05/01/23.
//

import Foundation
import Alamofire

private let IS_TESTER = true
private let SERVER_DEVELOPMENT = "https://api.github.com/"
private let SERVER_DEPLOYMENT = "https://api.github.com/"

let headers: HTTPHeaders = [
    "Accept": "application/json"
]

class AFHttp {
    class func get(url: String, params: Parameters, handler: @escaping (AFDataResponse<Any>) -> Void) {
        AF.request(server(url: url), method: .get, parameters: params, headers: headers).validate(statusCode: 200..<500).responseJSON(completionHandler: handler)
    }
    
    // MARK: - AFHttp Mehtods
    class func server(url: String) -> URL {
        if IS_TESTER {
            return URL(string: SERVER_DEPLOYMENT + url)!
        }
        return URL(string: SERVER_DEPLOYMENT + url)!
    }
    
    // MARK: - AFHttp APIs
    static let API_USER_LIST = "users/ogabekdev"
    
    // MARK: - AFHttp Params
    class func emptyParams() -> Parameters {
        let params: Parameters = [:]
        return params
    }
    
}
