//
//  CategoryHome.swift
//  CopticRites (iOS)
//
//  Created by Andrew Z on 2021-10-21.
//

import SwiftUI

struct CategoryHome: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showingProfile = false
    var body: some View {
        NavigationView {
            List {
                PageView(pages: modelData.features.map { FeatureCard(rite: $0) })
                    .aspectRatio(3 / 2, contentMode: .fit)
                    .listRowInsets(EdgeInsets())

                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    if (key == "Books") {
                        CategoryRowRectangle(categoryName: key, items: modelData.categories[key]!)
                    }
                    if (key == "Sacraments") {
                        CategoryRowCircle(categoryName: key, items: modelData.categories[key]!)
                    }
                    if (key == "Tunes") {
                        CategoryRow(categoryName: key, items: modelData.categories[key]!)
                    }
        
                }
                .listRowInsets(EdgeInsets())
            }
            .listStyle(InsetListStyle())
            .navigationTitle("Featured")
            .toolbar {
                Button(action: { showingProfile.toggle() }) {
                    Image(systemName: "person.crop.circle")
                        .accessibilityLabel("User Profile")
                }
            }
            .sheet(isPresented: $showingProfile) {
            ProfileHost()
                    .environmentObject(modelData)
            }
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(ModelData())
    }
}
