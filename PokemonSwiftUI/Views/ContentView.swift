//
//  ContentView.swift
//  PokemonSwiftUI
//
//  Created by User on 14/7/23.
//

import SwiftUI

struct ContentView: View {
    
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
       
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

