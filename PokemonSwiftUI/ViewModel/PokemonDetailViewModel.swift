//
//  PokemonDetailViewModel.swift
//  PokemonSwiftUI
//
//  Created by User on 21/7/23.
//

import Foundation
import RealmSwift

class PokemonDetailViewModel: ObservableObject {
    @Published var pokemonDetail: PokemonDetailResponse?


    func loadData(url: String, id: Int) {
        guard let url = URL(string: url) else {
            print("Invalid URL")
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode(PokemonDetailResponse.self, from: data) {
                    DispatchQueue.main.async {
                        self.pokemonDetail = decodedResponse
                        self.saveData(decodedResponse, id: id)
                    }
                    return
                }
            }
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
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
    
    func loadDataFromFile(id: Int) -> PokemonDetailResponse? {
        
        do {
            let realm = try Realm()
            if let pokemonDetailRealm = realm.object(ofType: PokemonDetailRealm.self, forPrimaryKey: id) {
                let types = Array(pokemonDetailRealm.types.map { PokemonDetailResponse.TypeElement(type: PokemonDetailResponse.TypeElement.PokemonType(name: $0)) })
                let sprites = Sprites(front_default: pokemonDetailRealm.front_default, front_shiny: pokemonDetailRealm.front_shiny)
                return PokemonDetailResponse(name: pokemonDetailRealm.name, types: types, sprites: sprites)

            }
        } catch {
            print("Failed to load data from database: \(error)")
        }
        return nil
    }
}
