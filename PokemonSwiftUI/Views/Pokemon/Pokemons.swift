//
//  PokemonList.swift
//  PokemonSwiftUI
//
//  Created by User on 19/7/23.
//

import SwiftUI

struct Pokemons: View {
    
    @ObservedObject var pokemonAPI = PokemonAPI()
    
    var body: some View {
        List(pokemonAPI.pokemons ?? [], id: \.name) { pokemon in
            Text(pokemon.name)
        }
        .onAppear() {
            pokemonAPI.loadData()
        }
        .navigationTitle("Pokemon List")
    }
}

struct Pokemons_Previews: PreviewProvider {
    static var previews: some View {
        Pokemons()
    }
}
