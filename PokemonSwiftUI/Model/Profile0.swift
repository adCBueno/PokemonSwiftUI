//
//  Profile.swift
//  PokemonSwiftUI
//
//  Created by User on 19/7/23.
//

import Foundation
import SwiftUI
import CoreLocation

struct Profile0: Hashable, Codable, Identifiable {
    var id: Int
    var username: String = "user1@gmail.com"
    var password: String = "user1"
    var description: String = "I love sports, painting and gaming. And of course, Pokemon."
    
    static let `default` = Profile0(id: 1, username: "user1@gmail.com", password: "user1", description: "I love sports, painting and gaming. And of course, Pokemon.")
        
}

import JWTDecode


struct Profile {
  
  let id: String
  let name: String
  let email: String
  let emailVerified: String
  let picture: String
  let updatedAt: String

}


extension Profile {
  
  static var empty: Self {
    return Profile(
      id: "",
      name: "",
      email: "",
      emailVerified: "",
      picture: "",
      updatedAt: ""
    )
  }

  static func from(_ idToken: String) -> Self {
    guard
      let jwt = try? decode(jwt: idToken),
      let id = jwt.subject,
      let name = jwt.claim(name: "name").string,
      let email = jwt.claim(name: "email").string,
      let emailVerified = jwt.claim(name: "email_verified").boolean,
      let picture = jwt.claim(name: "picture").string,
      let updatedAt = jwt.claim(name: "updated_at").string
    else {
      return .empty
    }

    return Profile(
      id: id,
      name: name,
      email: email,
      emailVerified: String(describing: emailVerified),
      picture: picture,
      updatedAt: updatedAt
    )
  }
  
}
