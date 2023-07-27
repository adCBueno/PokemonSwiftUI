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
                    }
                    return
                }
            }
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
        }
        task.resume()
    }
}
