//
//  PokemonDetail.swift
//  PokemonSwiftUI
//
//  Created by User on 19/7/23.
//

import SwiftUI

struct PokemonDetail: View {
    @EnvironmentObject var pokemonListVM: PokemonListViewModel
    var pokemon: PokemonResponse.Pokemon
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        VStack {
            Text(pokemon.name)
        }
    }
}

struct PokemonDetail_Previews: PreviewProvider {
    static let pokemonListVM = PokemonListViewModel()
    static var previews: some View {
        PokemonDetail(pokemon: PokemonListViewModel().pokemons![0])
            .environmentObject(pokemonListVM)
    }
}
