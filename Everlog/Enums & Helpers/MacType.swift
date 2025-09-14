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

    var purchasedCondition: [String] { ["New", "Used", "Refurbished"] }

    var symbols: String {
        switch self {
        case .macbookAir: "macbook"
        case .macbookPro: "macbook"
        case .iMac: "desktopcomputer"
        case .macMini: "macmini"
        case .macStudio: "macstudio"
        case .macPro: "macpro.gen3"
        }
    }

    var macColors: [String] {
        switch self {
        case .macbookAir:
            [
                "Silver", "Starlight", "Sky Blue",
                "Midnight",
            ]
        case .macbookPro:
            [
                "Silver", "Space Black",
                "Space Gray",
            ]
        case .iMac:
            [
                "Blue", "Purple", "Pink", "Orange",
                "Yellow", "Green", "Silver",
            ]
        case .macMini: ["Silver"]
        case .macStudio: ["Silver"]
        case .macPro: ["Silver"]
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

enum CurrentCondition: String, CaseIterable {
    case perfect, good, fair, poor
}

enum Storage: String, CaseIterable {
    case _256GB = "256 GB"
    case _512GB = "512 GB"
    case _1TB = "1 TB"
    case _2TB = "2 TB"
    case _4TB = "4 TB"
    case _8TB = "8 TB"
}

/// Software
enum Sierra: String, CaseIterable {
    case _10_12 = "10.12"
    case _10_12_1 = "10.12.1"
    case _10_12_2 = "10.12.2"
    case _10_12_3 = "10.12.3"
    case _10_12_4 = "10.12.4"
    case _10_12_5 = "10.12.5"
    case _10_12_6 = "10.12.6"
}

enum HighSierra: String, CaseIterable {
    case _10_13 = "10.13"
    case _10_13_1 = "10.13.1"
    case _10_13_2 = "10.13.2"
    case _10_13_3 = "10.13.3"
    case _10_13_4 = "10.13.4"
    case _10_13_5 = "10.13.5"
    case _10_13_6 = "10.13.6"
}

enum Mojave: String, CaseIterable {
    case _10_14 = "10.14"
    case _10_14_1 = "10.14.1"
    case _10_14_2 = "10.14.2"
    case _10_14_3 = "10.14.3"
    case _10_14_4 = "10.14.4"
    case _10_14_5 = "10.14.5"
    case _10_14_6 = "10.14.6"
}

enum Catalina: String, CaseIterable {
    case _10_15 = "10.15"
    case _10_15_1 = "10.15.1"
    case _10_15_2 = "10.15.2"
    case _10_15_3 = "10.15.3"
    case _10_15_4 = "10.15.4"
    case _10_15_5 = "10.15.5"
    case _10_15_6 = "10.15.6"
    case _10_15_7 = "10.15.7"
}

enum BigSur: String, CaseIterable {
    case _11_0 = "11.0"
    case _11_0_1 = "11.0.1"
    case _11_1 = "11.1"
    case _11_2 = "11.2"
    case _11_2_1 = "11.2.1"
    case _11_3 = "11.3"
    case _11_3_1 = "11.3.1"
    case _11_4 = "11.4"
    case _11_5 = "11.5"
    case _11_5_1 = "11.5.1"
    case _11_5_2 = "11.5.2"
    case _11_6 = "11.6"
    case _11_6_1 = "11.6.1"
    case _11_7 = "11.7"
    case _11_7_10 = "11.7.10"
}

enum Monterey: String, CaseIterable {
    case _12_0 = "12.0"
    case _12_0_1 = "12.0.1"
    case _12_1 = "12.1"
    case _12_2 = "12.2"
    case _12_2_1 = "12.2.1"
    case _12_3 = "12.3"
    case _12_3_1 = "12.3.1"
    case _12_4 = "12.4"
    case _12_5 = "12.5"
    case _12_5_1 = "12.5.1"
    case _12_6 = "12.6"
    case _12_6_1 = "12.6.1"
    case _12_7 = "12.7"
    case _12_7_6 = "12.7.6"
}

enum Ventura: String, CaseIterable {
    case _13_0 = "13.0"
    case _13_0_1 = "13.0.1"
    case _13_1 = "13.1"
    case _13_2 = "13.2"
    case _13_2_1 = "13.2.1"
    case _13_3 = "13.3"
    case _13_3_1 = "13.3.1"
    case _13_4 = "13.4"
    case _13_4_1 = "13.4.1"
    case _13_5 = "13.5"
    case _13_5_1 = "13.5.1"
    case _13_6 = "13.6"
    case _13_7 = "13.7"
    case _13_7_8 = "13.7.8"
}

enum Sonoma: String, CaseIterable {
    case _14_0 = "14.0"
    case _14_1 = "14.1"
    case _14_1_1 = "14.1.1"
    case _14_1_2 = "14.1.2"
    case _14_2 = "14.2"
    case _14_2_1 = "14.2.1"
    case _14_3 = "14.3"
    case _14_3_1 = "14.3.1"
    case _14_4 = "14.4"
    case _14_4_1 = "14.4.1"
    case _14_5 = "14.5"
    case _14_6 = "14.6"
    case _14_7 = "14.7"
    case _14_7_8 = "14.7.8"
}

enum Sequoia: String, CaseIterable {
    case _15_0 = "15.0"
    case _15_1 = "15.1"
    case _15_2 = "15.2"
    case _15_2_1 = "15.2.1"
    case _15_3 = "15.3"
    case _15_4 = "15.4"
    case _15_4_1 = "15.4.1"
    case _15_5 = "15.5"
    case _15_6 = "15.6"
    case _15_6_1 = "15.6.1"
}

enum Tahoe: String, CaseIterable {
    case _26_0 = "26.0"
}
