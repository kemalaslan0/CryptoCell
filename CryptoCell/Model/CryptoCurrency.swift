//
//  CryptoCurrency.swift
//  CryptoCell
//
//  Created by Kemal Aslan on 26.10.2022.
//

import Foundation
//hem get hem post işlemi için Codable. Get için decodable. encodable post için servera birşey yazmıyoruz o yüzden serverdan çekiyoruz decodable kullanırız.
struct CryptoCurrency : Decodable {
    let currency : String
    let price : String
}
