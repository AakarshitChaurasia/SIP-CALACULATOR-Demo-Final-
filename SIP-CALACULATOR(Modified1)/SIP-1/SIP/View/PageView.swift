
//  PageView.swift
//  SIP
//
//  Created by Aakarshit Chaurasia on 21/10/23.
//

import Foundation

struct Page: Identifiable, Equatable, Hashable {
    let id = UUID()
    var name: String
    var description: String
    var imageUrl: String
    var tag: Int
    
    static var samplePage = Page(name: "SIP Calculator", description: "This is a sample app for the purpose of investment", imageUrl: "SIP-2", tag: 0)
    
    static var samplePages: [Page] = [
        Page(name: "Welcome to SIP Calculator App!", description: "This is a sample app for the purpose of investment calculation!", imageUrl: "SIP-1", tag: 0),
        Page(name: "Smart Way of Growing", description: "The perfect place to grow your investment!", imageUrl: "SIP-2", tag: 1),
        Page(name: "Factors of SIP", description: "Grow the investment to be tension free!", imageUrl: "SIP-3", tag: 2),
    ]
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
