//
//  Item.swift
//  NSUserDefaultsSwift
//
//  Created by Kevin McCafferty on 25/04/2016.
//  Copyright © 2016 Kevin McCafferty. All rights reserved.
//

import UIKit


class Item: NSObject, NSCoding {
    
    var itemName: String = ""
    var itemDesc: String = ""
    var itemPrice: Double = 0.0

    
    init(itemName: String, itemDesc: String, itemPrice: Double) {
        super.init()
        self.itemName = itemName
        self.itemDesc = itemDesc
        self.itemPrice = itemPrice
    }
    
    
    // this method is not directly called but dealt with automatically
    required init(coder aDecoder: NSCoder) {
        super.init()
        self.itemName = aDecoder.decodeObjectForKey("name") as! String
        self.itemDesc = aDecoder.decodeObjectForKey("desc") as! String
        self.itemPrice = aDecoder.decodeObjectForKey("price") as! Double
    }

    
    // this method is not directly called but dealt with automatically
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.itemName, forKey: "name")
        aCoder.encodeObject(self.itemDesc, forKey: "desc")
        aCoder.encodeObject(self.itemPrice, forKey: "price")
    }
    
    
}
