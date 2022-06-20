//
//  Environment.swift
//  REST
//
//  Created by Md Khaled Hasan Manna on 19/6/22.
//

import Foundation

class Environment {
    static let shared = Environment()
    var baseURL: URL
    private let devBaseURL = "https://fakerapi.it/api/v1"
    private init() {
        baseURL = URL(string: devBaseURL)!
    }
}
