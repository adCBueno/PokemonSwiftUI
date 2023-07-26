//
//  PokemonDetailViewModel.swift
//  PokemonSwiftUI
//
//  Created by User on 21/7/23.
//

import Foundation

class PokemonDetailViewModel: ObservableObject {
    @Published var pokemonDetail: PokemonDetailResponse?

    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func saveData(_ pokemonDetail: PokemonDetailResponse, id: Int) {
        do {
            let filename = getDocumentsDirectory().appendingPathComponent("pokemon_\(id).json")
            let data = try JSONEncoder().encode(pokemonDetail)
            try data.write(to: filename)
        } catch {
            print("Unable to save data: \(error.localizedDescription)")
        }
    }
    
    func loadDataFromFile(id: Int) -> PokemonDetailResponse? {
        let filename = getDocumentsDirectory().appendingPathComponent("pokemon_\(id).json")

        do {
            let data = try Data(contentsOf: filename)
            return try JSONDecoder().decode(PokemonDetailResponse.self, from: data)
        } catch {
            print("Unable to load data: \(error.localizedDescription)")
        }

        return nil
    }
    
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
            DispatchQueue.main.async {
                self.pokemonDetail = self.loadDataFromFile(id: id)
            }
        }
        task.resume()
    }
}
