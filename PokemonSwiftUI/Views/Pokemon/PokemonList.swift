//
//  PokemonList.swift
//  PokemonSwiftUI
//
//  Created by User on 19/7/23.
//

import SwiftUI

struct PokemonList: View {
    
    @ObservedObject var pokemonAPI = PokemonListViewModel()
      
    var body: some View {
        NavigationView {
            List(pokemonAPI.pokemons ?? [], id: \.name) { pokemon in
                Text(pokemon.name)
            }
            .onAppear() {
                pokemonAPI.loadData()
            }
            .navigationTitle("Pokemon List")
            .navigationBarItems(leading: Image(systemName: "arrowshape.turn.up.left.fill"))
            .navigationBarItems(trailing:  Image(systemName: "person.crop.circle"))
            
            NavigationLink {
                PokemonDetail()
            } label: {
                PokemonRow()
            }
        }
    }
}

struct PokemonsList_Previews: PreviewProvider {
    static var previews: some View {
        PokemonList()
    }
}
