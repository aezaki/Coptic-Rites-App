//
//  VideoView.swift
//  CopticRites (iOS)
//
//  Created by Andrew Z on 2021-10-04.
//

import SwiftUI
import WebKit

struct VideoView: UIViewRepresentable {
    
    let videoID: String
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let youtubeURL = URL(string: "https://www.youtube.com/embed/\(videoID)") else {
            print("fail")
            return}
        uiView.scrollView.isScrollEnabled = true
        uiView.load(URLRequest(url: youtubeURL))
    }
    
}


struct VideoView_Previews: PreviewProvider {
    static var previews: some View {
        VideoView(videoID: "CX-BdDHW0Ho")
    }
}
