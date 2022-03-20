//
//  Rite.swift
//  CopticRites (iOS)
//
//  Created by Andrew Z on 2021-10-04.
//

import Foundation
import SwiftUI

struct Rite: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var videoID: String
    //var biblicalReferences: String
    //var symbols: String
    var rites: String
    var description: String
    var isBookmark : Bool {
        UserDefaults.standard.bool(forKey: "\(self.name)")
    }
    var isFeatured: Bool
    
    var category: Category
        enum Category: String, CaseIterable, Codable {
            case books = "Books"
            case sacraments = "Sacraments"
            case tunes = "Tunes"

    }
    
    private var imageName: String
       var image: Image {
           Image(imageName)
    }
    
    var featureImage: Image? {
           isFeatured ? Image(imageName + "_feature") : nil
    }
    
}
