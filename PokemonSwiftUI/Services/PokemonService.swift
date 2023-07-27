//
//  PokemonService.swift
//  PokemonSwiftUI
//
//  Created by User on 26/7/23.
//

import Foundation
import RealmSwift

class PokemonService {
    
    // MARK: LIST
    func fetchPokemons(completion: @escaping (Result<[PokemonResponse.Pokemon], Error>) -> Void) {
        guard let url = URL(string: ConstantVariables.pokeApiEndpoint) else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let decodedData = try JSONDecoder().decode(PokemonResponse.self, from: data)
                    DispatchQueue.main.async {
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
                        completion(.success(decodedData.results))
                    }
                } catch {
                    DispatchQueue.main.async {
                        let realm = try! Realm()
                        let pokemonResults = realm.objects(PokemonRealm.self)
                        let pokemons = Array(pokemonResults.map { PokemonResponse.Pokemon(name: $0.name, url: $0.url) })
                        completion(.success(pokemons))
                    }
                }
            } else if let error = error {
                completion(.failure(error))
            }
        }.resume()
    }
    
    // MARK: DETAIL
    func fetchPokemonDetails(url: String, id: Int, completion: @escaping (Result<PokemonDetailResponse, Error>) -> Void) {
        guard let url = URL(string: url) else {
            print("Invalid URL")
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode(PokemonDetailResponse.self, from: data) {
                    DispatchQueue.main.async {
                        self.saveData(decodedResponse, id: id)
                        completion(.success(decodedResponse))
                    }
                    return
                }
            } else if let error = error {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    func saveData(_ pokemonDetail: PokemonDetailResponse, id: Int) {
        let pokemonDetailRealm = PokemonDetailRealm()
        pokemonDetailRealm.id = id
        pokemonDetailRealm.name = pokemonDetail.name
        pokemonDetailRealm.front_default = pokemonDetail.sprites.front_default
        pokemonDetailRealm.front_shiny = pokemonDetail.sprites.front_shiny
        pokemonDetailRealm.types.append(objectsIn: pokemonDetail.types.map { $0.type.name })
        
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(pokemonDetailRealm, update: .modified)
            }
        } catch {
            print("Failed to save data to database: \(error)")
        }
    }
    
}
