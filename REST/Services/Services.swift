//
//  Services.swift
//  REST
//
//  Created by Md Khaled Hasan Manna on 19/6/22.
//

import Foundation
import Alamofire

private struct AddressRoute: APIRouteable {
    var baseURL: String = Environment.shared.baseURL.absoluteString
    var path: String = "addresses"
    var method: HTTPMethod = .get
    var parameters: Parameter?
    
    struct Parameter: Codable {
        let quantity: String
        let locale: String
        enum CoodingKeys: String, CodingKey {
            case quantity = "_quantity"
            case locale = "_locale"
        }
    }
    init(parameters: Parameter) {
        self.parameters = parameters
    }
}

enum AddressesClient: GenericAPIClient {
    static func fetchAddresses(for quantity: String, locale: String, completion: @escaping (Result<NetworkResponse<AddressesResponse>, AFError>) -> Void) {
        let parameter = AddressRoute.Parameter(quantity: quantity, locale: locale)
        let route = AddressRoute(parameters: parameter)
        startRequest(with: route, completion: completion)
    }
}
