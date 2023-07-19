//
//  LoginView.swift
//  PokemonSwiftUI
//
//  Created by User on 19/7/23.
//

import SwiftUI

struct LoginView: View {
    
    @State private var username: String = ""
    @State private var password: String = ""
    
    var body: some View {
              
                
        VStack {
            
            Text("Welcome Back!")
                .font(.title)
                .frame(alignment: .top)
                .padding()
                .foregroundStyle(.white)
                .bold()
            
            PikachuImage()
                .frame(width: 200, height: 200, alignment: .top)
                .padding()
            
            Text("Enter your username")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.title3)
                .foregroundStyle(.white)
                .bold()
                .padding([.leading, .trailing], 24)
            
            TextField("Username", text: $username)
                .background(.white)
                .frame(height: 55)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .cornerRadius(16)
                .padding([.leading, .trailing], 24)
                .textInputAutocapitalization(.never)
            
            Text("Enter your password")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.title3)
                .foregroundStyle(.white)
                .bold()
                .padding([.leading, .trailing], 24)
            
            SecureField("Enter a password", text: $password)
                .frame(height: 55)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .cornerRadius(16)
                .padding([.leading, .trailing], 24)
                .textInputAutocapitalization(.never)
            
            Button("Sign in") {
                
            }
            .frame(width: 100, height: 50)
            .border(.white)
            .cornerRadius(10)
            .foregroundColor(.white)
            .font(.title2)
            .bold()
            .padding([.top], 15)
                        
        }
        .frame(maxHeight: .infinity)
        .padding()
        .background(GradientBackground())
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
