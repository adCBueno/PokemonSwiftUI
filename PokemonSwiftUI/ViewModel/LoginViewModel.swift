//
//  LoginViewModel.swift
//  PokemonSwiftUI
//
//  Created by User on 19/7/23.
//

import Foundation
import Auth0
import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var isAuthenticated = false
    @Published var userProfile = Profile.empty
    
    func login() {
    Auth0
      .webAuth()
      .start { result in
        switch result {
          case .failure(let error):
            print("Failed with: \(error)")

          case .success(let credentials):
            self.isAuthenticated = true
            self.userProfile = Profile.from(credentials.idToken)
            print("Credentials: \(credentials)")
            print("ID token: \(credentials.idToken)")
        }
      }
  }
  
  func logout() {
    Auth0
      .webAuth()
      .clearSession { result in
        switch result {
          case .success:
            self.isAuthenticated = false
            self.userProfile = Profile.empty

          case .failure(let error):
            print("Failed with: \(error)")
        }
      }        
    }
}
