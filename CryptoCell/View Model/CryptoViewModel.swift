//
//  CryptoViewModel.swift
//  CryptoCell
//
//  Created by Kemal Aslan on 26.10.2022.
//

import Foundation
struct CryptoListViewModel {
    let cryptoCurrencyList : [CryptoCurrency]
    
    func numberOfRowsInSection() -> Int {
        return self.cryptoCurrencyList.count
    }
    func cryptoAtIndex(_ index: Int)-> CryptoViewModel {
        let crypto = self.cryptoCurrencyList[index]
        return CryptoViewModel(cryptoCurrency: crypto)
    }
}
struct CryptoViewModel {
    let cryptoCurrency : CryptoCurrency
    var name : String {
        return self.cryptoCurrency.currency
        
    }
    var price : String {
        return self.cryptoCurrency.price
    }
}
