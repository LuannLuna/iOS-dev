//
//  Colors.swift
//  Avocados
//
//  Created by Luann Marques Luna on 28/05/20.
//  Copyright © 2020 LUNA SOFTWARE DEVELOPMENT. All rights reserved.
//

import SwiftUI

enum Colors: String {
    case darkGreen = "ColorGreenDark"
    case lightGreen = "ColorGreenLight"
    case mediumGreen = "ColorGreenMedium"
    case adaptiveGreen = "ColorGreenAdaptive"
    case transparentLightBlack = "ColorBlackTransparentLight"
    case transparentDarkBlack = "ColorBlackTransparentDark"
    case adaptive = "ColorAppearanceAdaptive"
    
    var color: Color {
        return Color(rawValue)
    }
}
