//
//  PathHelper.swift
//  NSUserDefaultsSwift
//
//  Created by Kevin McCafferty on 25/04/2016.
//  Copyright © 2016 Kevin McCafferty. All rights reserved.
//

import Foundation

class PathHelper: NSObject {

    class func pathForItems() -> String? {
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        
        if let documents = paths.first, let documentsURL = NSURL(string: documents) {
            return documentsURL.URLByAppendingPathComponent("items.plist").path
        }
        
        return nil
    }
    
    class func pathForStores() -> String? {
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        
        if let documents = paths.first, let documentsURL = NSURL(string: documents) {
            return documentsURL.URLByAppendingPathComponent("stores.plist").path
        }
        
        return nil
    }
    
}