//
//  ContentView.swift
//  Shared
//
//  Created by Andrew Z on 2021-10-04.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
    @State private var selection: Tab = .featured
    @AppStorage("isDarkMode") private var isDarkMode = false;
    @State private var draftProfile = Profile.default
    @EnvironmentObject var modelData: ModelData
    
    enum Tab {
            case featured
            case list
            case settings
    }
    var body: some View {
        TabView(selection: $selection) {
            CategoryHome()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .tag(Tab.featured)
            
            RiteList()
            
                .tabItem {
                    Label("Rites", systemImage: "list.bullet")
                }
                .tag(Tab.list)
            
            ProfileEditor(profile: $draftProfile)
                .onAppear {
                    draftProfile = modelData.profile
                }
                .onDisappear {
                    modelData.profile = draftProfile
                }
            
                .tabItem{
                    Label("Settings", systemImage: "gear")
                }
                .tag(Tab.settings)
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
