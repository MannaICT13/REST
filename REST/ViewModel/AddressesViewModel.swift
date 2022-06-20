//
//  AddressesViewModel.swift
//  REST
//
//  Created by Md Khaled Hasan Manna on 20/6/22.
//

import Foundation

class AddressesViewModel {
    
    class CallBack {
        var didSuccess: ([AddressesResponse]) -> Void = { _ in }
        var didFailure: (String) -> Void = { _ in }
    }
    
    let callBack = CallBack()
    private let quantity: String = "100"
    private let locale: String = "en_US"
    
    func fetchAddresses() {
        AddressesClient.fetchAddresses(for: quantity, locale: locale) { result in
            switch result {
            case .success(let response):
                if response.data.count > 0 {
                    self.callBack.didSuccess(response.data)
                }
            case .failure(let error):
                self.callBack.didFailure(error.localizedDescription)
            }
        }
    }
}
