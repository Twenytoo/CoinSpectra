//
//  Color + ThemeColors.swift
//  CoinSpectra
//
//  Created by Artem Lushchan on 2024-03-04.
//

import Foundation
import SwiftUI

extension Color {
    
    static let theme = ThemeColors()
    
}

struct ThemeColors {

    let accent = Color("AccentColor")
    let background = Color("BackgroundColor")
    let green = Color("GreenThemeColor")
    let red = Color("RedThemeColor")
    let secondaryText = Color("SecondaryTextColor")
    
    fileprivate init() {}
    
}
