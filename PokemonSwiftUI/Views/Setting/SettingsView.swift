//
//  SettingsView.swift
//  PokemonSwiftUI
//
//  Created by User on 19/7/23.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var loginViewModel: LoginViewModel
    
    var body: some View {
        VStack {
            PikachuImage(imageName: "profile")
                .frame(width: 250, height: 250)
            Text("email: user1@gmail.com")
                .padding([.bottom], 5)
                .font(.title2)
            Text("Desciption: Love pokemons!")
                .padding([.bottom], 5)
                .font(.title3)
            
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
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
