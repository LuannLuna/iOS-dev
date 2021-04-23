//
//  Pokemons.swift
//  Pokemon Go
//
//  Created by Luann Marques Luna on 23/04/21.
//  Copyright © 2021 Luann Luna. All rights reserved.
//

import Foundation

public enum Pokemons: String, CaseIterable {
    case abra
    case bellsprout
    case bullbasaur
    case caterpie
    case charmander
    case dratini
    case eevee
    case jigglypuff
    case mankey
    case meowth
    case mew
    case pidgey
    case pikachu
    case psyduck
    case rattata
    case snorlax
    case squirtle
    case venonat
    case weedle
    case zubat
    
    public var name: String {
        return self.rawValue.capitalized
    }
    
    public var imageName: String {
        switch self {
        case .pikachu:
            return "pikachu-2"
        default:
            return self.rawValue
        }
    }
    
}
