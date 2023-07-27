//
//  PokemonRealmModel.swift
//  PokemonSwiftUI
//
//  Created by User on 26/7/23.
//

import RealmSwift

class PokemonRealm: Object {
    @Persisted(primaryKey: true) var id: Int
    @Persisted var name: String
    @Persisted var url: String
}

class PokemonDetailRealm: Object {
    @Persisted(primaryKey: true) var id: Int
    @Persisted var name: String
    @Persisted var front_default: String
    @Persisted var front_shiny: String
    @Persisted var types: List<String>
}
