//
//  SettingsView.swift
//  PokemonSwiftUI
//
//  Created by User on 19/7/23.
//

import SwiftUI

struct SettingsView: View {
    var profile: Profile0
    var body: some View {
        VStack {
            PikachuImage(imageName: "profile")
                .frame(width: 250, height: 250)
            Text(profile.username)
                .padding([.bottom], 5)
                .font(.title2)
            Text("This is me")
                .padding([.bottom], 5)
                .font(.title3)
            Text(profile.description)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(profile: Profile0.default)
    }
}
