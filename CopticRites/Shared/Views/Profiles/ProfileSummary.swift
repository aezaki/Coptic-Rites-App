//
//  ProfileSummary.swift
//  CopticRites (iOS)
//
//  Created by Andrew Z on 2021-10-21.
//

import SwiftUI

struct ProfileSummary: View {
    var profile: Profile
    @EnvironmentObject var modelData: ModelData
    @AppStorage("isDarkMode") private var isDarkMode = false;
    

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text(profile.username)
                    .bold()
                    .font(.title)
                
                Divider()

                Text("Notifications: \(profile.prefersNotifications ? "On": "Off" )")
                Text("Theme: \(isDarkMode ? "Dark" : "Light" ) ")
                
                Divider()
                
                Text("Season: \(profile.seasonalPhoto.rawValue)")
                if(profile.seasonalPhoto.rawValue == Profile.Season.nativity.rawValue) {
                    Image("birth")
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: 165, height: 165)
                        .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                        .position(x: UIScreen.main.bounds.width * 0.48, y: 90)
                }
                

                Divider()

            }
        }
    }
}

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary(profile: Profile.default)
            .environmentObject(ModelData())
    }
}
