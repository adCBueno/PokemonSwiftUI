//
//  ModelData.swift
//  PokemonSwiftUI
//
//  Created by User on 14/7/23.
//

import Foundation
import Combine

class PokemonListViewModel: ObservableObject {
    @Published var pokemons: [PokemonResponse.Pokemon]?
    private var cancellables = Set<AnyCancellable>()
    private var pokemonService = PokemonService()
    
    func loadData() {
        pokemonService.fetchPokemons { result in
            switch result {
            case .success(let pokemons):
                self.pokemons = pokemons
            case .failure(let error):
                print("Failed to fetch pokemons: \(error)")
                self.pokemons = []
            }
        }
    }
}
