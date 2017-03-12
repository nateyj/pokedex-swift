//
//  PokemonViewController.swift
//  Pokedex
//
//  Created by Nathan Johnson on 3/12/17.
//  Copyright © 2017 Nathan Johnson. All rights reserved.
//

import UIKit

class PokemonViewController: UIViewController {
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var stackView: UIStackView!
    
    var pokemonRef: PokemonRef!
    var pokemon: Pokemon?
    
    // MARK: - View controller life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = pokemonRef.name?.capitalized
        self.loadPokemon()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - Private functions
    
    private func loadPokemon() {
        PokemonClient.getPokemon(with: self.pokemonRef.url!) { (pokemon, error) in
            self.spinner.stopAnimating()
            
            if let err = error {
                AlertHelper.showErrorAlert(view: self, message: err.localizedDescription)
            } else {
                self.pokemon = pokemon
                
                guard let poke = pokemon else { return }
                self.stackView.isHidden = false
                
                if let weight = poke.weight {
                    self.weightLabel.text = "Weight: \(weight)"
                }
                
                if let height = poke.height {
                    self.heightLabel.text = "Height: \(height)"
                }
            }
        }
    }
}
