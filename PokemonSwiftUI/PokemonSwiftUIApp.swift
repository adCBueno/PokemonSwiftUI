//
//  PokemonSwiftUIApp.swift
//  PokemonSwiftUI
//
//  Created by User on 14/7/23.
//

import SwiftUI

@main
struct PokemonSwiftUIApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
