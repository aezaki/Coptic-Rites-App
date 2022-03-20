//
//  CategoryRowRectangle.swift
//  CopticRites (iOS)
//
//  Created by Andrew Z on 2021-10-21.
//

import SwiftUI

struct CategoryRowRectangle: View {
    var categoryName: String
    var items: [Rite]
    
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 17.5)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(items) { rite in
                        NavigationLink(destination: RiteDetail(rite: rite)) {
                            CategoryItemRectangle(rite: rite)
                        }
                    }
                }
            }
            .frame(height: 185)
        }
    }
}

struct CategoryRowRectangle_Previews: PreviewProvider {
    static var rites = ModelData().rites

    static var previews: some View {
        CategoryRowRectangle(
            categoryName: rites[0].category.rawValue,
            items: Array(rites.prefix(3))
        )
    }
}

