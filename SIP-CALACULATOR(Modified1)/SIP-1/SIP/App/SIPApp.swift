//  SIPApp.swift

import Foundation
import SwiftUI

@main
struct SIPApp: App {
    @StateObject var settingViewModel = SettingViewModel()

    var body: some Scene {
        WindowGroup {
            FrontPage()
                .preferredColorScheme(settingViewModel.getTheme())
                .environmentObject(settingViewModel)
        }
    }
}

