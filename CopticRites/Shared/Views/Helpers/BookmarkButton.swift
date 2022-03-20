//
//  BookmarkButton.swift
//  CopticRites (iOS)
//
//  Created by Andrew Z on 2021-10-04.
//

import SwiftUI

struct BookmarkButton: View {
    @State var isClicked : Bool
    @Binding var rite: String
    //@State private var booked = UserDefaults.standard.bool(forKey: "toggle")
    var body: some View {
        
        Button(action: {
            
            isClicked.toggle()
            //booked = isClicked
            UserDefaults.standard.set(self.isClicked, forKey: "\(rite)")
        }) {
            Image(systemName: UserDefaults.standard.bool(forKey: "\(rite)") ? "bookmark.fill" : "bookmark")
                .foregroundColor(UserDefaults.standard.bool(forKey: "\(rite)") ? Color.red : Color.gray)
            }
    }
    
}

//struct BookmarkButton_Previewa: PreviewProvider {
//    static var previews: some View {
//        BookmarkButton(isClicked: .constant(true))
//    }
//}

