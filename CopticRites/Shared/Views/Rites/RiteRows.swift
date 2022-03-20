//
//  RiteRows.swift
//  CopticRites (iOS)
//
//  Created by Andrew Z on 2021-10-04.
//

import SwiftUI

struct RiteRows: View {
    var rite: Rite
    
    var body: some View {
        HStack{
            rite.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(rite.name)
            
            Spacer()
            
            if UserDefaults.standard.bool(forKey: "\(rite.name)") {
                Image(systemName: "bookmark.fill")
                   .foregroundColor(.red)
            }
           
            
        }
    }
}

struct RiteRows_Previews: PreviewProvider {
    static var rites = ModelData().rites
    
    static var previews: some View {
        RiteRows(rite: rites[0])
    }
}
