//
//  PikachuImage.swift
//  PokemonSwiftUI
//
//  Created by User on 19/7/23.
//

import SwiftUI

struct PikachuImage: View {
    var body: some View {
        Image("pikachu")
            .resizable()
            .scaledToFit()
            .padding()
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.yellow, lineWidth: 8)
            }
            .shadow(radius: 10)
    }
}

struct PikachuImage_Previews: PreviewProvider {
    static var previews: some View {
        PikachuImage()
    }
}
