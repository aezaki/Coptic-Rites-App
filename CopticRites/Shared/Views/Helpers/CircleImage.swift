//
//  CircleImage.swift
//  CopticRites (iOS)
//
//  Created by Andrew Z on 2021-10-04.
//

import SwiftUI

struct CircleImage: View {
    
    var image: Image
    
    var body: some View {
        image
            .resizable()
            .frame(width: 290, height: 280, alignment: .leading)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 4)
            
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("baptisim"))
    }
}
