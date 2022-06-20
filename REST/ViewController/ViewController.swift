//
//  ViewController.swift
//  REST
//
//  Created by Md Khaled Hasan Manna on 18/6/22.
//

import UIKit

class ViewController: UIViewController {

    let viewModel = AddressesViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        viewModel.fetchAddresses()
        
        viewModel.callBack.didSuccess = { address in
            print(address)
        }
        viewModel.callBack.didFailure = { error in
            print(error)
        }
    }
}

