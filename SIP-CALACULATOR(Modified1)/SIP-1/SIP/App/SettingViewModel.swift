//  SettingViewModel.swift

//
//  Created by Aakarshit Chaurasia on 16/10/23.
//

import Foundation
import SwiftUI

class SettingViewModel: ObservableObject {
    @Published var theme: ColorScheme? = nil
    @Published var appThemeColor: Color = Color.appTheme
    func getTheme() -> ColorScheme? {
        let theme = AppUserDefaults.preferredTheme
        var _theme: ColorScheme? = nil
        if theme == 0 {
            _theme = nil
        }else if theme == 1 {
            _theme = ColorScheme.light
        }else {
            _theme = ColorScheme.dark
        }
        return _theme
    }
    func changeAppTheme(theme: Int){
        AppUserDefaults.preferredTheme = theme
        self.theme = getTheme()
    }
    func changeAppColor(color: Color){
        let hex = color.uiColor().toHexString()
        if hex.count == 7 {
            AppUserDefaults.appThemeColor = hex
        }
        appThemeColor = Color.appTheme
    }
}
