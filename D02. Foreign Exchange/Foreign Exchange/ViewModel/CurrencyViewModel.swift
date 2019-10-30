//
//  CurrencyViewModel.swift
//  Foreign Exchange
//
//  Created by Luann Marques Luna on 30/10/19.
//  Copyright © 2019 Luann Marques Luna. All rights reserved.
//

import Foundation

struct CurrencyViewModel {
    
    weak var dataSource: GenericDataSource<CurrencyRate>?
    weak var service: CurrencyServiceProtocol?
    
    var onErrorHandling : ((ErrorResult?) -> Void)?
    
    init(service: CurrencyServiceProtocol = FileDataService.shared, dataSource : GenericDataSource<CurrencyRate>?) {
        self.dataSource = dataSource
        self.service = service
    }
    
    func fetchCurrencies() {
        
        guard let service = service else {
            onErrorHandling?(ErrorResult.custom(string: "Missing service"))
            return
        }
        
        service.fetchConverter { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let converter) :
                    self.dataSource?.data.value = converter.rates
                case .failure(let error) :
                    self.onErrorHandling?(error)
                }
            }
        }
    }
}
