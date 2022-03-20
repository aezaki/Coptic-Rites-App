//
//  RiteDetail.swift
//  CopticRites (iOS)
//
//  Created by Andrew Z on 2021-10-04.
//

import SwiftUI
import WebKit

struct RiteDetail: View {
    @EnvironmentObject var modelData: ModelData
    var rite: Rite
    
    var riteIndex: Int {
        modelData.rites.firstIndex(where: { $0.id == rite.id })!
    }
    
    var body: some View {
        
        TabView {
            ScrollView {
                HStack {
                Text(rite.name)
                        .font(.largeTitle)
                    BookmarkButton(isClicked: UserDefaults.standard.bool(forKey: "\($modelData.rites[riteIndex].name)"), rite: $modelData.rites[riteIndex].name)

                }
                CircleImage(image: rite.image)
                    .padding(.bottom, -130)
                VStack {
                    Text("About")
                        .font(.title)
                        .frame(width: UIScreen.main.bounds.width * 0.96, alignment: .leading)
                    Divider().frame(height: 2.5).background(Color.red)
                        .frame(width: 300)
                        .padding(.top, -10)
                    Text(rite.description)
                        .frame(width: UIScreen.main.bounds.width * 0.93, alignment: .center)
                        .padding(.top, -10)
                    
                }
                .padding(.top, 125.0)
            }
            .frame(height: 600.0)
            //.ignoresSafeArea(edges: .all)
            VStack {
                VideoView(videoID: rite.videoID)
                    .frame(minHeight: 10,  maxHeight: UIScreen.main.bounds.height * 0.3)
                    .cornerRadius(12)
                    .padding(.horizontal, 24)
                    .position(x: UIScreen.main.bounds.width * 0.5,  y: -20)
                    .frame(height: 250, alignment: .center)
                
                Divider().frame(height: 2.5).background(Color.blue)
                    .padding(.top, -135)
                    .frame(width: 300)
                Text("A Short Video Explaining ....")
                    .padding(.top, -127)
            }
        }
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .always))
        .navigationTitle(rite.name)
        .navigationBarTitleDisplayMode(.inline)
        
        
        
    }
}

//struct RiteDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        RiteDetail(rite: ModelData().rites[0])
//    }
//}
