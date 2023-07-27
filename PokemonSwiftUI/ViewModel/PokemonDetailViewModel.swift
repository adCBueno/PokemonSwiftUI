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
    private let pokemonService = PokemonService()

    func loadData(url: String, id: Int) {
        pokemonService.fetchPokemonDetails(url: url, id: id) { [weak self] result in
            switch result {
            case .success(let pokemonDetail):
                DispatchQueue.main.async {
                    self?.pokemonDetail = pokemonDetail
                }
            case .failure(let error):
                print("Fetch failed: \(error.localizedDescription)")
            }
        }
    }
}
