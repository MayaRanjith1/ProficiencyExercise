//
//  Router.swift
//  ProficiencyExercise
//
//  Created by Ranjith Karuvadiyil on 29/07/20.
//  Copyright © 2020 Mistybits Pvt Ltd. All rights reserved.
//

import Foundation
import Alamofire

typealias Json = [String : Any]

protocol Router: URLRequestConvertible {
    var method: HTTPMethod {get}
    static var baseUrl: String {get}
    var timeOut: TimeInterval  {get}
    var path: String {get}
    var queryItems: [URLQueryItem]? {get}
    var headers : HTTPHeaders? {get}
    var bodyParams: Any? {get}
    var params: Json {get}
    
}

extension Router{
    var timeOut: TimeInterval{
        return 30.0
    }
    
    var queryItems: [URLQueryItem]?{
        return nil
    }

    static var baseUrl: String{
        return UrlValue.baseUrl
    }

    
    
    func asURLRequest() throws -> URLRequest {
        var url = try type(of: self).baseUrl.asURL()
        url.appendPathComponent(path)
        
        if let queryString = self.queryItems{
            var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
            components?.queryItems = queryString
            if let finalUrl = components?.url{
                url = finalUrl
            }
            
        }
        var urlRequest = URLRequest(url:url)
        urlRequest  .httpMethod = method.rawValue
        urlRequest.timeoutInterval = timeOut
        urlRequest.httpShouldHandleCookies = false
        if let httpHeaders = headers{
            for header in httpHeaders{
                urlRequest.setValue(header.value, forHTTPHeaderField: header.key)
        }
    }
        if let paramaters = bodyParams{
            if let data = paramaters as? Data {
                urlRequest.httpBody = data
            }else{
                urlRequest =  try JSONEncoding.default.encode(urlRequest, withJSONObject: paramaters)
            }
        }else if let contentType = headers?["Content-Type"],
            contentType.caseInsensitiveCompare("application/json") == .orderedSame{
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: params)
        }else{
            urlRequest = try URLEncoding.default.encode(urlRequest, with: params)
        }
        return urlRequest
    }
}
