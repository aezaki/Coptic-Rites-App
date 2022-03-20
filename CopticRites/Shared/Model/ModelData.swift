//
//  ModelData.swift
//  CopticRites (iOS)
//
//  Created by Andrew Z on 2021-10-04.
//

import Foundation
import Combine
import SwiftUI

final class ModelData: ObservableObject {
    @Published var rites: [Rite] = load("Rites.json")

    @Published var profile = Profile.default
    
    var features: [Rite] {
            rites.filter { $0.isFeatured }
    }
    
    //rite.isBookmark = UserDefaults.standard.bool(forKey: "toggle")
    
    
    var categories: [String: [Rite]] {
        Dictionary (
            grouping: rites,
            by: { $0.category.rawValue }
        )
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

