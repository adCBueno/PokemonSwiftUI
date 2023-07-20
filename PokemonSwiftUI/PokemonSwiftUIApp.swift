//
//  PokemonSwiftUIApp.swift
//  PokemonSwiftUI
//
//  Created by User on 14/7/23.
//

import SwiftUI

@main
struct PokemonSwiftUIApp: App {
    @StateObject private var loginViewModel = LoginViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(loginViewModel)
        }
    }
}
