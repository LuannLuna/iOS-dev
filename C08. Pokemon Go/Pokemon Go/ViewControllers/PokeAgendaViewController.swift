//
//  PokeAgendaViewController.swift
//  Pokemon Go
//
//  Created by Luann Marques Luna on 23/04/21.
//  Copyright © 2021 Luann Luna. All rights reserved.
//

import UIKit

class PokeAgendaViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!  
    
    var notCapturedPokemons: [Pokemon] = []
    var capturedPokemons: [Pokemon] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        let coreData = CoreDataPokemon()
        
        capturedPokemons = coreData.getCapturedPokemons(captured: true) ?? []
        notCapturedPokemons = coreData.getCapturedPokemons(captured: false) ?? []
        
        tableView.reloadData()
        
    }
    
    @IBAction func back() {
        dismiss(animated: true, completion: nil)
    }
}

extension PokeAgendaViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 { return capturedPokemons.count}
        return notCapturedPokemons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let pokemon: Pokemon = indexPath.section == 0 ?
                                capturedPokemons[indexPath.row] :
                                notCapturedPokemons[indexPath.row]
        
        cell.textLabel?.text = pokemon.name
        cell.imageView?.image = UIImage(named: pokemon.nameImage!)
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 { return "Capturados" }
        return "Não Capturados"
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension PokeAgendaViewController: UITableViewDelegate {}
