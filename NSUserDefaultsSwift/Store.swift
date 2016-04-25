//
//  Store.swift
//  NSUserDefaultsSwift
//
//  Created by Kevin McCafferty on 25/04/2016.
//  Copyright © 2016 Kevin McCafferty. All rights reserved.
//

import Foundation


class Store: NSObject, NSCoding {
    var storeName: String = ""
    var storeCity: String = ""
    
    init(storeName: String, storeCity: String) {
        super.init()
        self.storeName = storeName
        self.storeCity = storeCity
    }
    
    // this method is not directly called but dealt with automatically
    required init(coder aDecoder: NSCoder) {
        super.init()
        self.storeName = aDecoder.decodeObjectForKey("name") as! String
        self.storeCity = aDecoder.decodeObjectForKey("city") as! String
    }
    
    
    // this method is not directly called but dealt with automatically
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.storeName, forKey: "name")
        aCoder.encodeObject(self.storeCity, forKey: "city")
    }
    
}