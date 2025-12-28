//
//  ProductColor.swift
//  Everlog
//
//  Created by Radoslav Bley on 13/09/2025.
//

import Foundation
import SwiftUI

struct ProductColor {
    static func computeColor(forString: String) -> Color {
        switch forString {
        case "Silver": return Color(red: 217 / 255, green: 217 / 255, blue: 217 / 255)
        case "Starlight": return Color(red: 238 / 255, green: 230 / 255, blue: 216 / 255)
        case "Sky Blue": return Color(red: 212 / 255, green: 225 / 255, blue: 238 / 255)
        case "Midnight": return Color(red: 30 / 255, green: 34 / 255, blue: 45 / 255)
        case "Space Black": return Color(red: 38 / 255, green: 38 / 255, blue: 43 / 255)
        case "Space Gray": return Color(red: 88 / 255, green: 89 / 255, blue: 91 / 255)
        case "Blue": return Color(red: 105 / 255, green: 183 / 255, blue: 240 / 255)
        case "Purple": return Color(red: 194 / 255, green: 117 / 255, blue: 210 / 255)
        case "Pink": return Color(red: 255 / 255, green: 111 / 255, blue: 143 / 255)
        case "Orange": return Color(red: 255 / 255, green: 143 / 255, blue: 63 / 255)
        case "Yellow": return Color(red: 255 / 255, green: 213 / 255, blue: 79 / 255)
        case "Green": return Color(red: 106 / 255, green: 190 / 255, blue: 100 / 255)
        default: return .gray
        }
    }
}
