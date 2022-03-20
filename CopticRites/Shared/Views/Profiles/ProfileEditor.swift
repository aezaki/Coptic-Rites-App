//
//  ProfileEditor.swift
//  CopticRites (iOS)
//
//  Created by Andrew Z on 2021-10-21.
//

import SwiftUI
import UserNotifications

struct ProfileEditor: View {
    @Binding var profile: Profile
    @AppStorage("isDarkMode") private var isDarkMode = false;
    
    var body: some View {
        VStack {
            Text("Settings")
                .font(.largeTitle)
                .padding(.top, 15.0)
            ScrollView {
                HStack {
                    Text("Username").bold()
                    Divider()
                    TextField("Username", text: $profile.username)
                
                }
                .padding(.leading, 5.0)
                Divider()
                
                Toggle(isOn: $profile.prefersNotifications) {
                    Text("Enable Notifications").bold()
                        .onChange(of: profile.prefersNotifications) { value in
                            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                                if success {
                                    print("All set!")
                                } else if let error = error {
                                    print(error.localizedDescription)
                                }
                            }
                            let content = UNMutableNotificationContent()
                            content.title = "It's Been A While!"
                            content.subtitle = "Come Read More About the Coptic Rites"
                            content.sound = UNNotificationSound.default

                            // show this notification five seconds from now
                            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 20, repeats: false)

                            // choose a random identifier
                            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

                            // add our notification request
                            UNUserNotificationCenter.current().add(request)
                        }
                }
                .padding(.horizontal, 5.0)
                Divider()
                
                VStack(spacing: 20) {
//                    Text("Fast").bold().padding(.leading, 5.0)
//                        .frame(alignment: .leading)
                                
                    HStack {
                        Text("Fast").bold()
                            
                        Divider()
                        Picker("Season", selection: $profile.seasonalPhoto) {
                            ForEach(Profile.Season.allCases) { season in
                                    Text(season.rawValue).tag(season)
                            }
                        }
                        .padding(.leading, 10.0)
                       // .frame(width: 90, height: 90, alignment: .center)
                    .pickerStyle(DefaultPickerStyle())
                    }
                    .padding(.leading, -182.0)
                    Divider()
                    
                    Text("Theme").bold().padding(.leading, -182.0)
                        .frame(alignment: .leading)
                    
                    Picker("Theme", selection: $isDarkMode) {
                        Text("Light")
                            .tag(false)
                            
                        Text("Dark")
                            .tag(true)
                            
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
            }
        }
    }
}

struct ProfileEditor_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditor(profile: .constant(.default))
    }
}

