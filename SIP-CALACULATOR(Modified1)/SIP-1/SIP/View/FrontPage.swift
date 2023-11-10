
//  FrontPage.swift
//  SIP
//
//  Created by Aakarshit Chaurasia on 21/10/23.
//

import SwiftUI

struct FrontPage: View {
    @State private var pageIndex = 0
    private let pages: [Page] = Page.samplePages
    @State var navigated = false
    private let dotAppearance = UIPageControl.appearance()
    
    var body: some View {
        NavigationView{
        TabView(selection: $pageIndex)  {
            ForEach(pages, id: \.self) { page in
                VStack {
                    Spacer()
                    PageView(page: page)
                    Spacer()
                    if page == pages.last {
                        
                        
                        NavigationLink("Calculator", destination: ContentView(), isActive: $navigated)
                            
                            .buttonStyle(.bordered)
                    } else {
                        Button("next", action: incrementPage)
                            .buttonStyle(.borderedProminent)
                    }
                    Spacer()
                }
                .tag(page.tag)
            }
        }
        .animation(.easeInOut, value: pageIndex)// 2
        .indexViewStyle(.page(backgroundDisplayMode: .interactive))
        .tabViewStyle(PageTabViewStyle())
        .onAppear {
            dotAppearance.currentPageIndicatorTintColor = .black
            dotAppearance.pageIndicatorTintColor = .gray
        }
    }
    
    
    
    /*func goToZero() {
       ContentView()*/
    }
    func incrementPage() {
        pageIndex += 1
    }
}

struct FrontPage_Previews: PreviewProvider {
    static var previews: some View {
        FrontPage()
    }
}
