//
//  SSInteractior.swift
//  ShipSpinner
//
//  Created by James Tan on 4/1/15.
//  Copyright (c) 2015 Axon Flux. All rights reserved.
//

import UIKit

class Interactor: NSObject {
    
    var presenter : Presenter? = nil
    var dm : DataManager? = nil
    
    // GET
    
    // getShipList - return list of all ship names
    func getShipList() -> NSArray {
        return dm!.findShipList()
    }
    
    // getShipListNice - return a nice named list of all ships
    func getShipListNice() -> NSArray {
        var niceList : NSMutableArray = []
        var shipList = dm!.findShipList()
        for ship in shipList {
            var shipEntity = getShip(ship as NSString)
            var niceName = shipEntity.shipName
            niceList.addObject(niceName!)
        }
        return niceList
    }
    
    func getShip(id_ship : NSString) -> ShipEntity {
        return dm!.findShip(id_ship)
    }
    
    func idForLastWallpaper() -> NSString {
        return dm!.getDefault("currentWall") as NSString
    }
    
    func idForLastShip() -> NSString {
        return dm!.getDefault("currentShip") as NSString
    }
    
    func shouldRotate() -> NSNumber {
        return dm!.getDefault("shouldRotate") as NSNumber
    }
        
    // SET
    
    func setWallpaper(id : NSString) {
        dm!.saveDefault("currentWall", value: id)
    }
    
    func setShip(id : NSString) {
        dm!.saveDefault("currentShip", value: id)
    }
    
    func setRotateSpeed(v : NSNumber) {
        dm!.saveDefault("shouldRotate", value: v)
    }
    
    func download() {
        dm!.download()
    }
}
