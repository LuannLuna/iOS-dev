//
//  CoreDataPokemon.swift
//  Pokemon Go
//
//  Created by Luann Marques Luna on 22/04/21.
//  Copyright © 2021 Luann Luna. All rights reserved.
//

import UIKit
import CoreData

class CoreDataPokemon {
    
    private func getContext() -> NSManagedObjectContext? {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let context = appDelegate?.persistentContainer.viewContext
        return context
    }
    
    private func addAllPolkemons() {
        let conntext = getContext()
        
        Pokemons.allCases.forEach {
            createPokemons(name: $0.name, nameImage: $0.imageName, captured: $0 == .pikachu ? true : false)
        }
        
        do {
            try conntext?.save()
        } catch {
            print("Error saving: \(error.localizedDescription)")
        }
    }
    
    private func createPokemons(name: String, nameImage: String, captured: Bool) {
        guard let context = getContext() else { return }
        let pokemon = Pokemon(context: context)
        pokemon.name = name
        pokemon.nameImage = nameImage
        pokemon.captured = captured
    }
    
    func getAllPokemons() -> [Pokemon]? {
        guard let context = getContext() else { return nil }
        
        do {
            let pokemons = try context.fetch(Pokemon.fetchRequest()) as? [Pokemon]
            if pokemons?.count == 0 {
                addAllPolkemons()
                return getAllPokemons()
            }
            return pokemons
        } catch {
            print("Error getting: \(error.localizedDescription)")
        }
        return nil
    }
    
    func getCapturedPokemons(captured: Bool) -> [Pokemon]? {
        return getAllPokemons()?.filter { $0.captured == captured }
    }
    
    func savePokemon(pokemon: Pokemon) {
        guard let context = getContext() else { return }
        pokemon.captured = true
        
        do {
            try context.save()
        } catch {
            print("Error saving: \(error.localizedDescription)")
        }
    }
}
