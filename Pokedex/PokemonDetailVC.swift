//
//  PokemonDetailVC.swift
//  Pokedex
//
//  Created by Gayan Jayasundara on 2017-01-11.
//  Copyright © 2017 Gayan Jayasundara. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {

    var pokemon: Pokemon!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var defenceLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var pokedexLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var attackLabel: UILabel!
    @IBOutlet weak var currentEvoImage: UIImageView!
    @IBOutlet weak var nextEvoimage: UIImageView!
    @IBOutlet weak var evoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pokemon.downloadPokemonDetails {
            // Only run after the network call is complete
            self.updateUI()
        }
    }
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    func updateUI() {
        let image = UIImage(named: "\(pokemon.pokedexId)")
        
        mainImage.image = image
        currentEvoImage.image = image
        pokedexLabel.text = "\(pokemon.pokedexId)"
        typeLabel.text = pokemon.type
        nameLabel.text = pokemon.name.capitalized
        heightLabel.text = pokemon.height
        weightLabel.text = pokemon.weight
        attackLabel.text = pokemon.attack
        defenceLabel.text = pokemon.defence
        descriptionLabel.text = pokemon.description
        
        if pokemon.nextEvolutionId.isEmpty {
            evoLabel.text = "No Evolutions"
            nextEvoimage.isHidden = true
        } else {
            nextEvoimage.isHidden = false
            nextEvoimage.image = UIImage(named: pokemon.nextEvolutionId)
            evoLabel.text = "Next Evolution: \(pokemon.nextEvolutionName) - LVL \(pokemon.nextEvolutionLevel)"
        }
    }
}
