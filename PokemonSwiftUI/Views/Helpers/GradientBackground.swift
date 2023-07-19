//
//  GradientBackground.swift
//  PokemonSwiftUI
//
//  Created by User on 19/7/23.
//

import SwiftUI

struct GradientBackground: View {
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.indigo]), startPoint: .leading, endPoint: .trailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct GradientBackground_Previews: PreviewProvider {
    static var previews: some View {
        GradientBackground()
    }
}
