//
//  ListCoins.swift
//  training
//
//  Created by David Tacite on 04/06/2018.
//  Copyright © 2018 David Tacite. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import CoreData

class ListCoins: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
       Alamofire.request("https://api.coinmarketcap.com/v1/ticker/").responseJSON { response in
            switch response.result {
            case .success(let value):
                if let json = JSON(value).array {
                    for coins in json {
                        if let coin = MFCoreDataManager.shared.newObjectInstanceFor(entity: "Coin") as? Coin {
                            coin.fill(json: coins)
                            _ = MFCoreDataManager.shared.saveContext()
                        }
                    }
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
            
        }
        self.tableView.register(UINib(nibName: "Empty", bundle: nil), forCellReuseIdentifier: "listcell")
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if let Coins = MFCoreDataManager.shared.allObjectsFor(entity: "Coin") {
            return Coins.count
        }
        return 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "listcell", for: indexPath) as? CustomCell {
            if let Coins = MFCoreDataManager.shared.allObjectsFor(entity: "Coin") as? [Coin] {
                    let coin = Coins[indexPath.row]
                    if let named = coin.name {
                        cell.name.text = named
                    }
                    if let price = coin.price_usd {
                        cell.price.text = price
                    }
                    if let price = coin.price_btc {
                        cell.priceBTC.text = price
                    }
                    if let symbol = coin.symbol {
                        cell.symbol.text = symbol
                    }
            }
            
            return cell
        }
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let Coins = MFCoreDataManager.shared.allObjectsFor(entity: "Coin") as? [Coin] {
            let coin = Coins[indexPath.row]
            CoinManager.shared.fillCoin(coin: coin)
            let storyboard = UIStoryboard(name: "Test", bundle: Bundle.main)
            if let vc = storyboard.instantiateInitialViewController() {
                self.present(vc, animated: true, completion: nil)
            }
        }
    }
}
