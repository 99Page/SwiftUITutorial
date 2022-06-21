//
//  ModelData.swift
//  SwiftTutorial
//
//  Created by 노우영 on 2022/06/10.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var landmarks: [LandMarkModel] = load("landmarkData.json")
    @Published var profile = Profile.default
    var hikes: [HikeModel] = load("hikeData.json")
    
    var features: [LandMarkModel] {
        landmarks.filter { $0.isFeatured }
    }
    
    var categories: [String: [LandMarkModel]] {
        Dictionary(grouping: landmarks, by: { $0.category.rawValue })
    }
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
    
}
