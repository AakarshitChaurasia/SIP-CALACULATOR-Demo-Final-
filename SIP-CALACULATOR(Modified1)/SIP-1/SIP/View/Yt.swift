
//  Yt.swift

//
//  Created by Aakarshit Chaurasia on 16/10/23.
//

import SwiftUI
import WebKit

struct Yt: UIViewRepresentable {
    let videoID: String
    func makeUIView(context: Context) -> WKWebView{
        return WKWebView()
    }
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let ytURL =  URL(string: "https://www.youtube.com/embed/\(videoID)") else {return}
        uiView.scrollView.isScrollEnabled = false
        uiView.load(URLRequest(url: ytURL))
    }
}
struct YtView_Previews: PreviewProvider {
    static var previews: some View {
        Yt(videoID: "Wy2aEUmf_OE")
            .frame(minHeight: 0, maxHeight: UIScreen.main.bounds.height * 0.3)
            .cornerRadius(12)
            .padding(.horizontal, 24)
    }
}

