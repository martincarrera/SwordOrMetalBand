//
//  Element.swift
//  SwordOrMetalBand
//
//  Created by mcarrera on 4/4/16.
//  Copyright © 2016 Martín Carrera. All rights reserved.
//

import Foundation

enum Type: String {
    case Sword = "Sword"
    case Metal = "Metal"
}

class Element {
    
    let id: Int!
    let name: String!
    let type: Type!
    let description: String!
    
    init(withId id:Int, name: String, type: Type, description: String){
        self.id = id
        self.name = name
        self.type = type
        self.description = description
    }
}