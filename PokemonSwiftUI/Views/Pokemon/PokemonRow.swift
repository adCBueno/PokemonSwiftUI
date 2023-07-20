//
//  PokemonRow.swift
//  PokemonSwiftUI
//
//  Created by User on 14/7/23.
//

import SwiftUI
import Kingfisher

struct PokemonRow: View {
    
    // var pokemon: PokemonResponse.Pokemon
    
    var body: some View {
        HStack {
            Image("pikachu")
                .resizable()
                .frame(width: 100, height: 100, alignment: .leading)
                .padding()
            
            Text("Boulbasaur")
                .font(.title)
                .frame(alignment: .center)
                .padding()
        }
        .frame(maxWidth: .infinity, alignment: .leading).border(.yellow, width: 3)
        .padding([.leading, .trailing], 30)
        .shadow(radius: 10)
    }
}

struct PokemonRow_Previews:
    PreviewProvider {
    
    static var previews: some View {
        PokemonRow()
    }
}
