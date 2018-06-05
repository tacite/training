//
//  CoinManager.swift
//  
//
//  Created by David Tacite on 05/06/2018.
//

import Foundation

class CoinManager {
    var coin: Coin? = nil
    
    // MARK: - Instance
    
    static let shared: CoinManager = {
        return CoinManager()
    }()
    
    func fillCoin(coin: Coin?) {
        if let coin = coin {
            self.coin = coin
        }
    }
    
    func getCoin() -> Coin? {
        return self.coin
    }
}
