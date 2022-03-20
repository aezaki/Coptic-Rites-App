//
//  Profile.swift
//  CopticRites (iOS)
//
//  Created by Andrew Z on 2021-10-21.
//

import Foundation

struct Profile {
    var username: String 
    var prefersNotifications = false
    var seasonalPhoto = Season.nativity
    var id: Int

    static let `default` = Profile(username: "John the Baptist", id: 1)

    enum Season: String, CaseIterable, Identifiable {
        case nativity = "Nativity"
        case Lent = "Lent and Holy Week"
        case Holy50 = "Appostle's Fast"
        case StMary = "St. Mary's Fast"
        case Joana = "Joana's Fast"
        case Annual = "No Fast"

        var id: String { self.rawValue }
    }
}
