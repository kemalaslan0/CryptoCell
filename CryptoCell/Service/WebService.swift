//
//  WebService.swift
//  CryptoCell
//
//  Created by Kemal Aslan on 26.10.2022.
//

import Foundation
//escaping tamamlandıktan sonra yap demek internetten bir veriyle çalışacaksak.
//cryptocurrency diziye aldık çünkü binlerce veri var price currency şeklinde eğer 1 tane olsa dizi yapmaya gerek kalmazdı.
//internetten veri aldığımız için option yaptık çünkü belli olmaz sunucu gider internet gider.
 class webservice {
     func downloadCurrencies(url: URL, completion: @escaping ([CryptoCurrency]?) -> ()){
         //completion blok oluşturmayı öğreneceğiz.
         URLSession.shared.dataTask(with: url) { data, response, error in
             if let error = error {
                 print(error.localizedDescription)
                 completion(nil)
             } else if let data = data {
                let cryptoList = try? JSONDecoder().decode([CryptoCurrency].self, from: data)
                 completion(cryptoList)
                 
             }
         }.resume()
         
     }
 }
