//
//  CopticRitesApp.swift
//  Shared
//
//  Created by Andrew Z on 2021-10-04.
//

import SwiftUI

@main
struct CopticRitesApp: App {
    @StateObject private var modelData = ModelData()
    @AppStorage("isDarkMode") private var isDarkMode = false;
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
                .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}
