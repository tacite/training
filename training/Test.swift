//
//  Test.swift
//  
//
//  Created by David Tacite on 05/06/2018.
//

import UIKit

class Test: UIViewController, UITableViewDataSource, Clicked  {
    //MARK: - Properties
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var testView: UIView!
    @IBOutlet weak var testViewButton: UIView!

    private var _testViewComponent : TestView?
    private var _testViewButton: TestView3?
    
    //MARK: - Init view
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if self._testViewComponent == nil && self._testViewButton == nil {
            
            if let testView = TestView.instanceFromNib() as? TestView {
                self._testViewComponent = testView
                if let coin = CoinManager.shared.getCoin() {
                    if let name = coin.name {
                        self._testViewComponent?.name.text = name
                    }
                }
                self._testViewComponent?.frame = self.testView.bounds
                self.testView.addSubview(testView)
            }
            if let testViewButton = TestView3.instanceFromNib() as? TestView3 {
                self._testViewButton = testViewButton
                self._testViewButton?.delegate = self
                self._testViewButton?.frame = self.testViewButton.bounds
                self.testViewButton.addSubview(testViewButton)
            }
        }
    }
    
    //MARK: - Table view delegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 13
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let coin = CoinManager.shared.getCoin() {
            if let cell = self.tableView.dequeueReusableCell(withIdentifier: "listcell", for: indexPath) as? UITableViewCell {
                switch indexPath.row {
                case 0:
                    if let id = coin.id {
                        print(id)
                        cell.textLabel?.text = "id  " + id
                    }
                case 1:
                    if let symbol = coin.symbol {
                        cell.textLabel?.text = "symbol  " + symbol
                    }
                case 2:
                    if let price = coin.price_usd {
                        cell.textLabel?.text = "price_usd  " + price
                    }
                case 3:
                    if let price = coin.price_btc {
                        cell.textLabel?.text = "price_btc  " + price
                    }
                case 4:
                    if let volume = coin.volume_usd_24h {
                        cell.textLabel?.text = "volume usd 24h  " + volume
                    }
                case 5:
                    if let market = coin.market_cap_usd {
                        cell.textLabel?.text = "market_cap_usd  " + market
                    }
                case 6:
                    if let supply = coin.available_supply {
                        cell.textLabel?.text = "available_supply  " + supply
                    }
                case 7:
                    if let supply = coin.total_supply {
                        cell.textLabel?.text = "total_supply  " + supply
                    }
                case 8:
                    if let supply = coin.max_supply {
                        cell.textLabel?.text = "max_supply  " + supply
                    }
                case 9:
                    if let change = coin.percent_change_1h {
                        cell.textLabel?.text = "percent_change_1h  " + change
                    }
                case 10:
                    if let change = coin.percent_change_24h {
                        cell.textLabel?.text = "percent_change_24h  " + change
                    }
                case 11:
                    if let change = coin.percent_change_7d {
                        cell.textLabel?.text = "percent_change_7d  " + change
                    }
                case 12:
                    if let updated = coin.last_updated {
                        cell.textLabel?.text = "last_updated  " + updated
                    }
                default:
                    cell.textLabel?.text = "test"
                }
                return cell
            }
            return UITableViewCell()
        }
        return UITableViewCell()
    }
    
    //MARK : - Clicked delegate
    func pressed(_ sender: Any) {
        self.showAlert(title: "alerte", message: "rouge")
        print("test")
    }
}
