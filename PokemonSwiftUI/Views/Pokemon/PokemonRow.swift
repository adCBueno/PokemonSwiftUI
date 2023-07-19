//
//  PokemonRow.swift
//  PokemonSwiftUI
//
//  Created by User on 14/7/23.
//

import SwiftUI

struct PokemonRow: View {
    
    //Add landmark as a stored property of LandmarkRow.
    var pokemon: Pokemon
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: pokemon.urlImage))
            /*pokemon.image
                .resizable()
                .frame(width: 50, height: 50)*/
            Text(pokemon.name)
            Spacer()
        }
    }
}

struct PokemonRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PokemonRow(pokemon: pokemons[0])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
