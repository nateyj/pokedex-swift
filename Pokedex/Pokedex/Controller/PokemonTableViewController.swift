//
//  PokemonTableViewController.swift
//  Pokedex
//
//  Created by Nathan Johnson on 3/11/17.
//  Copyright © 2017 Nathan Johnson. All rights reserved.
//

import UIKit

class PokemonTableViewController: UITableViewController {
    var spinner: UIActivityIndicatorView!
    private var pokemonRefs = [PokemonRef]()
    
    // MARK: - View controller life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.spinner = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        self.tableView.backgroundView = self.spinner
        self.loadPokemon()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
    }

    // MARK: - UITableViewDataSource

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.pokemonRefs.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pokemonCell", for: indexPath)
        let pokemonRef = self.pokemonRefs[indexPath.row]
        
        if let name = pokemonRef.name {
            cell.textLabel?.text = name.capitalized
        }
        
        return cell
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vc = segue.destination as? PokemonViewController,
            let cell = sender as? UITableViewCell,
            let indexPath = self.tableView.indexPath(for: cell) else { return }
        vc.pokemonRef = self.pokemonRefs[indexPath.row]
    }
    
    
    // MARK: - Private functions
    
    private func loadPokemon() {
        self.spinner.startAnimating()
        PokemonClient.getPokemonRefs { (pokemonRefs, error) in
            self.spinner.stopAnimating()
            
            if let err = error {
                AlertHelper.showErrorAlert(view: self, message: err.localizedDescription)
            } else {
                if let refs = pokemonRefs {
                    self.pokemonRefs = refs
                    self.tableView.reloadData()
                }
            }
        }
    }

}
