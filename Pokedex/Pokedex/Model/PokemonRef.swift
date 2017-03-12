//
//  PokemonRef.swift
//  Pokedex
//
//  Created by Nathan Johnson on 3/11/17.
//  Copyright © 2017 Nathan Johnson. All rights reserved.
//

import UIKit

class PokemonRef: NSObject {
    let name: String?
    let url: String?
    
    init(with dictionary: [String: String]) {
        self.name = dictionary["name"]
        self.url = dictionary["url"]
    }
}
