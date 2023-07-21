//
//  LoginView.swift
//  PokemonSwiftUI
//
//  Created by User on 19/7/23.
//

import SwiftUI
import Auth0

struct LoginView: View {
    
    var body: some View {
              
        NavigationView {
            VStack {
                
                Text("Welcome Back!")
                    .font(.title)
                    .frame(alignment: .top)
                    .padding()
                    .foregroundStyle(.white)
                    .bold()
                
                PikachuImage(imageName: "pikachu")
                    .frame(width: 200, height: 200, alignment: .top)
                    .padding()
                                            
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(GradientBackground())
            
        }
    }    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
