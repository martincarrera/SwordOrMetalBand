//
//  DataHandler.swift
//  SwordOrMetalBand
//
//  Created by mcarrera on 4/6/16.
//  Copyright © 2016 Martín Carrera. All rights reserved.
//

import Foundation
import SwiftyJSON

class DataHandler{

    static func getElements() -> [Element]{
        var elements = [Element]()
        if let path = NSBundle.mainBundle().pathForResource("data", ofType: "json") {
            do {
                let data = try NSData(contentsOfURL: NSURL(fileURLWithPath: path), options: NSDataReadingOptions.DataReadingMappedIfSafe)
                let json = JSON(data: data)
                if let elementArray = json.array {
                    for subJson in elementArray {
                        let element = Element(withId: subJson["id"].intValue, name: subJson["name"].stringValue, type: Type(rawValue: subJson["type"].stringValue)!, description: subJson["description"].stringValue)
                        elements.append(element)
                    }
                } else {
                    print("could not get json from file, make sure that file contains valid json.")
                }
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        } else {
            print("Invalid filename/path.")
        }
        return elements
    }
    
}