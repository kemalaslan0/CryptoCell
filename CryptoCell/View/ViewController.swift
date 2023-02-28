//
//  ViewController.swift
//  CryptoCell
//
//  Created by Kemal Aslan on 26.10.2022.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    private var cryptoListViewModel : CryptoListViewModel!
    var colorArray = [UIColor]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        self.colorArray = [
            UIColor(red: 75/255, green: 40/255, blue: 170/255, alpha: 1.0),
            UIColor(red: 175/255, green: 150/255, blue: 30/255, alpha: 1.0),
            UIColor(red: 140/255, green: 100/255, blue: 110/255, alpha: 1.0),
            UIColor(red: 192/255, green: 30/255, blue: 50/255, alpha: 1.0),
            UIColor(red: 125/255, green: 80/255, blue: 40/255, alpha: 1.0),
            UIColor(red: 55/255, green: 175/255, blue: 30/255, alpha: 1.0)
        
        ]
        getData()
        
    }
    func  getData(){
        let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!
        webservice().downloadCurrencies(url: url) { (cryptos) in
            if let cryptos = cryptos {
                self.cryptoListViewModel = CryptoListViewModel(cryptoCurrencyList: cryptos)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cryptoListViewModel == nil ? 0 : self.cryptoListViewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CryptoCell", for: indexPath) as! CryptoTableViewCell
        let cryptoViewModel = self.cryptoListViewModel.cryptoAtIndex(indexPath.row)
        cell.priceText.text = cryptoViewModel.price
        cell.currencyText.text = cryptoViewModel.name
        cell.backgroundColor = self.colorArray[indexPath.row % 6]
        return cell
    }

}

