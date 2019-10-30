//
//  CurrencyService.swift
//  Foreign Exchange
//
//  Created by Luann Marques Luna on 30/10/19.
//  Copyright © 2019 Luann Marques Luna. All rights reserved.
//

import Foundation

protocol CurrencyServiceProtocol: class {
    func fetchConverter(_ completion: @escaping ((Result<Converter, ErrorResult>) -> Void))
}

final class CurrencyService: RequestHandler, CurrencyServiceProtocol {
    
    static let shared = CurrencyService()
    
    let endpoint = "https://api.fixer.io/latest?base=GBP"
    var task : URLSessionTask?
    
    func fetchConverter(_ completion: @escaping ((Result<Converter, ErrorResult>) -> Void)) {
        
        // cancel previous request if already in progress
        self.cancelFetchCurrencies()
        
        task = RequestService().loadData(urlString: endpoint, completion: self.networkResult(completion: completion))
    }
    
    func cancelFetchCurrencies() {
        
        if let task = task {
            task.cancel()
        }
        task = nil
    }
}

