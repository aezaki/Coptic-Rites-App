//
//  FeatureCard.swift
//  CopticRites (iOS)
//
//  Created by Andrew Z on 2021-10-21.
//

import SwiftUI

struct FeatureCard: View {
    var rite: Rite

    var body: some View {
        rite.featureImage?
            .resizable()
            .aspectRatio(3 / 2, contentMode: .fit)
            .overlay(TextOverlay(rite: rite))
    }
    
}

struct TextOverlay: View {
    var rite: Rite

    var gradient: LinearGradient {
        LinearGradient(
            gradient: Gradient(
                colors: [Color.black.opacity(0.6), Color.black.opacity(0)]),
            startPoint: .bottom,
            endPoint: .center)
    }

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Rectangle().fill(gradient)
            VStack(alignment: .leading) {
                Text(rite.name)
                    .font(.title)
                    .bold()
            }
            .padding()
        }
        .foregroundColor(.white)
    }
}

struct FeatureCard_Previews: PreviewProvider {
    static var previews: some View {
        FeatureCard(rite: ModelData().features[2])
    }
}

