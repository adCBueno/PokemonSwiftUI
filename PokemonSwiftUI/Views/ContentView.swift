//
//  ContentView.swift
//  PokemonSwiftUI
//
//  Created by User on 14/7/23.
//

import SwiftUI
import Auth0

struct ContentView: View {
    
    @ObservedObject var pokemonAPI = PokemonListViewModel()
    @ObservedObject var loginViewModel = LoginViewModel()
        
    var body: some View {
        
        if !loginViewModel.isAuthenticated {
            
            NavigationView {
                VStack {
                    LoginView()
                        .padding([.top], 200)
                    Button("Sign in") {
                      loginViewModel.login()
                    }
                    .frame(width: 100, height: 50)
                    .border(.white)
                    .cornerRadius(10)
                    .foregroundColor(.white)
                    .font(.title2)
                    .bold()
                    .padding([.top, .bottom], 100)
                    
                }
                .frame(maxHeight: .infinity)
                .background(GradientBackground())
            }
            
        } else {
                PokemonList()
                    .frame(maxWidth: .infinity)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
     ContentView()
            .environmentObject(LoginViewModel())
    }
}
