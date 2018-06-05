//
//  Coin+CoreDataProperties.swift
//  training
//
//  Created by David Tacite on 04/06/2018.
//  Copyright © 2018 David Tacite. All rights reserved.
//
//

import Foundation
import CoreData


extension Coin {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Coin> {
        return NSFetchRequest<Coin>(entityName: "Coin")
    }

    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var symbol: String?
    @NSManaged public var rank: String?
    @NSManaged public var price_usd: String?
    @NSManaged public var price_btc: String?
    @NSManaged public var max_supply: String?
    @NSManaged public var volume_usd_24h: String?
    @NSManaged public var market_cap_usd: String?
    @NSManaged public var available_supply: String?
    @NSManaged public var total_supply: String?
    @NSManaged public var percent_change_1h: String?
    @NSManaged public var percent_change_24h: String?
    @NSManaged public var percent_change_7d: String?
    @NSManaged public var last_updated: String?

}
