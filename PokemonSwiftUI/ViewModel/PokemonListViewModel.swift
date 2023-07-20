//
//  ModelData.swift
//  PokemonSwiftUI
//
//  Created by User on 14/7/23.
//

import Foundation

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
                    }
                } catch {
                    print("Decoding failed: \(error)")
                }
            }
        }.resume()
    }
}
