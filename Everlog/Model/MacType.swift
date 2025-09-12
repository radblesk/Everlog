//
//  MacType.swift
//  Everlog
//
//  Created by Radoslav Bley on 12/09/2025.
//

import Foundation
import SwiftUI

enum MacType: String, CaseIterable {
    case macbookAir = "MacBook Air"
    case macbookPro = "MacBook Pro"
    case iMac
    case macMini = "Mac mini"
    case macStudio = "Mac Studio"
    case macPro = "Mac Pro"

    var macColors: [String: String] {
        switch self {
        case .macbookAir:
            [
                "Silver": "macbookair_silver", "Starlight": "macbookair_starlight", "Sky Blue": "macbookair_skyblue",
                "Midnight": "macbookair_midnight",
            ]
        case .macbookPro:
            [
                "Silver": "macbookpro_silver", "Space Black": "macbookpro_spaceblack",
                "Space Gray": "macbookpro_spacegray",
            ]
        case .iMac:
            [
                "Blue": "imac_blue", "Purple": "imac_purple", "Pink": "imac_pink", "Orange": "imac_orange",
                "Yellow": "imac_yellow", "Green": "imac_green", "Silver": "imac_silver",
            ]
        case .macMini: ["Silver": "macmini_silver"]
        case .macStudio: ["Silver": "macstudio_silver"]
        case .macPro: ["Silver": "macpro_silver"]
        }
    }

    var displaySizes: [String] {
        switch self {
        case .macbookAir: ["13″", "15″"]
        case .macbookPro: ["13″", "14″", "16″"]
        case .iMac: ["21″", "24″", "27″"]
        case .macMini: []
        case .macStudio: []
        case .macPro: []
        }
    }

    var chips: [String: [String]] {
        switch self {
        case .macbookAir:
            [
                // Intel era
                "Intel Core 2 Duo": ["2 GB", "4 GB", "8 GB"],
                "Intel Core i5": ["4 GB", "8 GB", "16 GB"],
                "Intel Core i7": ["4 GB", "8 GB", "16 GB"],
                // Apple silicon
                "Apple M1": ["8 GB", "16 GB"],
                "Apple M2": ["8 GB", "16 GB", "24 GB"],
                "Apple M3": ["8 GB", "16 GB", "24 GB"],
                "Apple M4": ["8 GB", "16 GB", "24 GB", "32 GB"],
            ]

        case .macbookPro:
            [
                // Intel
                "Intel Core Duo": ["1 GB", "2 GB", "4 GB"],
                "Intel Core 2 Duo": ["2 GB", "4 GB", "8 GB"],
                "Intel Core i5": ["4 GB", "8 GB", "16 GB"],
                "Intel Core i7": ["4 GB", "8 GB", "16 GB", "32 GB"],
                "Intel Core i9": ["16 GB", "32 GB", "64 GB"],
                // Apple silicon
                "Apple M1": ["8 GB", "16 GB"],
                "Apple M1 Pro": ["16 GB", "32 GB"],
                "Apple M1 Max": ["32 GB", "64 GB"],
                "Apple M2": ["8 GB", "16 GB", "24 GB"],
                "Apple M2 Pro": ["16 GB", "32 GB", "64 GB"],
                "Apple M2 Max": ["32 GB", "64 GB", "96 GB"],
                "Apple M3": ["8 GB", "16 GB", "24 GB"],
                "Apple M3 Pro": ["16 GB", "32 GB", "36 GB"],
                "Apple M3 Max": ["32 GB", "48 GB", "96 GB"],
                "Apple M4": ["8 GB", "16 GB", "24 GB"],
                "Apple M4 Pro": ["24 GB", "48 GB"],
                "Apple M4 Max": ["32 GB", "48 GB", "64 GB", "128 GB"],
            ]

        case .iMac:
            [
                // Intel
                "Intel Core Duo": ["1 GB", "2 GB", "4 GB"],
                "Intel Core 2 Duo": ["2 GB", "4 GB", "8 GB"],
                "Intel Core i3": ["4 GB", "8 GB"],
                "Intel Core i5": ["4 GB", "8 GB", "16 GB"],
                "Intel Core i7": ["8 GB", "16 GB", "32 GB"],
                "Intel Core i9": ["16 GB", "32 GB", "64 GB"],
                "Intel Xeon (iMac Pro)": ["32 GB", "64 GB", "128 GB"],
                // Apple silicon
                "Apple M1": ["8 GB", "16 GB"],
                "Apple M3": ["8 GB", "16 GB", "24 GB"],
                "Apple M4": ["8 GB", "16 GB", "24 GB", "32 GB"],
            ]

        case .macMini:
            [
                // Intel
                "Intel Core Solo": ["1 GB", "2 GB"],
                "Intel Core Duo": ["1 GB", "2 GB", "4 GB"],
                "Intel Core 2 Duo": ["2 GB", "4 GB", "8 GB"],
                "Intel Core i5": ["4 GB", "8 GB", "16 GB"],
                "Intel Core i7": ["4 GB", "8 GB", "16 GB"],
                // Apple silicon
                "Apple M1": ["8 GB", "16 GB"],
                "Apple M2": ["8 GB", "16 GB", "24 GB"],
                "Apple M2 Pro": ["16 GB", "32 GB"],
                "Apple M3": ["8 GB", "16 GB", "24 GB"],
                "Apple M4": ["8 GB", "16 GB", "24 GB", "32 GB"],
                "Apple M4 Pro": ["16 GB", "32 GB", "36 GB"],
            ]

        case .macStudio:
            [
                "Apple M1 Max": ["32 GB", "64 GB"],
                "Apple M1 Ultra": ["64 GB", "128 GB"],
                "Apple M2 Max": ["32 GB", "64 GB", "96 GB"],
                "Apple M2 Ultra": ["64 GB", "128 GB", "192 GB"],
                "Apple M3 Max": ["32 GB", "64 GB", "96 GB"],
                "Apple M3 Ultra": ["64 GB", "128 GB", "192 GB"],
                "Apple M4 Max": ["32 GB", "64 GB", "96 GB"],
            ]

        case .macPro:
            [
                "Intel Xeon (various E5/W-series)": ["16 GB", "32 GB", "64 GB", "128 GB", "256 GB"],
                "Apple M2 Ultra": ["64 GB", "128 GB", "192 GB"],
                // Future Apple silicon Mac Pro variants can be added here
            ]
        }
    }
}
