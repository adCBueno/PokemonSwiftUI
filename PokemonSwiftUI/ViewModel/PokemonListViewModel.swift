//
//  ModelData.swift
//  PokemonSwiftUI
//
//  Created by User on 14/7/23.
//

import Foundation

class PokemonListViewModel: ObservableObject {
    @Published var pokemons: [PokemonResponse.Pokemon]? 

    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func saveData(_ pokemons: [PokemonResponse.Pokemon]) {
        do {
            let filename = getDocumentsDirectory().appendingPathComponent("pokemons.json")
            let data = try JSONEncoder().encode(pokemons)
            try data.write(to: filename)
        } catch {
            print("Unable to save data: \(error.localizedDescription)")
        }
    }
    
    func loadDataFromFile() -> [PokemonResponse.Pokemon]? {
        let filename = getDocumentsDirectory().appendingPathComponent("pokemons.json")
    
        do {
            let data = try Data(contentsOf: filename)
            return try JSONDecoder().decode([PokemonResponse.Pokemon].self, from: data)
        } catch {
            print("Unable to load data: \(error.localizedDescription)")
        }
    
        return nil
    }
    
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
                        self?.saveData(decodedData.results)
                    }
                } catch {
                    print("Decoding failed: \(error)")
                    DispatchQueue.main.async {
                        self?.pokemons = self?.loadDataFromFile()
                    }
                }
            }
        }.resume()
    }
}
