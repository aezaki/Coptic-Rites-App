//
//  RiteList.swift
//  CopticRites (iOS)
//
//  Created by Andrew Z on 2021-10-04.
//

import SwiftUI

struct RiteList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showBookmarksOnly = false
    

    
    var filteredRites: [Rite] {
        modelData.rites.filter { rite in
            (!showBookmarksOnly || UserDefaults.standard.bool(forKey: "\(rite.name)"))
        }
    }
    
    var body: some View {
        NavigationView {
            
            List {
                
                Toggle("My Bookmarks", isOn: $showBookmarksOnly)
                
                
                ForEach(filteredRites) {rite in
                    NavigationLink(destination: RiteDetail(rite: rite)) {
                            RiteRows(rite: rite)
                           // VideoView(videoID: "0TD96VTf0Xs")
                        }
                }
                .navigationTitle("Rites")
                .navigationBarBackButtonHidden(true)
                
            

            }
        }
                    
    }
            
}
    


struct RiteList_Previews: PreviewProvider {
    static var previews: some View {
        RiteList()
        .environmentObject(ModelData())
    }
}
