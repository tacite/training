//
//  Coin+CoreDataClass.swift
//  training
//
//  Created by David Tacite on 04/06/2018.
//  Copyright © 2018 David Tacite. All rights reserved.
//
//

import Foundation
import SwiftyJSON
import CoreData

@objc(Coin)
public class Coin: NSManagedObject {
    
        public func fill(json: JSON) {

        self.id = json["id"].string
        self.name = json["name"].string
        self.symbol = json["symbol"].string
        //        self.rank = json["rank"].string
        self.price_usd = json["price_usd"].string
        self.price_btc = json["price_btc"].string
        self.volume_usd_24h = json["24h_volume_usd"].string
        self.market_cap_usd = json["market_cap_usd"].string
        self.available_supply = json["available_supply"].string
        self.total_supply = json["total_supply"].string
        self.max_supply = json["max_supply"].string
        self.percent_change_1h = json["percent_change_1h"].string
        self.percent_change_24h = json["percent_change_24h"].string
        self.percent_change_7d = json["percent_change_7d"].string
        self.last_updated = json["last_updated"].string
    }
}
