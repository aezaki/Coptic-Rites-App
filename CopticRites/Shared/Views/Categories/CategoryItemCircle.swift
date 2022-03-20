//
//  CategoryItemCircle.swift
//  CopticRites (iOS)
//
//  Created by Andrew Z on 2021-10-21.
//

import SwiftUI

struct CategoryItemCircle: View {
    var rite: Rite

    var body: some View {
        VStack(alignment: .leading) {
            rite.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(5)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.black, lineWidth: 2))
            Text(rite.name)
                .foregroundColor(.primary)
                .font(.caption)
        }
        .padding(.leading, 15)
    }
}

struct CategoryItemCircle_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItemCircle(rite: ModelData().rites[14])
    }
}
