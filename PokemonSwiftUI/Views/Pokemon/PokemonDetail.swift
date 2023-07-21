//
//  PokemonDetail.swift
//  PokemonSwiftUI
//
//  Created by User on 19/7/23.
//

import SwiftUI
import Kingfisher

struct PokemonDetail: View {
    @EnvironmentObject var pokemonListVM: PokemonListViewModel
    @ObservedObject var viewModel = PokemonDetailViewModel()
    
    var pokemon: PokemonResponse.Pokemon
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                ZStack {
                    Rectangle()
                        .fill(.white)
                        .frame(height: geometry.size.height / 3)
                        .border(.gray, width: 3)
                        .edgesIgnoringSafeArea(.all)
                        .cornerRadius(15)
                        .padding()
                    KFImage(URL(string: String(format: ConstantVariables.pokemonImageURL, pokemon.id)))
                        .resizable()
                        .frame(width: 200, height: 200, alignment: .center)
                        .padding([.bottom], 10)
                }
                
                VStack {
                    Text(viewModel.pokemonDetail?.name ?? "")
                        .font(.title2)
                        .padding()
                    Text("Primary Type: " + (viewModel.pokemonDetail?.types.first?.type.name ?? ""))
                    Text("Secondary Type: " + (viewModel.pokemonDetail?.types.dropFirst().first?.type.name ?? "None"))
                    HStack {
                        KFImage(URL(string: viewModel.pokemonDetail?.sprites.front_default ?? ""))
                        KFImage(URL(string: viewModel.pokemonDetail?.sprites.front_shiny ?? ""))
                    }
                }
                .frame(maxHeight: .infinity, alignment: .top)
                .padding()
                .onAppear {
                    viewModel.loadData(url: pokemon.url)
                }
            }
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
