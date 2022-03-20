//
//  CategoryItemRectangle.swift
//  CopticRites (iOS)
//
//  Created by Andrew Z on 2021-10-21.
//

import SwiftUI

import SwiftUI

struct CategoryItemRectangle: View {
    var rite: Rite

    var body: some View {
        VStack(alignment: .leading) {
            rite.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(5)
                .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
            Text(rite.name)
                .foregroundColor(.primary)
                .font(.caption)
        }
        .padding(.leading, 15)
    }
}

struct CategoryItemRectangle_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItemRectangle(rite: ModelData().rites[14])
    }
}
