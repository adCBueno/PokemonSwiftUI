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
    }
    
    let results: [Pokemon]
}
