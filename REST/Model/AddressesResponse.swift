//
//  AddressesResponse.swift
//  REST
//
//  Created by Md Khaled Hasan Manna on 20/6/22.
//

import Foundation

struct AddressesResponse: Codable {
    let id: Int
    let street, streetName, buildingNumber, city: String
    let zipcode, country, countyCode: String
    let latitude, longitude: Double
    
    enum CodingKeys: String, CodingKey {
        case id, street, streetName, buildingNumber, city, zipcode, country
        case countyCode = "county_code"
        case latitude, longitude
    }
}
