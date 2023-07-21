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
        
        GeometryReader { geometry in
            VStack {
                ZStack {
                    Rectangle()
                        .fill(.white)
                        .frame(height: geometry.size.height / 3)
                        .border(.yellow, width: 3)
                        .edgesIgnoringSafeArea(.all)
                        .cornerRadius(15)
                        .padding()
                    PikachuImage(imageName: "profile")
                        .frame(width: 250, height: 250)
                }
                
                VStack {
                    Text("email: \(loginViewModel.userProfile.email)")
                        .padding([.bottom], 5)
                        .font(.title2)
                    Button("Logout") {
                        loginViewModel.logout()
                    }
                    .foregroundColor(.cyan)
                    .padding()
                    .frame(width: 150, height: 50)
                    .border(.cyan)
                    .cornerRadius(10)
                    .font(.title2)
                    .bold()
                    .padding([.top, .bottom], 100)
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
