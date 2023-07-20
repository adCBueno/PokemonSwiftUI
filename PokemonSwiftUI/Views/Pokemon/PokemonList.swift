//
//  PokemonList.swift
//  PokemonSwiftUI
//
//  Created by User on 19/7/23.
//

import SwiftUI

struct PokemonList: View {
    @ObservedObject var loginViewModel = LoginViewModel()
    @ObservedObject var pokemonAPI = PokemonListViewModel()
    @State private var showingProfile = false
    
    var body: some View {
        NavigationView {
            List(pokemonAPI.pokemons ?? [], id: \.name) { pokemon in
                Text(pokemon.name)
            }
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
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        loginViewModel.logout()
                    } label: {
                        Label("Log out", systemImage: "arrowshape.turn.up.left.fill")
                    }
                }
            }
            
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
