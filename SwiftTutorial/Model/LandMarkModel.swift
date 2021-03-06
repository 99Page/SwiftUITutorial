//
//  LandMarkModel.swift
//  SwiftTutorial
//
//  Created by 노우영 on 2022/06/10.
//

import SwiftUI
import MapKit

struct LandMarkModel: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    var isFavorite: Bool
    var isFeatured: Bool
    
    var category: Category
    enum Category: String, CaseIterable, Codable {
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
    }
    
    private var imageName: String
    
    var image: Image {
        Image(imageName)
    }
    
    private var coordinates: Coordinates
    var locationCoordinates: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
                    latitude: coordinates.latitude,
                    longitude: coordinates.longitude)
    }
    
    var featureImage: Image? {
        isFeatured ? Image(imageName + "_feature") : nil 
    }
    
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
    
}
