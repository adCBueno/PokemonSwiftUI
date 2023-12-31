//
//  Pokemon.swift
//  PokemonSwiftUI
//
//  Created by User on 14/7/23.
//

import Foundation
import SwiftUI
import CoreLocation

struct PokemonResponse: Codable {
    struct Pokemon: Codable {
        let name: String
        let url: String
        
        var id: Int {
            return Int(url.split(separator: "/").last ?? "") ?? 0
        }
    }
    let results: [Pokemon]
}

struct PokemonDetailResponse: Codable {
    struct TypeElement: Codable {
        struct PokemonType: Codable {
            let name: String
        }
        let type: PokemonType
    }
    let name: String
    let types: [TypeElement]
    let sprites: Sprites
}

struct Sprites: Codable {
    let front_default: String
    let front_shiny: String
}
