//
//  PokemonClient.swift
//  Pokedex
//
//  Created by Nathan Johnson on 3/11/17.
//  Copyright © 2017 Nathan Johnson. All rights reserved.
//

import Foundation

class PokemonClient: NSObject {
    private static let BASE_URL = "http://pokeapi.co/api/v2/"
    
    static func getPokemonRefs(with completionHandler:@escaping ([PokemonRef]?, Error?) -> Void) {
        guard let url = URL(string: BASE_URL + "pokemon/?limit=151") else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let err = error {
                completionHandler(nil, err)
            } else {
                guard let responseData = data else { return }
                
                if let json = try? JSONSerialization.jsonObject(with: responseData, options: []),
                    let dict = json as? [String: Any],
                    let results = dict["results"] as? [[String: String]] {
                    var pokemonRefs = [PokemonRef]()
                    
                    for dict in results {
                        pokemonRefs.append(PokemonRef(with: dict))
                    }
                    
                    completionHandler(pokemonRefs, nil)
                }
            }
        }.resume()
    }
    
    static func getPokemon(with url: String, completionHandler: @escaping (Pokemon?, Error?) -> Void) {
        guard let url = URL(string: url) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let err = error {
                completionHandler(nil, err)
            } else {
                guard let responseData = data else { return }
                
                if let json = try? JSONSerialization.jsonObject(with: responseData, options: []),
                    let dict = json as? [String: Any] {
                    completionHandler(Pokemon(with: dict), nil)
                }
            }
        }.resume()
    }
}
