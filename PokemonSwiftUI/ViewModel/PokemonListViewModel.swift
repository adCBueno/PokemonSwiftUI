//
//  ModelData.swift
//  PokemonSwiftUI
//
//  Created by User on 14/7/23.
//

import Foundation
import RealmSwift

class PokemonListViewModel: ObservableObject {
    @Published var pokemons: [PokemonResponse.Pokemon]? 

    func loadData() {
        guard let url = URL(string: ConstantVariables.pokeApiEndpoint) else {
            print("Invalid URL")
            return
        }

        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            if let data = data {
                do {
                    let decodedData = try JSONDecoder().decode(PokemonResponse.self, from: data)
                    DispatchQueue.main.async {
                        self?.pokemons = decodedData.results                        
                        let realm = try! Realm()
                        try! realm.write {
                            for pokemon in decodedData.results {
                                let pokemonRealm = PokemonRealm()
                                pokemonRealm.id = pokemon.id
                                pokemonRealm.name = pokemon.name
                                pokemonRealm.url = pokemon.url
                                realm.add(pokemonRealm, update: .modified)
                            }
                        }
                    }
                } catch {
                    print("Decoding failed: \(error)")
                    DispatchQueue.main.async {
                        let realm = try! Realm()
                        let pokemonResults = realm.objects(PokemonRealm.self)
                        self?.pokemons = pokemonResults.map { PokemonResponse.Pokemon(name: $0.name, url: $0.url) }
                    }
                }
            }
            
        }.resume()
    }
}
