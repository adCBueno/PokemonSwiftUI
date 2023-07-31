//
//  PokemonList.swift
//  PokemonSwiftUI
//
//  Created by User on 19/7/23.
//

import SwiftUI

struct PokemonList: View {
    @EnvironmentObject var loginViewModel: LoginViewModel
    @ObservedObject var pokemonAPI = PokemonListViewModel()
    @State private var showingProfile = false
    @State private var pokemonSearched = ""
    
    var body: some View {
        NavigationView {
            List {
                ForEach(pokemonAPI.pokemons?.filter {
                    self.pokemonSearched.isEmpty ? true : $0.name.lowercased().contains(self.pokemonSearched.lowercased())
                } ?? [], id: \.name) { pokemon in
                    NavigationLink {
                        PokemonDetail(pokemon: pokemon)
                    } label: {
                        PokemonRow(pokemon: pokemon)
                    }                    
                }
            }
            .frame(maxWidth: .infinity)
            .onAppear() {
                pokemonAPI.loadData()
            }
            .navigationTitle("Pokemon List")
            .toolbar {
                Button {
                    showingProfile.toggle()
                } label: {
                    Label("User Profile", systemImage: "person.crop.circle")
                }
            }.sheet(isPresented: $showingProfile) {
                SettingsView()
            }
        }.searchable(text: $pokemonSearched)
    }
}

struct PokemonsList_Previews: PreviewProvider {
    static var previews: some View {
        PokemonList()
    }
}
