//
//  NetworkResponse.swift
//  REST
//
//  Created by Md Khaled Hasan Manna on 20/6/22.
//

import Foundation

struct NetworkResponse<T: Codable>: Codable {
    var status: String
    var code: Int
    var total: Int
    var data: T
}
