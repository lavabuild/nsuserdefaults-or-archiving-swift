//
//  ViewController.swift
//  NSUserDefaultsSwift
//
//  Created by Kevin McCafferty on 25/04/2016.
//  Copyright © 2016 Kevin McCafferty. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let userDefaults = NSUserDefaults.standardUserDefaults()
    var itemArray = [Item]()
    var storeArray = [Store]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Retrieve items stored on device
        itemArray = retrieveItems() as! [Item]
        
        // If nothing is stored on device, create items to add to array
        if itemArray.count == 0 {
            var item = Item(itemName: "Macbook", itemDesc: "Laptop", itemPrice: 899.00)
            itemArray.append(item)
            item = Item(itemName: "iPad", itemDesc: "Tablet", itemPrice: 350.00)
            itemArray.append(item)
            saveItems()
        }
        
        
        // Do the same for Stores
        // Retrieve stores stored on device
        storeArray = retrieveStores() as! [Store]
        
        // If nothing is stored on device, create stores to add to array
        if storeArray.count == 0 {
            var store = Store(storeName: "Currys", storeCity: "Belfast")
            storeArray.append(store)
            store = Store(storeName: "Tesco", storeCity: "Derry")
            storeArray.append(store)
            saveStores()
        }
        
        
        // Print out the items in the itemArray
        outputItems()
        outputStores()
        
    }


    func saveItems() -> Void {
        //  Using Archiving
        if let filePath = PathHelper.pathForItems() {
            NSKeyedArchiver.archiveRootObject(itemArray, toFile: filePath)
        }
        
        
        // Using NSUserDefaults
//        let itemsData = NSKeyedArchiver.archivedDataWithRootObject(itemArray)
//        NSUserDefaults.standardUserDefaults().setObject(itemsData, forKey: "items")
    }
    
    
    func retrieveItems() -> NSArray {
//  Using Archiving
        if let filePath = PathHelper.pathForItems() where NSFileManager.defaultManager().fileExistsAtPath(filePath) {
            if let archivedItems = NSKeyedUnarchiver.unarchiveObjectWithFile(filePath) as? [Item] {
                let items = archivedItems
                return items
            }
        }

        
        // Using NSUserDefaults
//        let userDefaultsItemsData = NSUserDefaults.standardUserDefaults().objectForKey("items") as? NSData
//        
//        if let itemsData = userDefaultsItemsData {
//            let userDefaultsItemsArray = NSKeyedUnarchiver.unarchiveObjectWithData(itemsData) as? [Item]
//            
//            if let itemsArray = userDefaultsItemsArray {
//                return itemsArray
//            }
//        }
        return []
    }
    
    
    
    func saveStores() -> Void {
        //  Using Archiving
        if let filePath = PathHelper.pathForStores() {
            NSKeyedArchiver.archiveRootObject(storeArray, toFile: filePath)
        }
        
        
        // Using NSUserDefaults
        //        let itemsData = NSKeyedArchiver.archivedDataWithRootObject(itemArray)
        //        NSUserDefaults.standardUserDefaults().setObject(itemsData, forKey: "items")
    }
    
    
    func retrieveStores() -> NSArray {
        //  Using Archiving
        if let filePath = PathHelper.pathForStores() where NSFileManager.defaultManager().fileExistsAtPath(filePath) {
            if let archivedItems = NSKeyedUnarchiver.unarchiveObjectWithFile(filePath) as? [Store] {
                let stores = archivedItems
                return stores
            }
        }
        
        return []
    }
    
    
    func outputItems() {
        for item in itemArray {
            print(item.itemName)
            print(item.itemDesc)
            print(item.itemPrice)
        }
    }
    
    func outputStores() {
        for store in storeArray {
            print(store.storeName)
            print(store.storeCity)
        }
    }
    
}

