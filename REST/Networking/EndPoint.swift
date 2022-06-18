//
//  EndPoint.swift
//  REST
//
//  Created by Md Khaled Hasan Manna on 18/6/22.
//

//https://stackoverflow.com/a/55781473/8475638

import Foundation
import Alamofire

protocol APIRouteable: URLRequestConvertible, Encodable {
    associatedtype Parameter: Encodable
    
    var baseURL: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var parameters: Parameter? { get }
    var parametersEncoder: ParameterEncoder { get }
}

extension APIRouteable {
    var method: Alamofire.HTTPMethod {
        return .get
    }
    
    var parametersEncoder: ParameterEncoder {
        return URLEncodedFormParameterEncoder()
    }
    
    var request: URLRequest {
        let url = URL(string: "\(baseURL)\(path)")!
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        return request
    }
    
    func asURLRequest() throws -> URLRequest {
        var request = self.request
        request = try parametersEncoder.encode(parameters, into: request)
        return request
    }
}
