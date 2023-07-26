import Foundation
import Auth0
import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var isAuthenticated = false
    @Published var userProfile = Profile.empty
    
    private let credentialsManager = CredentialsManager(authentication: Auth0.authentication())
    
    init() {
        self.isAuthenticated = credentialsManager.hasValid()
    }
    
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
                        _ = self.credentialsManager.store(credentials: credentials)
                }
            }
    }
    
    func logout() {
        Auth0
            .webAuth()
            .clearSession { [self] result in
                switch result {
                    case .success:
                        self.isAuthenticated = false
                        self.userProfile = Profile.empty
                        _ = self.credentialsManager.clear()

                    case .failure(let error):
                        print("Failed with: \(error)")
                }
            }
    }
}
