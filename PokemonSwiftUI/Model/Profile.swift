//
//  Profile.swift
//  PokemonSwiftUI
//
//  Created by User on 19/7/23.
//

import Foundation
import SwiftUI
import CoreLocation

struct Profile: Hashable, Codable, Identifiable {
    var id: Int
    var username: String = "user1@gmail.com"
    var password: String = "user1"
    
    static let `default` = Profile(id: 1, username: "", password: "")
        
}
