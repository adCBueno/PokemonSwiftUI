//
//  Pokemon.swift
//  PokemonSwiftUI
//
//  Created by User on 14/7/23.
//

import Foundation
import SwiftUI
import CoreLocation

// The Landmark data already has the id property required by Identifiable protocol; you only need to add a property to decode it when reading the data.
struct Pokemon: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var urlImage: String = ""
        
    // Add an imageName property to read the name of the image from the data, and a computed image property that loads an image from the asset catalog.
        
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    // Add a coordinates property to the structure using a nested Coordinates type that reflects the storage in the JSON data structure.
        
    private var coordinates: Coordinates
    // Compute a locationCoordinate property that’s useful for interacting with the MapKit framework.
    var locationCoordinate: CLLocationCoordinate2D {
         CLLocationCoordinate2D(
             latitude: coordinates.latitude,
             longitude: coordinates.longitude)
     }

    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}
