//
//  PokemonRow.swift
//  PokemonSwiftUI
//
//  Created by User on 14/7/23.
//

import SwiftUI
import Kingfisher

struct PokemonRow: View {
    
    var pokemon: PokemonResponse.Pokemon
    
    var body: some View {
        HStack {
            KFImage(URL(string: String(format: ConstantVariables.pokemonImageURL, pokemon.id)))
                .resizable()
                .frame(width: 60, height: 60, alignment: .trailing)
                .padding()
            
            Text(pokemon.name)
                .font(.title2)
                .frame(width: 150, alignment: .leading)
                .padding()
        }
        .frame(maxWidth: .infinity, alignment: .leading).border(.gray, width: 3)
        .padding([.leading, .trailing], 30)
        .shadow(radius: 10)
    }    
}


