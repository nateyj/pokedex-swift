//
//  Pokemon.swift
//  Pokedex
//
//  Created by Nathan Johnson on 3/11/17.
//  Copyright © 2017 Nathan Johnson. All rights reserved.
//

import UIKit

class Pokemon: NSObject {
    let id: UInt?
    let name: String?
    let weight: UInt?
    let height: UInt?
    
    init(with dictionary:[String: Any]) {
        self.id = dictionary["id"] as? UInt
        self.name = dictionary["name"] as? String
        self.weight = dictionary["weight"] as? UInt
        self.height = dictionary["height"] as? UInt
    }
}
