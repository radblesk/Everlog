//
//  DevicesModel.swift
//  Everlog
//
//  Created by Radoslav Bley on 13/09/2025.
//

import Foundation
import SwiftUI

/// Category like Mac, iPhone, iPad,...
struct Category: Identifiable {
    let id = UUID()
    let name: String
    let symbol: String
    let deviceCategories: [DeviceCategory]
    let operatingSystems: [OperatingSystem]
}

/// Device categories like Apple Watch, Apple Watch SE, Apple Watch Ultra
struct DeviceCategory: Identifiable {
    let id = UUID()
    let name: String
    let devices: [Device]
}

/// Actual device like MacBook Pro, iPhone 17 Pro Max,...
struct Device: Identifiable {
    let id = UUID()
    let name: String
    let displaySizes: [String]?
    let colors: [ColorModel]
    let chipFamilies: [ChipFamily]
    let memoryOptions: [String]?
    let purchaseCondition: [String] = ["New", "Used", "Refurbished"]
    static let currentCondition: [String] = ["Perfect", "Good", "Fair", "Poor"]
    let releaseDate: Date?

    init(
        name: String,
        displaySizes: [String]?,
        colors: [ColorModel],
        chipFamilies: [ChipFamily],
        memoryOptions: [String]?
    ) {
        self.name = name
        self.displaySizes = displaySizes
        self.colors = colors
        self.chipFamilies = chipFamilies
        self.memoryOptions = memoryOptions
        self.releaseDate = nil
    }

    // New initializer for devices with a release date
    init(
        name: String,
        displaySizes: [String]?,
        colors: [ColorModel],
        chipFamilies: [ChipFamily],
        memoryOptions: [String]?,
        releaseDate: Date
    ) {
        self.name = name
        self.displaySizes = displaySizes
        self.colors = colors
        self.chipFamilies = chipFamilies
        self.memoryOptions = memoryOptions
        self.releaseDate = releaseDate
    }
}

/// Chip Family - Intel, Apple Silicon,...
struct ChipFamily: Identifiable {
    let id = UUID()
    let name: String
    let chips: [String]
}

/// Operating systems categories like Sonoma, Sequoia, Tahoe,..
struct OperatingSystem: Identifiable {
    let id = UUID()
    let name: String
    let releases: [String]
}

/// Color model to store name and color
struct ColorModel: Identifiable {
    let id = UUID()
    let name: String
    let color: Color
}

struct DevicesData {
    static let example = StoredDeviceModel(
        category: "Mac",
        model: "MacBook Pro",
        releaseDate: Calendar.current.date(from: DateComponents(year: 2024, month: 11, day: 8))!,
        osVersion: "26.0",
        serialNumber: "FYF897A7F1",
        currentCondition: "Perfect",
        comments: "",
        lastModified: .now,
        color: "Space Black",
        chip: "M4 Pro",
        memory: "24GB",
        storage: "512GB",
        displaySize: "14“",
        purchasedCondition: "New",
        purchasedFrom: "iStores Liptovský Mikuláš",
        purchaseDate: Calendar.current.date(from: DateComponents(year: 2025, month: 7, day: 11))!,
        purchasePrice: 2499,
        tradedIn: true,
        tradedInDevice: "MacBook Air M3",
        tradedInPrice: 749,
        warrantyExtended: false,
        warrantyExtendedPeriod: 2,
        appleCare: false,
        appleCarePeriod: 2,
        sold: false,
        soldDate: .now,
        soldPrice: 0.0,
        soldReason: ""
    )

    let categories: [Category] = [
        // MARK: - Mac
        Category(
            name: "Mac",
            symbol: "desktopcomputer.and.macbook",
            deviceCategories: [
                // MARK: MacBook
                DeviceCategory(
                    name: "MacBook",
                    devices: [
                        Device(
                            name: "MacBook Air",
                            displaySizes: ["11“", "13“", "15“"],
                            colors: [
                                ColorModel(
                                    name: "Midnight",
                                    color: Color(red: 30 / 255, green: 34 / 255, blue: 45 / 255)
                                ),
                                ColorModel(
                                    name: "Silver",
                                    color: Color(red: 217 / 255, green: 217 / 255, blue: 217 / 255)
                                ),
                                ColorModel(
                                    name: "Starlight",
                                    color: Color(red: 238 / 255, green: 230 / 255, blue: 216 / 255)
                                ),
                                ColorModel(
                                    name: "Sky Blue",
                                    color: Color(red: 212 / 255, green: 225 / 255, blue: 238 / 255)
                                ),
                            ],
                            chipFamilies: [
                                ChipFamily(name: "Intel", chips: ["Core 2 Duo", "Core i5", "Core i7", "Core i3"]),
                                ChipFamily(name: "Apple Silicon", chips: ["M1", "M2", "M3", "M4"]),
                            ],
                            memoryOptions: ["8GB", "16GB", "24GB"]
                        ),

                        Device(
                            name: "MacBook Pro",
                            displaySizes: ["13“", "14“", "16“"],
                            colors: [
                                ColorModel(
                                    name: "Silver",
                                    color: Color(red: 217 / 255, green: 217 / 255, blue: 217 / 255)
                                ),
                                ColorModel(
                                    name: "Space Gray",
                                    color: Color(red: 88 / 255, green: 89 / 255, blue: 91 / 255)
                                ),
                                ColorModel(
                                    name: "Space Black",
                                    color: Color(red: 38 / 255, green: 38 / 255, blue: 43 / 255)
                                ),
                            ],
                            chipFamilies: [
                                ChipFamily(
                                    name: "Intel",
                                    chips: ["Core Duo", "Core 2 Duo", "Core i5", "Core i7", "Core i9"]
                                ),
                                ChipFamily(
                                    name: "Apple Silicon",
                                    chips: [
                                        "M1", "M1 Pro", "M1 Max", "M2", "M2 Pro", "M2 Max", "M3", "M3 Pro", "M3 Max",
                                        "M4", "M4 Pro", "M4 Max",
                                    ]
                                ),
                            ],
                            memoryOptions: ["8GB", "16GB", "24GB", "32GB", "36GB", "48GB", "64GB", "128GB"]
                        ),
                    ]
                ),

                // MARK: Desktop
                DeviceCategory(
                    name: "Desktop",
                    devices: [
                        Device(
                            name: "iMac",
                            displaySizes: ["21“", "24“", "27“"],
                            colors: [
                                ColorModel(
                                    name: "Blue",
                                    color: Color(red: 105 / 255, green: 183 / 255, blue: 240 / 255)
                                ),
                                ColorModel(
                                    name: "Purple",
                                    color: Color(red: 194 / 255, green: 117 / 255, blue: 210 / 255)
                                ),
                                ColorModel(
                                    name: "Pink",
                                    color: Color(red: 255 / 255, green: 111 / 255, blue: 143 / 255)
                                ),
                                ColorModel(
                                    name: "Orange",
                                    color: Color(red: 255 / 255, green: 143 / 255, blue: 63 / 255)
                                ),
                                ColorModel(
                                    name: "Yellow",
                                    color: Color(red: 255 / 255, green: 213 / 255, blue: 79 / 255)
                                ),
                                ColorModel(
                                    name: "Green",
                                    color: Color(red: 106 / 255, green: 190 / 255, blue: 100 / 255)
                                ),
                                ColorModel(
                                    name: "Silver",
                                    color: Color(red: 217 / 255, green: 217 / 255, blue: 217 / 255)
                                ),
                            ],
                            chipFamilies: [
                                ChipFamily(
                                    name: "Intel",
                                    chips: ["Core 2 Duo", "Core i3", "Core i5", "Core i7", "Core i9"]
                                ),
                                ChipFamily(name: "Apple Silicon", chips: ["M1", "M2", "M3", "M4"]),
                            ],
                            memoryOptions: ["16GB", "24GB"]
                        ),
                        Device(
                            name: "Mac mini",
                            displaySizes: [],
                            colors: [
                                ColorModel(
                                    name: "Silver",
                                    color: Color(red: 217 / 255, green: 217 / 255, blue: 217 / 255)
                                )
                            ],
                            chipFamilies: [
                                ChipFamily(name: "Intel", chips: ["Core 2 Duo", "Core i3", "Core i5", "Core i7"]),
                                ChipFamily(
                                    name: "Apple Silicon",
                                    chips: ["M1", "M2", "M2 Pro", "M4", "M4 Pro"]
                                ),
                            ],
                            memoryOptions: ["16GB", "24GB", "32GB", "48GB", "64GB"]
                        ),
                        Device(
                            name: "Mac Studio",
                            displaySizes: [],
                            colors: [
                                ColorModel(
                                    name: "Silver",
                                    color: Color(red: 217 / 255, green: 217 / 255, blue: 217 / 255)
                                )
                            ],
                            chipFamilies: [
                                ChipFamily(name: "Apple Silicon", chips: ["M1 Max", "M1 Ultra", "M3 Ultra", "M4 Max"])
                            ],
                            memoryOptions: ["36GB", "48GB", "64GB", "96GB", "128GB", "256GB", "512GB"]
                        ),
                        Device(
                            name: "Mac Pro",
                            displaySizes: [],
                            colors: [
                                ColorModel(
                                    name: "Silver",
                                    color: Color(red: 217 / 255, green: 217 / 255, blue: 217 / 255)
                                )
                            ],
                            chipFamilies: [
                                ChipFamily(name: "Intel", chips: ["Xeon W"])
                            ],
                            memoryOptions: ["32GB", "64GB", "128GB", "192GB", "256GB"]
                        ),

                    ]
                ),
            ],
            operatingSystems: [
                OperatingSystem(name: "Older", releases: ["Older release"]),
                OperatingSystem(
                    name: "Sonoma",
                    releases: [
                        "14.0", "14.0.1", "14.1", "14.1.1", "14.1.2", "14.2", "14.2.1", "14.3", "14.3.1", "14.4",
                        "14.4.1", "14.5", "14.6",
                    ]
                ),
                OperatingSystem(
                    name: "Sequoia",
                    releases: [
                        "15.0", "15.0.1", "15.1", "15.1.1", "15.2", "15.3", "15.3.1", "15.3.2", "15.4", "15.4.1",
                        "15.5", "15.6", "15.6.1",
                    ]
                ),
                OperatingSystem(name: "Tahoe", releases: ["26.0"]),
            ]
        ),

        // MARK: - iPhone
        Category(
            name: "iPhone",
            symbol: "iphone",
            deviceCategories: [
                DeviceCategory(
                    name: "iPhone",
                    devices: [
                        Device(
                            name: "iPhone (1st gen)",
                            displaySizes: ["3.5“"],
                            colors: [
                                ColorModel(
                                    name: "Silver/Black",
                                    color: Color(red: 192 / 255, green: 192 / 255, blue: 192 / 255)
                                )
                            ],
                            chipFamilies: [ChipFamily(name: "Samsung", chips: ["S5L8900"])],
                            memoryOptions: ["128MB"]
                        ),

                        Device(
                            name: "iPhone 3G",
                            displaySizes: ["3.5“"],
                            colors: [
                                ColorModel(name: "Black", color: Color(red: 0 / 255, green: 0 / 255, blue: 0 / 255)),
                                ColorModel(
                                    name: "White",
                                    color: Color(red: 255 / 255, green: 255 / 255, blue: 255 / 255)
                                ),
                            ],
                            chipFamilies: [ChipFamily(name: "Samsung", chips: ["S5L8900"])],
                            memoryOptions: ["128MB"]
                        ),

                        Device(
                            name: "iPhone 3GS",
                            displaySizes: ["3.5“"],
                            colors: [
                                ColorModel(name: "Black", color: Color(red: 0 / 255, green: 0 / 255, blue: 0 / 255)),
                                ColorModel(
                                    name: "White",
                                    color: Color(red: 255 / 255, green: 255 / 255, blue: 255 / 255)
                                ),
                            ],
                            chipFamilies: [ChipFamily(name: "Samsung", chips: ["S5PC100"])],
                            memoryOptions: ["256MB"]
                        ),

                        Device(
                            name: "iPhone 4",
                            displaySizes: ["3.5“"],
                            colors: [
                                ColorModel(name: "Black", color: Color(red: 0 / 255, green: 0 / 255, blue: 0 / 255)),
                                ColorModel(
                                    name: "White",
                                    color: Color(red: 255 / 255, green: 255 / 255, blue: 255 / 255)
                                ),
                            ],
                            chipFamilies: [ChipFamily(name: "Apple", chips: ["A4"])],
                            memoryOptions: ["512MB"]
                        ),

                        Device(
                            name: "iPhone 4S",
                            displaySizes: ["3.5“"],
                            colors: [
                                ColorModel(name: "Black", color: Color(red: 0 / 255, green: 0 / 255, blue: 0 / 255)),
                                ColorModel(
                                    name: "White",
                                    color: Color(red: 255 / 255, green: 255 / 255, blue: 255 / 255)
                                ),
                            ],
                            chipFamilies: [ChipFamily(name: "Apple", chips: ["A5"])],
                            memoryOptions: ["512MB"]
                        ),

                        Device(
                            name: "iPhone 5",
                            displaySizes: ["4.0“"],
                            colors: [
                                ColorModel(
                                    name: "Black & Slate",
                                    color: Color(red: 40 / 255, green: 40 / 255, blue: 40 / 255)
                                ),
                                ColorModel(
                                    name: "White & Silver",
                                    color: Color(red: 230 / 255, green: 230 / 255, blue: 230 / 255)
                                ),
                            ],
                            chipFamilies: [ChipFamily(name: "Apple", chips: ["A6"])],
                            memoryOptions: ["1GB"]
                        ),

                        Device(
                            name: "iPhone 5C",
                            displaySizes: ["4.0“"],
                            colors: [
                                ColorModel(
                                    name: "White",
                                    color: Color(red: 255 / 255, green: 255 / 255, blue: 255 / 255)
                                ),
                                ColorModel(name: "Blue", color: Color(red: 0 / 255, green: 176 / 255, blue: 240 / 255)),
                                ColorModel(
                                    name: "Green",
                                    color: Color(red: 172 / 255, green: 233 / 255, blue: 110 / 255)
                                ),
                                ColorModel(
                                    name: "Yellow",
                                    color: Color(red: 255 / 255, green: 235 / 255, blue: 0 / 255)
                                ),
                                ColorModel(
                                    name: "Pink",
                                    color: Color(red: 255 / 255, green: 192 / 255, blue: 203 / 255)
                                ),
                            ],
                            chipFamilies: [ChipFamily(name: "Apple", chips: ["A6"])],
                            memoryOptions: ["1GB"]
                        ),

                        Device(
                            name: "iPhone 5S",
                            displaySizes: ["4.0“"],
                            colors: [
                                ColorModel(
                                    name: "Space Gray",
                                    color: Color(red: 115 / 255, green: 115 / 255, blue: 115 / 255)
                                ),
                                ColorModel(
                                    name: "Silver",
                                    color: Color(red: 192 / 255, green: 192 / 255, blue: 192 / 255)
                                ),
                                ColorModel(name: "Gold", color: Color(red: 255 / 255, green: 215 / 255, blue: 0 / 255)),
                            ],
                            chipFamilies: [ChipFamily(name: "Apple", chips: ["A7"])],
                            memoryOptions: ["1GB"]
                        ),

                        Device(
                            name: "iPhone 6",
                            displaySizes: ["4.7“"],
                            colors: [
                                ColorModel(
                                    name: "Space Gray",
                                    color: Color(red: 115 / 255, green: 115 / 255, blue: 115 / 255)
                                ),
                                ColorModel(
                                    name: "Silver",
                                    color: Color(red: 192 / 255, green: 192 / 255, blue: 192 / 255)
                                ),
                                ColorModel(name: "Gold", color: Color(red: 255 / 255, green: 215 / 255, blue: 0 / 255)),
                            ],
                            chipFamilies: [ChipFamily(name: "Apple", chips: ["A8"])],
                            memoryOptions: ["1GB"]
                        ),

                        Device(
                            name: "iPhone 6 Plus",
                            displaySizes: ["5.5“"],
                            colors: [
                                ColorModel(
                                    name: "Space Gray",
                                    color: Color(red: 115 / 255, green: 115 / 255, blue: 115 / 255)
                                ),
                                ColorModel(
                                    name: "Silver",
                                    color: Color(red: 192 / 255, green: 192 / 255, blue: 192 / 255)
                                ),
                                ColorModel(name: "Gold", color: Color(red: 255 / 255, green: 215 / 255, blue: 0 / 255)),
                            ],
                            chipFamilies: [ChipFamily(name: "Apple", chips: ["A8"])],
                            memoryOptions: ["1GB"]
                        ),

                        Device(
                            name: "iPhone 6S",
                            displaySizes: ["4.7“"],
                            colors: [
                                ColorModel(
                                    name: "Space Gray",
                                    color: Color(red: 115 / 255, green: 115 / 255, blue: 115 / 255)
                                ),
                                ColorModel(
                                    name: "Silver",
                                    color: Color(red: 192 / 255, green: 192 / 255, blue: 192 / 255)
                                ),
                                ColorModel(name: "Gold", color: Color(red: 255 / 255, green: 215 / 255, blue: 0 / 255)),
                                ColorModel(
                                    name: "Rose Gold",
                                    color: Color(red: 255 / 255, green: 204 / 255, blue: 229 / 255)
                                ),
                            ],
                            chipFamilies: [ChipFamily(name: "Apple", chips: ["A9"])],
                            memoryOptions: ["2GB"]
                        ),

                        Device(
                            name: "iPhone 6S Plus",
                            displaySizes: ["5.5“"],
                            colors: [
                                ColorModel(
                                    name: "Space Gray",
                                    color: Color(red: 115 / 255, green: 115 / 255, blue: 115 / 255)
                                ),
                                ColorModel(
                                    name: "Silver",
                                    color: Color(red: 192 / 255, green: 192 / 255, blue: 192 / 255)
                                ),
                                ColorModel(name: "Gold", color: Color(red: 255 / 255, green: 215 / 255, blue: 0 / 255)),
                                ColorModel(
                                    name: "Rose Gold",
                                    color: Color(red: 255 / 255, green: 204 / 255, blue: 229 / 255)
                                ),
                            ],
                            chipFamilies: [ChipFamily(name: "Apple", chips: ["A9"])],
                            memoryOptions: ["2GB"]
                        ),

                        Device(
                            name: "iPhone SE (1st gen)",
                            displaySizes: ["4.0“"],
                            colors: [
                                ColorModel(
                                    name: "Space Gray",
                                    color: Color(red: 115 / 255, green: 115 / 255, blue: 115 / 255)
                                ),
                                ColorModel(
                                    name: "Silver",
                                    color: Color(red: 192 / 255, green: 192 / 255, blue: 192 / 255)
                                ),
                                ColorModel(name: "Gold", color: Color(red: 255 / 255, green: 215 / 255, blue: 0 / 255)),
                                ColorModel(
                                    name: "Rose Gold",
                                    color: Color(red: 255 / 255, green: 204 / 255, blue: 229 / 255)
                                ),
                            ],
                            chipFamilies: [ChipFamily(name: "Apple", chips: ["A9"])],
                            memoryOptions: ["2GB"]
                        ),

                        Device(
                            name: "iPhone 7",
                            displaySizes: ["4.7“"],
                            colors: [
                                ColorModel(name: "Black", color: Color(red: 0 / 255, green: 0 / 255, blue: 0 / 255)),
                                ColorModel(
                                    name: "Jet Black",
                                    color: Color(red: 10 / 255, green: 10 / 255, blue: 10 / 255)
                                ),
                                ColorModel(
                                    name: "Silver",
                                    color: Color(red: 192 / 255, green: 192 / 255, blue: 192 / 255)
                                ),
                                ColorModel(name: "Gold", color: Color(red: 255 / 255, green: 215 / 255, blue: 0 / 255)),
                                ColorModel(
                                    name: "Rose Gold",
                                    color: Color(red: 255 / 255, green: 204 / 255, blue: 229 / 255)
                                ),
                            ],
                            chipFamilies: [ChipFamily(name: "Apple", chips: ["A10 Fusion"])],
                            memoryOptions: ["2GB"]
                        ),

                        Device(
                            name: "iPhone 7 Plus",
                            displaySizes: ["5.5“"],
                            colors: [
                                ColorModel(name: "Black", color: Color(red: 0 / 255, green: 0 / 255, blue: 0 / 255)),
                                ColorModel(
                                    name: "Jet Black",
                                    color: Color(red: 10 / 255, green: 10 / 255, blue: 10 / 255)
                                ),
                                ColorModel(
                                    name: "Silver",
                                    color: Color(red: 192 / 255, green: 192 / 255, blue: 192 / 255)
                                ),
                                ColorModel(name: "Gold", color: Color(red: 255 / 255, green: 215 / 255, blue: 0 / 255)),
                                ColorModel(
                                    name: "Rose Gold",
                                    color: Color(red: 255 / 255, green: 204 / 255, blue: 229 / 255)
                                ),
                            ],
                            chipFamilies: [ChipFamily(name: "Apple", chips: ["A10 Fusion"])],
                            memoryOptions: ["3GB"]
                        ),

                        Device(
                            name: "iPhone 8",
                            displaySizes: ["4.7“"],
                            colors: [
                                ColorModel(
                                    name: "Space Gray",
                                    color: Color(red: 115 / 255, green: 115 / 255, blue: 115 / 255)
                                ),
                                ColorModel(
                                    name: "Silver",
                                    color: Color(red: 192 / 255, green: 192 / 255, blue: 192 / 255)
                                ),
                                ColorModel(name: "Gold", color: Color(red: 255 / 255, green: 215 / 255, blue: 0 / 255)),
                            ],
                            chipFamilies: [ChipFamily(name: "Apple", chips: ["A11 Bionic"])],
                            memoryOptions: ["2GB"]
                        ),

                        Device(
                            name: "iPhone 8 Plus",
                            displaySizes: ["5.5“"],
                            colors: [
                                ColorModel(
                                    name: "Space Gray",
                                    color: Color(red: 115 / 255, green: 115 / 255, blue: 115 / 255)
                                ),
                                ColorModel(
                                    name: "Silver",
                                    color: Color(red: 192 / 255, green: 192 / 255, blue: 192 / 255)
                                ),
                                ColorModel(name: "Gold", color: Color(red: 255 / 255, green: 215 / 255, blue: 0 / 255)),
                            ],
                            chipFamilies: [ChipFamily(name: "Apple", chips: ["A11 Bionic"])],
                            memoryOptions: ["3GB"]
                        ),

                        Device(
                            name: "iPhone X",
                            displaySizes: ["5.8“"],
                            colors: [
                                ColorModel(
                                    name: "Space Gray",
                                    color: Color(red: 115 / 255, green: 115 / 255, blue: 115 / 255)
                                ),
                                ColorModel(
                                    name: "Silver",
                                    color: Color(red: 192 / 255, green: 192 / 255, blue: 192 / 255)
                                ),
                            ],
                            chipFamilies: [ChipFamily(name: "Apple", chips: ["A11 Bionic"])],
                            memoryOptions: ["3GB"]
                        ),

                        Device(
                            name: "iPhone XR",
                            displaySizes: ["6.1“"],
                            colors: [
                                ColorModel(name: "Black", color: Color(red: 0 / 255, green: 0 / 255, blue: 0 / 255)),
                                ColorModel(
                                    name: "White",
                                    color: Color(red: 255 / 255, green: 255 / 255, blue: 255 / 255)
                                ),
                                ColorModel(name: "Blue", color: Color(red: 0 / 255, green: 0 / 255, blue: 255 / 255)),
                                ColorModel(
                                    name: "Yellow",
                                    color: Color(red: 255 / 255, green: 255 / 255, blue: 0 / 255)
                                ),
                                ColorModel(
                                    name: "Coral",
                                    color: Color(red: 255 / 255, green: 127 / 255, blue: 80 / 255)
                                ),
                                ColorModel(
                                    name: "(Product)Red",
                                    color: Color(red: 255 / 255, green: 0 / 255, blue: 0 / 255)
                                ),
                            ],
                            chipFamilies: [ChipFamily(name: "Apple", chips: ["A12 Bionic"])],
                            memoryOptions: ["3GB"]
                        ),

                        Device(
                            name: "iPhone XS",
                            displaySizes: ["5.8“"],
                            colors: [
                                ColorModel(
                                    name: "Space Gray",
                                    color: Color(red: 115 / 255, green: 115 / 255, blue: 115 / 255)
                                ),
                                ColorModel(
                                    name: "Silver",
                                    color: Color(red: 192 / 255, green: 192 / 255, blue: 192 / 255)
                                ),
                                ColorModel(name: "Gold", color: Color(red: 255 / 255, green: 215 / 255, blue: 0 / 255)),
                            ],
                            chipFamilies: [ChipFamily(name: "Apple", chips: ["A12 Bionic"])],
                            memoryOptions: ["4GB"]
                        ),

                        Device(
                            name: "iPhone XS Max",
                            displaySizes: ["6.5“"],
                            colors: [
                                ColorModel(
                                    name: "Space Gray",
                                    color: Color(red: 115 / 255, green: 115 / 255, blue: 115 / 255)
                                ),
                                ColorModel(
                                    name: "Silver",
                                    color: Color(red: 192 / 255, green: 192 / 255, blue: 192 / 255)
                                ),
                                ColorModel(name: "Gold", color: Color(red: 255 / 255, green: 215 / 255, blue: 0 / 255)),
                            ],
                            chipFamilies: [ChipFamily(name: "Apple", chips: ["A12 Bionic"])],
                            memoryOptions: ["4GB"]
                        ),

                        Device(
                            name: "iPhone 11",
                            displaySizes: ["6.1“"],
                            colors: [
                                ColorModel(
                                    name: "Purple",
                                    color: Color(red: 147 / 255, green: 112 / 255, blue: 219 / 255)
                                ),
                                ColorModel(name: "Green", color: Color(red: 0 / 255, green: 128 / 255, blue: 0 / 255)),
                                ColorModel(
                                    name: "Yellow",
                                    color: Color(red: 255 / 255, green: 255 / 255, blue: 0 / 255)
                                ), ColorModel(name: "Black", color: Color(red: 0 / 255, green: 0 / 255, blue: 0 / 255)),
                                ColorModel(
                                    name: "White",
                                    color: Color(red: 255 / 255, green: 255 / 255, blue: 255 / 255)
                                ),
                                ColorModel(
                                    name: "(Product)Red",
                                    color: Color(red: 255 / 255, green: 0 / 255, blue: 0 / 255)
                                ),
                            ],
                            chipFamilies: [ChipFamily(name: "Apple", chips: ["A13 Bionic"])],
                            memoryOptions: ["4GB"]
                        ),

                        Device(
                            name: "iPhone 11 Pro",
                            displaySizes: ["5.8“"],
                            colors: [
                                ColorModel(
                                    name: "Space Gray",
                                    color: Color(red: 115 / 255, green: 115 / 255, blue: 115 / 255)
                                ),
                                ColorModel(
                                    name: "Silver",
                                    color: Color(red: 192 / 255, green: 192 / 255, blue: 192 / 255)
                                ),
                                ColorModel(name: "Gold", color: Color(red: 255 / 255, green: 215 / 255, blue: 0 / 255)),
                                ColorModel(
                                    name: "Midnight Green",
                                    color: Color(red: 0 / 255, green: 50 / 255, blue: 0 / 255)
                                ),
                            ],
                            chipFamilies: [ChipFamily(name: "Apple", chips: ["A13 Bionic"])],
                            memoryOptions: ["4GB"]
                        ),

                        Device(
                            name: "iPhone 11 Pro Max",
                            displaySizes: ["6.5“"],
                            colors: [
                                ColorModel(
                                    name: "Space Gray",
                                    color: Color(red: 115 / 255, green: 115 / 255, blue: 115 / 255)
                                ),
                                ColorModel(
                                    name: "Silver",
                                    color: Color(red: 192 / 255, green: 192 / 255, blue: 192 / 255)
                                ),
                                ColorModel(name: "Gold", color: Color(red: 255 / 255, green: 215 / 255, blue: 0 / 255)),
                                ColorModel(
                                    name: "Midnight Green",
                                    color: Color(red: 0 / 255, green: 50 / 255, blue: 0 / 255)
                                ),
                            ],
                            chipFamilies: [ChipFamily(name: "Apple", chips: ["A13 Bionic"])],
                            memoryOptions: ["4GB"]
                        ),

                        Device(
                            name: "iPhone SE (2nd gen)",
                            displaySizes: ["4.7“"],
                            colors: [
                                ColorModel(name: "Black", color: Color(red: 0 / 255, green: 0 / 255, blue: 0 / 255)),
                                ColorModel(
                                    name: "White",
                                    color: Color(red: 255 / 255, green: 255 / 255, blue: 255 / 255)
                                ),
                                ColorModel(
                                    name: "(Product)Red",
                                    color: Color(red: 255 / 255, green: 0 / 255, blue: 0 / 255)
                                ),
                            ],
                            chipFamilies: [ChipFamily(name: "Apple", chips: ["A13 Bionic"])],
                            memoryOptions: ["3GB"]
                        ),

                        Device(
                            name: "iPhone 12 mini",
                            displaySizes: ["5.4“"],
                            colors: [
                                ColorModel(name: "Black", color: Color(red: 0 / 255, green: 0 / 255, blue: 0 / 255)),
                                ColorModel(
                                    name: "White",
                                    color: Color(red: 255 / 255, green: 255 / 255, blue: 255 / 255)
                                ),
                                ColorModel(
                                    name: "(Product)Red",
                                    color: Color(red: 255 / 255, green: 0 / 255, blue: 0 / 255)
                                ),
                                ColorModel(name: "Green", color: Color(red: 0 / 255, green: 128 / 255, blue: 0 / 255)),
                                ColorModel(name: "Blue", color: Color(red: 0 / 255, green: 0 / 255, blue: 255 / 255)),
                                ColorModel(
                                    name: "Purple",
                                    color: Color(red: 147 / 255, green: 112 / 255, blue: 219 / 255)
                                ),
                            ],
                            chipFamilies: [ChipFamily(name: "Apple", chips: ["A14 Bionic"])],
                            memoryOptions: ["4GB"]
                        ),

                        Device(
                            name: "iPhone 12",
                            displaySizes: ["6.1“"],
                            colors: [
                                ColorModel(name: "Black", color: Color(red: 0 / 255, green: 0 / 255, blue: 0 / 255)),
                                ColorModel(
                                    name: "White",
                                    color: Color(red: 255 / 255, green: 255 / 255, blue: 255 / 255)
                                ),
                                ColorModel(
                                    name: "(Product)Red",
                                    color: Color(red: 255 / 255, green: 0 / 255, blue: 0 / 255)
                                ),
                                ColorModel(name: "Green", color: Color(red: 0 / 255, green: 128 / 255, blue: 0 / 255)),
                                ColorModel(name: "Blue", color: Color(red: 0 / 255, green: 0 / 255, blue: 255 / 255)),
                                ColorModel(
                                    name: "Purple",
                                    color: Color(red: 147 / 255, green: 112 / 255, blue: 219 / 255)
                                ),
                            ],
                            chipFamilies: [ChipFamily(name: "Apple", chips: ["A14 Bionic"])],
                            memoryOptions: ["4GB"]
                        ),

                        Device(
                            name: "iPhone 12 Pro",
                            displaySizes: ["6.1“"],
                            colors: [
                                ColorModel(
                                    name: "Graphite",
                                    color: Color(red: 50 / 255, green: 50 / 255, blue: 50 / 255)
                                ),
                                ColorModel(
                                    name: "Silver",
                                    color: Color(red: 192 / 255, green: 192 / 255, blue: 192 / 255)
                                ),
                                ColorModel(name: "Gold", color: Color(red: 255 / 255, green: 215 / 255, blue: 0 / 255)),
                                ColorModel(
                                    name: "Pacific Blue",
                                    color: Color(red: 0 / 255, green: 0 / 255, blue: 139 / 255)
                                ),
                            ],
                            chipFamilies: [ChipFamily(name: "Apple", chips: ["A14 Bionic"])],
                            memoryOptions: ["6GB"]
                        ),

                        Device(
                            name: "iPhone 12 Pro Max",
                            displaySizes: ["6.7“"],
                            colors: [
                                ColorModel(
                                    name: "Graphite",
                                    color: Color(red: 50 / 255, green: 50 / 255, blue: 50 / 255)
                                ),
                                ColorModel(
                                    name: "Silver",
                                    color: Color(red: 192 / 255, green: 192 / 255, blue: 192 / 255)
                                ),
                                ColorModel(name: "Gold", color: Color(red: 255 / 255, green: 215 / 255, blue: 0 / 255)),
                                ColorModel(
                                    name: "Pacific Blue",
                                    color: Color(red: 0 / 255, green: 0 / 255, blue: 139 / 255)
                                ),
                            ],
                            chipFamilies: [ChipFamily(name: "Apple", chips: ["A14 Bionic"])],
                            memoryOptions: ["6GB"]
                        ),

                        Device(
                            name: "iPhone 13 mini",
                            displaySizes: ["5.4“"],
                            colors: [
                                ColorModel(
                                    name: "Pink",
                                    color: Color(red: 255 / 255, green: 192 / 255, blue: 203 / 255)
                                ),
                                ColorModel(name: "Blue", color: Color(red: 0 / 255, green: 0 / 255, blue: 255 / 255)),
                                ColorModel(
                                    name: "Midnight",
                                    color: Color(red: 50 / 255, green: 50 / 255, blue: 50 / 255)
                                ),
                                ColorModel(
                                    name: "Starlight",
                                    color: Color(red: 255 / 255, green: 255 / 255, blue: 240 / 255)
                                ),
                                ColorModel(
                                    name: "(Product)Red",
                                    color: Color(red: 255 / 255, green: 0 / 255, blue: 0 / 255)
                                ),
                                ColorModel(name: "Green", color: Color(red: 0 / 255, green: 128 / 255, blue: 0 / 255)),
                            ],
                            chipFamilies: [ChipFamily(name: "Apple", chips: ["A15 Bionic"])],
                            memoryOptions: ["4GB"]
                        ),

                        Device(
                            name: "iPhone 13",
                            displaySizes: ["6.1“"],
                            colors: [
                                ColorModel(
                                    name: "Pink",
                                    color: Color(red: 255 / 255, green: 192 / 255, blue: 203 / 255)
                                ),
                                ColorModel(name: "Blue", color: Color(red: 0 / 255, green: 0 / 255, blue: 255 / 255)),
                                ColorModel(
                                    name: "Midnight",
                                    color: Color(red: 50 / 255, green: 50 / 255, blue: 50 / 255)
                                ),
                                ColorModel(
                                    name: "Starlight",
                                    color: Color(red: 255 / 255, green: 255 / 255, blue: 240 / 255)
                                ),
                                ColorModel(
                                    name: "(Product)Red",
                                    color: Color(red: 255 / 255, green: 0 / 255, blue: 0 / 255)
                                ),
                                ColorModel(name: "Green", color: Color(red: 0 / 255, green: 128 / 255, blue: 0 / 255)),
                            ],
                            chipFamilies: [ChipFamily(name: "Apple", chips: ["A15 Bionic"])],
                            memoryOptions: ["4GB"]
                        ),

                        Device(
                            name: "iPhone 13 Pro",
                            displaySizes: ["6.1“"],
                            colors: [
                                ColorModel(
                                    name: "Graphite",
                                    color: Color(red: 50 / 255, green: 50 / 255, blue: 50 / 255)
                                ),
                                ColorModel(name: "Gold", color: Color(red: 255 / 255, green: 215 / 255, blue: 0 / 255)),
                                ColorModel(
                                    name: "Silver",
                                    color: Color(red: 192 / 255, green: 192 / 255, blue: 192 / 255)
                                ),
                                ColorModel(
                                    name: "Sierra Blue",
                                    color: Color(red: 124 / 255, green: 162 / 255, blue: 190 / 255)
                                ),
                                ColorModel(
                                    name: "Alpine Green",
                                    color: Color(red: 45 / 255, green: 79 / 255, blue: 45 / 255)
                                ),
                            ],
                            chipFamilies: [ChipFamily(name: "Apple", chips: ["A15 Bionic"])],
                            memoryOptions: ["6GB"]
                        ),

                        Device(
                            name: "iPhone 13 Pro Max",
                            displaySizes: ["6.7“"],
                            colors: [
                                ColorModel(
                                    name: "Graphite",
                                    color: Color(red: 50 / 255, green: 50 / 255, blue: 50 / 255)
                                ),
                                ColorModel(name: "Gold", color: Color(red: 255 / 255, green: 215 / 255, blue: 0 / 255)),
                                ColorModel(
                                    name: "Silver",
                                    color: Color(red: 192 / 255, green: 192 / 255, blue: 192 / 255)
                                ),
                                ColorModel(
                                    name: "Sierra Blue",
                                    color: Color(red: 124 / 255, green: 162 / 255, blue: 190 / 255)
                                ),
                                ColorModel(
                                    name: "Alpine Green",
                                    color: Color(red: 45 / 255, green: 79 / 255, blue: 45 / 255)
                                ),
                            ],
                            chipFamilies: [ChipFamily(name: "Apple", chips: ["A15 Bionic"])],
                            memoryOptions: ["6GB"]
                        ),

                        Device(
                            name: "iPhone SE (3rd gen)",
                            displaySizes: ["4.7“"],
                            colors: [
                                ColorModel(
                                    name: "Midnight",
                                    color: Color(red: 50 / 255, green: 50 / 255, blue: 50 / 255)
                                ),
                                ColorModel(
                                    name: "Starlight",
                                    color: Color(red: 255 / 255, green: 255 / 255, blue: 240 / 255)
                                ),
                                ColorModel(
                                    name: "(Product)Red",
                                    color: Color(red: 255 / 255, green: 0 / 255, blue: 0 / 255)
                                ),
                            ],
                            chipFamilies: [ChipFamily(name: "Apple", chips: ["A15 Bionic"])],
                            memoryOptions: ["4GB"]
                        ),

                        Device(
                            name: "iPhone 14",
                            displaySizes: ["6.1“"],
                            colors: [
                                ColorModel(
                                    name: "Midnight",
                                    color: Color(red: 50 / 255, green: 50 / 255, blue: 50 / 255)
                                ),
                                ColorModel(
                                    name: "Starlight",
                                    color: Color(red: 255 / 255, green: 255 / 255, blue: 240 / 255)
                                ),
                                ColorModel(
                                    name: "Purple",
                                    color: Color(red: 147 / 255, green: 112 / 255, blue: 219 / 255)
                                ),
                                ColorModel(name: "Blue", color: Color(red: 0 / 255, green: 0 / 255, blue: 255 / 255)),
                                ColorModel(
                                    name: "(Product)Red",
                                    color: Color(red: 255 / 255, green: 0 / 255, blue: 0 / 255)
                                ),
                            ],
                            chipFamilies: [ChipFamily(name: "Apple", chips: ["A15 Bionic"])],
                            memoryOptions: ["6GB"],
                            releaseDate: Calendar.current.date(from: DateComponents(year: 2022, month: 9, day: 16))!
                        ),

                        Device(
                            name: "iPhone 14 Plus",
                            displaySizes: ["6.7“"],
                            colors: [
                                ColorModel(
                                    name: "Midnight",
                                    color: Color(red: 50 / 255, green: 50 / 255, blue: 50 / 255)
                                ),
                                ColorModel(
                                    name: "Starlight",
                                    color: Color(red: 255 / 255, green: 255 / 255, blue: 240 / 255)
                                ),
                                ColorModel(
                                    name: "Purple",
                                    color: Color(red: 147 / 255, green: 112 / 255, blue: 219 / 255)
                                ),
                                ColorModel(name: "Blue", color: Color(red: 0 / 255, green: 0 / 255, blue: 255 / 255)),
                                ColorModel(
                                    name: "(Product)Red",
                                    color: Color(red: 255 / 255, green: 0 / 255, blue: 0 / 255)
                                ),
                            ],
                            chipFamilies: [ChipFamily(name: "Apple", chips: ["A15 Bionic"])],
                            memoryOptions: ["6GB"],
                            releaseDate: Calendar.current.date(from: DateComponents(year: 2022, month: 9, day: 16))!
                        ),

                        Device(
                            name: "iPhone 14 Pro",
                            displaySizes: ["6.1“"],
                            colors: [
                                ColorModel(
                                    name: "Space Black",
                                    color: Color(red: 29 / 255, green: 29 / 255, blue: 31 / 255)
                                ),
                                ColorModel(
                                    name: "Silver",
                                    color: Color(red: 192 / 255, green: 192 / 255, blue: 192 / 255)
                                ),
                                ColorModel(name: "Gold", color: Color(red: 255 / 255, green: 215 / 255, blue: 0 / 255)),
                                ColorModel(
                                    name: "Deep Purple",
                                    color: Color(red: 72 / 255, green: 61 / 255, blue: 139 / 255)
                                ),
                            ],
                            chipFamilies: [ChipFamily(name: "Apple", chips: ["A16 Bionic"])],
                            memoryOptions: ["6GB"],
                            releaseDate: Calendar.current.date(from: DateComponents(year: 2022, month: 9, day: 16))!
                        ),

                        Device(
                            name: "iPhone 14 Pro Max",
                            displaySizes: ["6.7“"],
                            colors: [
                                ColorModel(
                                    name: "Space Black",
                                    color: Color(red: 29 / 255, green: 29 / 255, blue: 31 / 255)
                                ),
                                ColorModel(
                                    name: "Silver",
                                    color: Color(red: 192 / 255, green: 192 / 255, blue: 192 / 255)
                                ),
                                ColorModel(name: "Gold", color: Color(red: 255 / 255, green: 215 / 255, blue: 0 / 255)),
                                ColorModel(
                                    name: "Deep Purple",
                                    color: Color(red: 72 / 255, green: 61 / 255, blue: 139 / 255)
                                ),
                            ],
                            chipFamilies: [ChipFamily(name: "Apple", chips: ["A16 Bionic"])],
                            memoryOptions: ["6GB"],
                            releaseDate: Calendar.current.date(from: DateComponents(year: 2022, month: 9, day: 16))!
                        ),

                        Device(
                            name: "iPhone 15",
                            displaySizes: ["6.1“"],
                            colors: [
                                ColorModel(name: "Black", color: Color(red: 0 / 255, green: 0 / 255, blue: 0 / 255)),
                                ColorModel(name: "Blue", color: Color(red: 0 / 255, green: 0 / 255, blue: 255 / 255)),
                                ColorModel(name: "Green", color: Color(red: 0 / 255, green: 128 / 255, blue: 0 / 255)),
                                ColorModel(
                                    name: "Yellow",
                                    color: Color(red: 255 / 255, green: 255 / 255, blue: 0 / 255)
                                ),
                                ColorModel(
                                    name: "Pink",
                                    color: Color(red: 255 / 255, green: 192 / 255, blue: 203 / 255)
                                ),
                            ],
                            chipFamilies: [ChipFamily(name: "Apple", chips: ["A16 Bionic"])],
                            memoryOptions: ["6GB"],
                            releaseDate: Calendar.current.date(from: DateComponents(year: 2023, month: 9, day: 22))!
                        ),

                        Device(
                            name: "iPhone 15 Plus",
                            displaySizes: ["6.7“"],
                            colors: [
                                ColorModel(name: "Black", color: Color(red: 0 / 255, green: 0 / 255, blue: 0 / 255)),
                                ColorModel(name: "Blue", color: Color(red: 0 / 255, green: 0 / 255, blue: 255 / 255)),
                                ColorModel(name: "Green", color: Color(red: 0 / 255, green: 128 / 255, blue: 0 / 255)),
                                ColorModel(
                                    name: "Yellow",
                                    color: Color(red: 255 / 255, green: 255 / 255, blue: 0 / 255)
                                ),
                                ColorModel(
                                    name: "Pink",
                                    color: Color(red: 255 / 255, green: 192 / 255, blue: 203 / 255)
                                ),
                            ],
                            chipFamilies: [ChipFamily(name: "Apple", chips: ["A16 Bionic"])],
                            memoryOptions: ["6GB"],
                            releaseDate: Calendar.current.date(from: DateComponents(year: 2023, month: 9, day: 22))!
                        ),

                        Device(
                            name: "iPhone 15 Pro",
                            displaySizes: ["6.1“"],
                            colors: [
                                ColorModel(
                                    name: "Black Titanium",
                                    color: Color(red: 50 / 255, green: 50 / 255, blue: 50 / 255)
                                ),
                                ColorModel(
                                    name: "White Titanium",
                                    color: Color(red: 245 / 255, green: 245 / 255, blue: 245 / 255)
                                ),
                                ColorModel(
                                    name: "Natural Titanium",
                                    color: Color(red: 175 / 255, green: 175 / 255, blue: 175 / 255)
                                ),
                                ColorModel(
                                    name: "Blue Titanium",
                                    color: Color(red: 65 / 255, green: 105 / 255, blue: 225 / 255)
                                ),
                            ],
                            chipFamilies: [ChipFamily(name: "Apple", chips: ["A17 Pro"])],
                            memoryOptions: ["8GB"],
                            releaseDate: Calendar.current.date(from: DateComponents(year: 2023, month: 9, day: 22))!
                        ),

                        Device(
                            name: "iPhone 15 Pro Max",
                            displaySizes: ["6.7“"],
                            colors: [
                                ColorModel(
                                    name: "Black Titanium",
                                    color: Color(red: 50 / 255, green: 50 / 255, blue: 50 / 255)
                                ),
                                ColorModel(
                                    name: "White Titanium",
                                    color: Color(red: 245 / 255, green: 245 / 255, blue: 245 / 255)
                                ),
                                ColorModel(
                                    name: "Natural Titanium",
                                    color: Color(red: 175 / 255, green: 175 / 255, blue: 175 / 255)
                                ),
                                ColorModel(
                                    name: "Blue Titanium",
                                    color: Color(red: 65 / 255, green: 105 / 255, blue: 225 / 255)
                                ),
                            ],
                            chipFamilies: [ChipFamily(name: "Apple", chips: ["A17 Pro"])],
                            memoryOptions: ["8GB"],
                            releaseDate: Calendar.current.date(from: DateComponents(year: 2023, month: 9, day: 22))!
                        ),

                        Device(
                            name: "iPhone 16",
                            displaySizes: ["6.1“"],
                            colors: [
                                ColorModel(
                                    name: "Midnight",
                                    color: Color(red: 50 / 255, green: 50 / 255, blue: 50 / 255)
                                ),
                                ColorModel(
                                    name: "Starlight",
                                    color: Color(red: 255 / 255, green: 255 / 255, blue: 240 / 255)
                                ),
                                ColorModel(
                                    name: "Yellow",
                                    color: Color(red: 255 / 255, green: 255 / 255, blue: 0 / 255)
                                ),
                                ColorModel(name: "Green", color: Color(red: 0 / 255, green: 128 / 255, blue: 0 / 255)),
                                ColorModel(
                                    name: "Pink",
                                    color: Color(red: 255 / 255, green: 192 / 255, blue: 203 / 255)
                                ),
                                ColorModel(
                                    name: "(Product)Red",
                                    color: Color(red: 255 / 255, green: 0 / 255, blue: 0 / 255)
                                ),
                            ],
                            chipFamilies: [ChipFamily(name: "Apple", chips: ["A18"])],
                            memoryOptions: ["8GB"],
                            releaseDate: Calendar.current.date(from: DateComponents(year: 2024, month: 9, day: 20))!
                        ),

                        Device(
                            name: "iPhone 16 Plus",
                            displaySizes: ["6.7“"],
                            colors: [
                                ColorModel(
                                    name: "Midnight",
                                    color: Color(red: 50 / 255, green: 50 / 255, blue: 50 / 255)
                                ),
                                ColorModel(
                                    name: "Starlight",
                                    color: Color(red: 255 / 255, green: 255 / 255, blue: 240 / 255)
                                ),
                                ColorModel(
                                    name: "Yellow",
                                    color: Color(red: 255 / 255, green: 255 / 255, blue: 0 / 255)
                                ),
                                ColorModel(name: "Green", color: Color(red: 0 / 255, green: 128 / 255, blue: 0 / 255)),
                                ColorModel(
                                    name: "Pink",
                                    color: Color(red: 255 / 255, green: 192 / 255, blue: 203 / 255)
                                ),
                                ColorModel(
                                    name: "(Product)Red",
                                    color: Color(red: 255 / 255, green: 0 / 255, blue: 0 / 255)
                                ),
                            ],
                            chipFamilies: [ChipFamily(name: "Apple", chips: ["A18"])],
                            memoryOptions: ["8GB"],
                            releaseDate: Calendar.current.date(from: DateComponents(year: 2024, month: 9, day: 20))!
                        ),

                        Device(
                            name: "iPhone 16 Pro",
                            displaySizes: ["6.3“"],
                            colors: [
                                ColorModel(
                                    name: "Black Titanium",
                                    color: Color(red: 50 / 255, green: 50 / 255, blue: 50 / 255)
                                ),
                                ColorModel(
                                    name: "White Titanium",
                                    color: Color(red: 245 / 255, green: 245 / 255, blue: 245 / 255)
                                ),
                                ColorModel(
                                    name: "Natural Titanium",
                                    color: Color(red: 175 / 255, green: 175 / 255, blue: 175 / 255)
                                ),
                                ColorModel(
                                    name: "Desert Titanium",
                                    color: Color(red: 204 / 255, green: 175 / 255, blue: 137 / 255)
                                ),
                            ],
                            chipFamilies: [ChipFamily(name: "Apple", chips: ["A18 Pro"])],
                            memoryOptions: ["8GB"],
                            releaseDate: Calendar.current.date(from: DateComponents(year: 2024, month: 9, day: 20))!
                        ),

                        Device(
                            name: "iPhone 16 Pro Max",
                            displaySizes: ["6.9“"],
                            colors: [
                                ColorModel(
                                    name: "Black Titanium",
                                    color: Color(red: 50 / 255, green: 50 / 255, blue: 50 / 255)
                                ),
                                ColorModel(
                                    name: "White Titanium",
                                    color: Color(red: 245 / 255, green: 245 / 255, blue: 245 / 255)
                                ),
                                ColorModel(
                                    name: "Natural Titanium",
                                    color: Color(red: 175 / 255, green: 175 / 255, blue: 175 / 255)
                                ),
                                ColorModel(
                                    name: "Desert Titanium",
                                    color: Color(red: 204 / 255, green: 175 / 255, blue: 137 / 255)
                                ),
                            ],
                            chipFamilies: [ChipFamily(name: "Apple", chips: ["A18 Pro"])],
                            memoryOptions: ["8GB"],
                            releaseDate: Calendar.current.date(from: DateComponents(year: 2024, month: 9, day: 20))!
                        ),

                        Device(
                            name: "iPhone 17",
                            displaySizes: ["6.3“"],
                            colors: [
                                ColorModel(name: "Black", color: Color(red: 0 / 255, green: 0 / 255, blue: 0 / 255)),
                                ColorModel(
                                    name: "White",
                                    color: Color(red: 255 / 255, green: 255 / 255, blue: 255 / 255)
                                ),
                                ColorModel(
                                    name: "Mist Blue",
                                    color: Color(red: 173 / 255, green: 216 / 255, blue: 230 / 255)
                                ),
                                ColorModel(
                                    name: "Sage",
                                    color: Color(red: 192 / 255, green: 204 / 255, blue: 184 / 255)
                                ),
                                ColorModel(
                                    name: "Lavender",
                                    color: Color(red: 230 / 255, green: 230 / 255, blue: 250 / 255)
                                ),
                            ],
                            chipFamilies: [ChipFamily(name: "Apple", chips: ["A19"])],
                            memoryOptions: ["8GB"],
                            releaseDate: Calendar.current.date(from: DateComponents(year: 2025, month: 9, day: 9))!
                        ),

                        Device(
                            name: "iPhone Air",
                            displaySizes: ["6.5“"],
                            colors: [
                                ColorModel(
                                    name: "Space Black",
                                    color: Color(red: 29 / 255, green: 29 / 255, blue: 31 / 255)
                                ),
                                ColorModel(
                                    name: "Cloud White",
                                    color: Color(red: 240 / 255, green: 240 / 255, blue: 240 / 255)
                                ),
                                ColorModel(
                                    name: "Light Gold",
                                    color: Color(red: 235 / 255, green: 205 / 255, blue: 135 / 255)
                                ),
                                ColorModel(
                                    name: "Sky Blue",
                                    color: Color(red: 153 / 255, green: 204 / 255, blue: 255 / 255)
                                ),
                            ],
                            chipFamilies: [ChipFamily(name: "Apple", chips: ["A19 Pro"])],
                            memoryOptions: ["12GB"],
                            releaseDate: Calendar.current.date(from: DateComponents(year: 2025, month: 9, day: 9))!
                        ),

                        Device(
                            name: "iPhone 17 Pro",
                            displaySizes: ["6.3“"],
                            colors: [
                                ColorModel(
                                    name: "Silver",
                                    color: Color(red: 192 / 255, green: 192 / 255, blue: 192 / 255)
                                ),
                                ColorModel(
                                    name: "Cosmic Orange",
                                    color: Color(red: 255 / 255, green: 127 / 255, blue: 80 / 255)
                                ),
                                ColorModel(
                                    name: "Deep Blue",
                                    color: Color(red: 0 / 255, green: 0 / 255, blue: 139 / 255)
                                ),
                            ],
                            chipFamilies: [ChipFamily(name: "Apple", chips: ["A19 Pro"])],
                            memoryOptions: ["12GB"],
                            releaseDate: Calendar.current.date(from: DateComponents(year: 2025, month: 9, day: 9))!
                        ),

                        Device(
                            name: "iPhone 17 Pro Max",
                            displaySizes: ["6.9“"],
                            colors: [
                                ColorModel(
                                    name: "Silver",
                                    color: Color(red: 192 / 255, green: 192 / 255, blue: 192 / 255)
                                ),
                                ColorModel(
                                    name: "Cosmic Orange",
                                    color: Color(red: 255 / 255, green: 127 / 255, blue: 80 / 255)
                                ),
                                ColorModel(
                                    name: "Deep Blue",
                                    color: Color(red: 0 / 255, green: 0 / 255, blue: 139 / 255)
                                ),
                            ],
                            chipFamilies: [ChipFamily(name: "Apple", chips: ["A19 Pro"])],
                            memoryOptions: ["12GB"],
                            releaseDate: Calendar.current.date(from: DateComponents(year: 2025, month: 9, day: 9))!
                        ),
                    ]
                )
            ],
            operatingSystems: [
                OperatingSystem(
                    name: "iOS 1",
                    releases: ["1.0", "1.1", "1.1.1", "1.1.2", "1.1.3", "1.1.4", "1.1.5"]
                ),
                OperatingSystem(name: "iOS 2", releases: ["2.0", "2.0.1", "2.0.2", "2.1", "2.2", "2.2.1"]),
                OperatingSystem(
                    name: "iOS 3",
                    releases: ["3.0", "3.0.1", "3.1", "3.1.2", "3.1.3", "3.2", "3.2.1", "3.2.2"]
                ),
                OperatingSystem(
                    name: "iOS 4",
                    releases: [
                        "4.0", "4.0.1", "4.0.2", "4.1", "4.2", "4.2.1", "4.2.5", "4.2.6", "4.2.7", "4.2.8", "4.2.9",
                        "4.2.10", "4.3", "4.3.1", "4.3.2", "4.3.3", "4.3.4", "4.3.5",
                    ]
                ),
                OperatingSystem(name: "iOS 5", releases: ["5.0", "5.0.1", "5.1", "5.1.1"]),
                OperatingSystem(
                    name: "iOS 6",
                    releases: ["6.0", "6.0.1", "6.0.2", "6.1", "6.1.1", "6.1.2", "6.1.3", "6.1.4", "6.1.5", "6.1.6"]
                ),
                OperatingSystem(
                    name: "iOS 7",
                    releases: ["7.0", "7.0.1", "7.0.2", "7.0.3", "7.0.4", "7.0.5", "7.0.6", "7.1", "7.1.1", "7.1.2"]
                ),
                OperatingSystem(
                    name: "iOS 8",
                    releases: ["8.0", "8.0.1", "8.0.2", "8.1", "8.1.1", "8.1.2", "8.1.3", "8.2", "8.3", "8.4", "8.4.1"]
                ),
                OperatingSystem(
                    name: "iOS 9",
                    releases: [
                        "9.0", "9.0.1", "9.0.2", "9.1", "9.2", "9.2.1", "9.3", "9.3.1", "9.3.2", "9.3.3", "9.3.4",
                        "9.3.5", "9.3.6",
                    ]
                ),
                OperatingSystem(
                    name: "iOS 10",
                    releases: [
                        "10.0", "10.0.1", "10.0.2", "10.0.3", "10.1", "10.1.1", "10.2", "10.2.1", "10.3", "10.3.1",
                        "10.3.2", "10.3.3", "10.3.4",
                    ]
                ),
                OperatingSystem(
                    name: "iOS 11",
                    releases: [
                        "11.0", "11.0.1", "11.0.2", "11.0.3", "11.1", "11.1.1", "11.1.2", "11.2", "11.2.1",
                        "11.2.2", "11.2.5", "11.2.6", "11.3", "11.3.1", "11.4", "11.4.1",
                    ]
                ),
                OperatingSystem(
                    name: "iOS 12",
                    releases: [
                        "12.0", "12.0.1", "12.1", "12.1.1", "12.1.2", "12.1.3", "12.1.4", "12.2", "12.3", "12.3.1",
                        "12.3.2", "12.4", "12.4.1", "12.4.2", "12.4.3", "12.4.4", "12.4.5", "12.4.6", "12.4.7",
                        "12.4.8", "12.5", "12.5.1", "12.5.2", "12.5.3", "12.5.4", "12.5.5", "12.5.6", "12.5.7",
                    ]
                ),
                OperatingSystem(
                    name: "iOS 13",
                    releases: [
                        "13.0", "13.1", "13.1.1", "13.1.2", "13.1.3", "13.2", "13.2.1", "13.2.2", "13.2.3", "13.3",
                        "13.3.1", "13.4", "13.4.1", "13.5", "13.5.1", "13.6", "13.6.1", "13.7",
                    ]
                ),
                OperatingSystem(
                    name: "iOS 14",
                    releases: [
                        "14.0", "14.0.1", "14.1", "14.2", "14.2.1", "14.3", "14.4", "14.4.1", "14.4.2", "14.5",
                        "14.5.1", "14.6", "14.7", "14.7.1", "14.8", "14.8.1",
                    ]
                ),
                OperatingSystem(
                    name: "iOS 15",
                    releases: [
                        "15.0", "15.0.1", "15.0.2", "15.1", "15.1.1", "15.2", "15.2.1", "15.3", "15.3.1", "15.4",
                        "15.4.1", "15.5", "15.6", "15.6.1", "15.7", "15.7.1", "15.7.2", "15.7.3", "15.7.4",
                        "15.7.5", "15.7.6", "15.7.7", "15.7.8", "15.8", "15.8.1", "15.8.2", "15.8.3", "15.8.4",
                    ]
                ),
                OperatingSystem(
                    name: "iOS 16",
                    releases: [
                        "16.0", "16.0.1", "16.0.2", "16.0.3", "16.1", "16.1.1", "16.1.2", "16.2", "16.3", "16.3.1",
                        "16.4", "16.4.1", "16.5", "16.5.1", "16.6", "16.6.1", "16.7", "16.7.1", "16.7.2", "16.7.3",
                        "16.7.4", "16.7.5", "16.7.6", "16.7.7", "16.7.8", "16.7.9", "16.7.10", "16.7.11",
                    ]
                ),
                OperatingSystem(
                    name: "iOS 17",
                    releases: [
                        "17.0", "17.0.1", "17.0.2", "17.0.3", "17.1", "17.1.1", "17.1.2", "17.2", "17.2.1", "17.3",
                        "17.3.1", "17.4", "17.4.1", "17.5", "17.5.1", "17.6", "17.6.1", "17.7", "17.7.1", "17.7.2",
                        "17.7.3", "17.7.4", "17.7.5", "17.7.6", "17.7.7", "17.7.8", "17.7.9", "17.7.10",
                    ]
                ),
                OperatingSystem(
                    name: "iOS 18",
                    releases: [
                        "18.0", "18.0.1", "18.1", "18.2", "18.3", "18.4", "18.4.1", "18.5", "18.6", "18.6.1",
                        "18.6.2",
                    ]
                ),
                OperatingSystem(name: "iOS 26", releases: ["26.0"]),

            ]
        ),

        // MARK: - iPad
        Category(
            name: "iPad",
            symbol: "ipad",
            deviceCategories: [
                // MARK: iPad
                DeviceCategory(
                    name: "iPad",
                    devices: [
                        Device(
                            name: "iPad (1st generation)",
                            displaySizes: ["9.7“"],
                            colors: [
                                ColorModel(
                                    name: "Silver",
                                    color: Color(red: 192 / 255, green: 192 / 255, blue: 192 / 255)
                                )
                            ],
                            chipFamilies: [
                                ChipFamily(name: "Apple", chips: ["A4"])
                            ],
                            memoryOptions: ["256MB"]
                        ),

                        Device(
                            name: "iPad 2",
                            displaySizes: ["9.7“"],
                            colors: [
                                ColorModel(name: "Black", color: Color(red: 0 / 255, green: 0 / 255, blue: 0 / 255)),
                                ColorModel(
                                    name: "White",
                                    color: Color(red: 255 / 255, green: 255 / 255, blue: 255 / 255)
                                ),
                            ],
                            chipFamilies: [
                                ChipFamily(name: "Apple", chips: ["A5"])
                            ],
                            memoryOptions: ["512MB"]
                        ),

                        Device(
                            name: "iPad (3rd generation)",
                            displaySizes: ["9.7“"],
                            colors: [
                                ColorModel(name: "Black", color: Color(red: 0 / 255, green: 0 / 255, blue: 0 / 255)),
                                ColorModel(
                                    name: "White",
                                    color: Color(red: 255 / 255, green: 255 / 255, blue: 255 / 255)
                                ),
                            ],
                            chipFamilies: [
                                ChipFamily(name: "Apple", chips: ["A5X"])
                            ],
                            memoryOptions: ["1GB"]
                        ),

                        Device(
                            name: "iPad (4th generation)",
                            displaySizes: ["9.7“"],
                            colors: [
                                ColorModel(name: "Black", color: Color(red: 0 / 255, green: 0 / 255, blue: 0 / 255)),
                                ColorModel(
                                    name: "White",
                                    color: Color(red: 255 / 255, green: 255 / 255, blue: 255 / 255)
                                ),
                            ],
                            chipFamilies: [
                                ChipFamily(name: "Apple", chips: ["A6X"])
                            ],
                            memoryOptions: ["1GB"]
                        ),

                        Device(
                            name: "iPad (5th generation)",
                            displaySizes: ["9.7“"],
                            colors: [
                                ColorModel(
                                    name: "Space Gray",
                                    color: Color(red: 80 / 255, green: 80 / 255, blue: 83 / 255)
                                ),
                                ColorModel(
                                    name: "Silver",
                                    color: Color(red: 192 / 255, green: 192 / 255, blue: 192 / 255)
                                ),
                                ColorModel(name: "Gold", color: Color(red: 255 / 255, green: 215 / 255, blue: 0 / 255)),
                            ],
                            chipFamilies: [
                                ChipFamily(name: "Apple", chips: ["A9"])
                            ],
                            memoryOptions: ["2GB"]
                        ),

                        Device(
                            name: "iPad (6th generation)",
                            displaySizes: ["9.7“"],
                            colors: [
                                ColorModel(
                                    name: "Space Gray",
                                    color: Color(red: 80 / 255, green: 80 / 255, blue: 83 / 255)
                                ),
                                ColorModel(
                                    name: "Silver",
                                    color: Color(red: 192 / 255, green: 192 / 255, blue: 192 / 255)
                                ),
                                ColorModel(name: "Gold", color: Color(red: 255 / 255, green: 215 / 255, blue: 0 / 255)),
                            ],
                            chipFamilies: [
                                ChipFamily(name: "Apple", chips: ["A10 Fusion"])
                            ],
                            memoryOptions: ["2GB"]
                        ),

                        Device(
                            name: "iPad (7th generation)",
                            displaySizes: ["10.2“"],
                            colors: [
                                ColorModel(
                                    name: "Space Gray",
                                    color: Color(red: 80 / 255, green: 80 / 255, blue: 83 / 255)
                                ),
                                ColorModel(
                                    name: "Silver",
                                    color: Color(red: 192 / 255, green: 192 / 255, blue: 192 / 255)
                                ),
                                ColorModel(name: "Gold", color: Color(red: 255 / 255, green: 215 / 255, blue: 0 / 255)),
                            ],
                            chipFamilies: [
                                ChipFamily(name: "Apple", chips: ["A10 Fusion"])
                            ],
                            memoryOptions: ["3GB"]
                        ),

                        Device(
                            name: "iPad (8th generation)",
                            displaySizes: ["10.2“"],
                            colors: [
                                ColorModel(
                                    name: "Space Gray",
                                    color: Color(red: 80 / 255, green: 80 / 255, blue: 83 / 255)
                                ),
                                ColorModel(
                                    name: "Silver",
                                    color: Color(red: 192 / 255, green: 192 / 255, blue: 192 / 255)
                                ),
                                ColorModel(name: "Gold", color: Color(red: 255 / 255, green: 215 / 255, blue: 0 / 255)),
                            ],
                            chipFamilies: [
                                ChipFamily(name: "Apple", chips: ["A12 Bionic"])
                            ],
                            memoryOptions: ["3GB"]
                        ),

                        Device(
                            name: "iPad (9th generation)",
                            displaySizes: ["10.2“"],
                            colors: [
                                ColorModel(
                                    name: "Space Gray",
                                    color: Color(red: 80 / 255, green: 80 / 255, blue: 83 / 255)
                                ),
                                ColorModel(
                                    name: "Silver",
                                    color: Color(red: 192 / 255, green: 192 / 255, blue: 192 / 255)
                                ),
                            ],
                            chipFamilies: [
                                ChipFamily(name: "Apple", chips: ["A13 Bionic"])
                            ],
                            memoryOptions: ["3GB"]
                        ),

                        Device(
                            name: "iPad (10th generation)",
                            displaySizes: ["10.9“"],
                            colors: [
                                ColorModel(
                                    name: "Silver",
                                    color: Color(red: 192 / 255, green: 192 / 255, blue: 192 / 255)
                                ),
                                ColorModel(name: "Blue", color: Color(red: 0 / 255, green: 0 / 255, blue: 255 / 255)),
                                ColorModel(
                                    name: "Pink",
                                    color: Color(red: 255 / 255, green: 192 / 255, blue: 203 / 255)
                                ),
                                ColorModel(
                                    name: "Yellow",
                                    color: Color(red: 255 / 255, green: 255 / 255, blue: 0 / 255)
                                ),
                            ],
                            chipFamilies: [
                                ChipFamily(name: "Apple", chips: ["A14 Bionic"])
                            ],
                            memoryOptions: ["4GB"]
                        ),
                    ]
                ),

                // MARK: iPad Air
                DeviceCategory(
                    name: "iPad Air",
                    devices: [
                        Device(
                            name: "iPad Air (1st generation)",
                            displaySizes: ["9.7“"],
                            colors: [
                                ColorModel(
                                    name: "Space Gray",
                                    color: Color(red: 80 / 255, green: 80 / 255, blue: 83 / 255)
                                ),
                                ColorModel(
                                    name: "Silver",
                                    color: Color(red: 192 / 255, green: 192 / 255, blue: 192 / 255)
                                ),
                            ],
                            chipFamilies: [
                                ChipFamily(name: "Apple", chips: ["A7"])
                            ],
                            memoryOptions: ["1GB"]
                        ),

                        Device(
                            name: "iPad Air 2",
                            displaySizes: ["9.7“"],
                            colors: [
                                ColorModel(
                                    name: "Space Gray",
                                    color: Color(red: 80 / 255, green: 80 / 255, blue: 83 / 255)
                                ),
                                ColorModel(
                                    name: "Silver",
                                    color: Color(red: 192 / 255, green: 192 / 255, blue: 192 / 255)
                                ),
                                ColorModel(name: "Gold", color: Color(red: 255 / 255, green: 215 / 255, blue: 0 / 255)),
                            ],
                            chipFamilies: [
                                ChipFamily(name: "Apple", chips: ["A8X"])
                            ],
                            memoryOptions: ["2GB"]
                        ),

                        Device(
                            name: "iPad Air (3rd generation)",
                            displaySizes: ["10.5“"],
                            colors: [
                                ColorModel(
                                    name: "Space Gray",
                                    color: Color(red: 80 / 255, green: 80 / 255, blue: 83 / 255)
                                ),
                                ColorModel(
                                    name: "Silver",
                                    color: Color(red: 192 / 255, green: 192 / 255, blue: 192 / 255)
                                ),
                                ColorModel(name: "Gold", color: Color(red: 255 / 255, green: 215 / 255, blue: 0 / 255)),
                            ],
                            chipFamilies: [
                                ChipFamily(name: "Apple", chips: ["A12 Bionic"])
                            ],
                            memoryOptions: ["3GB"]
                        ),

                        Device(
                            name: "iPad Air (4th generation)",
                            displaySizes: ["10.9“"],
                            colors: [
                                ColorModel(
                                    name: "Space Gray",
                                    color: Color(red: 80 / 255, green: 80 / 255, blue: 83 / 255)
                                ),
                                ColorModel(
                                    name: "Silver",
                                    color: Color(red: 192 / 255, green: 192 / 255, blue: 192 / 255)
                                ),
                                ColorModel(
                                    name: "Rose Gold",
                                    color: Color(red: 255 / 255, green: 198 / 255, blue: 200 / 255)
                                ),
                                ColorModel(
                                    name: "Green",
                                    color: Color(red: 184 / 255, green: 204 / 255, blue: 188 / 255)
                                ),
                                ColorModel(
                                    name: "Sky Blue",
                                    color: Color(red: 135 / 255, green: 206 / 255, blue: 235 / 255)
                                ),
                            ],
                            chipFamilies: [
                                ChipFamily(name: "Apple", chips: ["A14 Bionic"])
                            ],
                            memoryOptions: ["4GB"]
                        ),

                        Device(
                            name: "iPad Air (5th generation)",
                            displaySizes: ["10.9“"],
                            colors: [
                                ColorModel(
                                    name: "Space Gray",
                                    color: Color(red: 80 / 255, green: 80 / 255, blue: 83 / 255)
                                ),
                                ColorModel(
                                    name: "Starlight",
                                    color: Color(red: 240 / 255, green: 235 / 255, blue: 220 / 255)
                                ),
                                ColorModel(
                                    name: "Pink",
                                    color: Color(red: 255 / 255, green: 192 / 255, blue: 203 / 255)
                                ),
                                ColorModel(
                                    name: "Purple",
                                    color: Color(red: 128 / 255, green: 0 / 255, blue: 128 / 255)
                                ),
                                ColorModel(name: "Blue", color: Color(red: 0 / 255, green: 0 / 255, blue: 255 / 255)),
                            ],
                            chipFamilies: [
                                ChipFamily(name: "Apple", chips: ["M1"])
                            ],
                            memoryOptions: ["8GB"]
                        ),

                        Device(
                            name: "iPad Air (6th generation)",
                            displaySizes: ["11“", "13“"],
                            colors: [
                                ColorModel(
                                    name: "Starlight",
                                    color: Color(red: 240 / 255, green: 235 / 255, blue: 220 / 255)
                                ),
                                ColorModel(
                                    name: "Space Gray",
                                    color: Color(red: 80 / 255, green: 80 / 255, blue: 83 / 255)
                                ),
                                ColorModel(name: "Blue", color: Color(red: 0 / 255, green: 0 / 255, blue: 255 / 255)),
                                ColorModel(
                                    name: "Purple",
                                    color: Color(red: 128 / 255, green: 0 / 255, blue: 128 / 255)
                                ),
                            ],
                            chipFamilies: [
                                ChipFamily(name: "Apple", chips: ["M2"])
                            ],
                            memoryOptions: ["8GB"]
                        ),
                    ]
                ),

                // MARK: iPad Mini
                DeviceCategory(
                    name: "iPad Mini",
                    devices: [
                        Device(
                            name: "iPad mini (1st generation)",
                            displaySizes: ["7.9“"],
                            colors: [
                                ColorModel(
                                    name: "Black & Slate",
                                    color: Color(red: 29 / 255, green: 29 / 255, blue: 31 / 255)
                                ),
                                ColorModel(
                                    name: "White & Silver",
                                    color: Color(red: 192 / 255, green: 192 / 255, blue: 192 / 255)
                                ),
                            ],
                            chipFamilies: [
                                ChipFamily(name: "Apple", chips: ["A5"])
                            ],
                            memoryOptions: ["512MB"]
                        ),

                        Device(
                            name: "iPad mini 2",
                            displaySizes: ["7.9“"],
                            colors: [
                                ColorModel(
                                    name: "Space Gray",
                                    color: Color(red: 80 / 255, green: 80 / 255, blue: 83 / 255)
                                ),
                                ColorModel(
                                    name: "Silver",
                                    color: Color(red: 192 / 255, green: 192 / 255, blue: 192 / 255)
                                ),
                            ],
                            chipFamilies: [
                                ChipFamily(name: "Apple", chips: ["A7"])
                            ],
                            memoryOptions: ["1GB"]
                        ),

                        Device(
                            name: "iPad mini 3",
                            displaySizes: ["7.9“"],
                            colors: [
                                ColorModel(
                                    name: "Space Gray",
                                    color: Color(red: 80 / 255, green: 80 / 255, blue: 83 / 255)
                                ),
                                ColorModel(
                                    name: "Silver",
                                    color: Color(red: 192 / 255, green: 192 / 255, blue: 192 / 255)
                                ),
                                ColorModel(name: "Gold", color: Color(red: 255 / 255, green: 215 / 255, blue: 0 / 255)),
                            ],
                            chipFamilies: [
                                ChipFamily(name: "Apple", chips: ["A7"])
                            ],
                            memoryOptions: ["1GB"]
                        ),

                        Device(
                            name: "iPad mini 4",
                            displaySizes: ["7.9“"],
                            colors: [
                                ColorModel(
                                    name: "Space Gray",
                                    color: Color(red: 80 / 255, green: 80 / 255, blue: 83 / 255)
                                ),
                                ColorModel(
                                    name: "Silver",
                                    color: Color(red: 192 / 255, green: 192 / 255, blue: 192 / 255)
                                ),
                                ColorModel(name: "Gold", color: Color(red: 255 / 255, green: 215 / 255, blue: 0 / 255)),
                            ],
                            chipFamilies: [
                                ChipFamily(name: "Apple", chips: ["A8"])
                            ],
                            memoryOptions: ["2GB"]
                        ),

                        Device(
                            name: "iPad mini (5th generation)",
                            displaySizes: ["7.9“"],
                            colors: [
                                ColorModel(
                                    name: "Space Gray",
                                    color: Color(red: 80 / 255, green: 80 / 255, blue: 83 / 255)
                                ),
                                ColorModel(
                                    name: "Silver",
                                    color: Color(red: 192 / 255, green: 192 / 255, blue: 192 / 255)
                                ),
                                ColorModel(name: "Gold", color: Color(red: 255 / 255, green: 215 / 255, blue: 0 / 255)),
                            ],
                            chipFamilies: [
                                ChipFamily(name: "Apple", chips: ["A12 Bionic"])
                            ],
                            memoryOptions: ["3GB"]
                        ),

                        Device(
                            name: "iPad mini (6th generation)",
                            displaySizes: ["8.3“"],
                            colors: [
                                ColorModel(
                                    name: "Space Gray",
                                    color: Color(red: 80 / 255, green: 80 / 255, blue: 83 / 255)
                                ),
                                ColorModel(
                                    name: "Starlight",
                                    color: Color(red: 240 / 255, green: 235 / 255, blue: 220 / 255)
                                ),
                                ColorModel(
                                    name: "Pink",
                                    color: Color(red: 255 / 255, green: 192 / 255, blue: 203 / 255)
                                ),
                                ColorModel(
                                    name: "Purple",
                                    color: Color(red: 128 / 255, green: 0 / 255, blue: 128 / 255)
                                ),
                            ],
                            chipFamilies: [
                                ChipFamily(name: "Apple", chips: ["A15 Bionic"])
                            ],
                            memoryOptions: ["4GB"]
                        ),
                    ]
                ),

                // MARK: iPad Pro
                DeviceCategory(
                    name: "iPad Pro",
                    devices: [
                        Device(
                            name: "iPad Pro (1st generation)",
                            displaySizes: ["9.7“"],
                            colors: [
                                ColorModel(
                                    name: "Space Gray",
                                    color: Color(red: 80 / 255, green: 80 / 255, blue: 83 / 255)
                                ),
                                ColorModel(
                                    name: "Silver",
                                    color: Color(red: 192 / 255, green: 192 / 255, blue: 192 / 255)
                                ),
                                ColorModel(name: "Gold", color: Color(red: 255 / 255, green: 215 / 255, blue: 0 / 255)),
                                ColorModel(
                                    name: "Rose Gold",
                                    color: Color(red: 255 / 255, green: 198 / 255, blue: 200 / 255)
                                ),
                            ],
                            chipFamilies: [
                                ChipFamily(name: "Apple", chips: ["A9X"])
                            ],
                            memoryOptions: ["2GB"]
                        ),

                        Device(
                            name: "iPad Pro (1st generation)",
                            displaySizes: ["12.9“"],
                            colors: [
                                ColorModel(
                                    name: "Space Gray",
                                    color: Color(red: 80 / 255, green: 80 / 255, blue: 83 / 255)
                                ),
                                ColorModel(
                                    name: "Silver",
                                    color: Color(red: 192 / 255, green: 192 / 255, blue: 192 / 255)
                                ),
                                ColorModel(name: "Gold", color: Color(red: 255 / 255, green: 215 / 255, blue: 0 / 255)),
                            ],
                            chipFamilies: [
                                ChipFamily(name: "Apple", chips: ["A9X"])
                            ],
                            memoryOptions: ["4GB"]
                        ),

                        Device(
                            name: "iPad Pro (2nd generation)",
                            displaySizes: ["10.5“"],
                            colors: [
                                ColorModel(
                                    name: "Space Gray",
                                    color: Color(red: 80 / 255, green: 80 / 255, blue: 83 / 255)
                                ),
                                ColorModel(
                                    name: "Silver",
                                    color: Color(red: 192 / 255, green: 192 / 255, blue: 192 / 255)
                                ),
                                ColorModel(name: "Gold", color: Color(red: 255 / 255, green: 215 / 255, blue: 0 / 255)),
                                ColorModel(
                                    name: "Rose Gold",
                                    color: Color(red: 255 / 255, green: 198 / 255, blue: 200 / 255)
                                ),
                            ],
                            chipFamilies: [
                                ChipFamily(name: "Apple", chips: ["A10X Fusion"])
                            ],
                            memoryOptions: ["4GB"]
                        ),

                        Device(
                            name: "iPad Pro (2nd generation)",
                            displaySizes: ["12.9“"],
                            colors: [
                                ColorModel(
                                    name: "Space Gray",
                                    color: Color(red: 80 / 255, green: 80 / 255, blue: 83 / 255)
                                ),
                                ColorModel(
                                    name: "Silver",
                                    color: Color(red: 192 / 255, green: 192 / 255, blue: 192 / 255)
                                ),
                                ColorModel(name: "Gold", color: Color(red: 255 / 255, green: 215 / 255, blue: 0 / 255)),
                            ],
                            chipFamilies: [
                                ChipFamily(name: "Apple", chips: ["A10X Fusion"])
                            ],
                            memoryOptions: ["4GB"]
                        ),

                        Device(
                            name: "iPad Pro (3rd generation)",
                            displaySizes: ["11“", "12.9“"],
                            colors: [
                                ColorModel(
                                    name: "Space Gray",
                                    color: Color(red: 80 / 255, green: 80 / 255, blue: 83 / 255)
                                ),
                                ColorModel(
                                    name: "Silver",
                                    color: Color(red: 192 / 255, green: 192 / 255, blue: 192 / 255)
                                ),
                            ],
                            chipFamilies: [
                                ChipFamily(name: "Apple", chips: ["A12X Bionic"])
                            ],
                            memoryOptions: ["4GB", "6GB"]
                        ),

                        Device(
                            name: "iPad Pro (4th generation)",
                            displaySizes: ["11“", "12.9“"],
                            colors: [
                                ColorModel(
                                    name: "Space Gray",
                                    color: Color(red: 80 / 255, green: 80 / 255, blue: 83 / 255)
                                ),
                                ColorModel(
                                    name: "Silver",
                                    color: Color(red: 192 / 255, green: 192 / 255, blue: 192 / 255)
                                ),
                            ],
                            chipFamilies: [
                                ChipFamily(name: "Apple", chips: ["A12Z Bionic"])
                            ],
                            memoryOptions: ["6GB"]
                        ),

                        Device(
                            name: "iPad Pro (5th generation)",
                            displaySizes: ["11“", "12.9“"],
                            colors: [
                                ColorModel(
                                    name: "Space Gray",
                                    color: Color(red: 80 / 255, green: 80 / 255, blue: 83 / 255)
                                ),
                                ColorModel(
                                    name: "Silver",
                                    color: Color(red: 192 / 255, green: 192 / 255, blue: 192 / 255)
                                ),
                            ],
                            chipFamilies: [
                                ChipFamily(name: "Apple", chips: ["M1"])
                            ],
                            memoryOptions: ["8GB", "16GB"]
                        ),

                        Device(
                            name: "iPad Pro (6th generation)",
                            displaySizes: ["11“", "12.9“"],
                            colors: [
                                ColorModel(
                                    name: "Space Gray",
                                    color: Color(red: 80 / 255, green: 80 / 255, blue: 83 / 255)
                                ),
                                ColorModel(
                                    name: "Silver",
                                    color: Color(red: 192 / 255, green: 192 / 255, blue: 192 / 255)
                                ),
                            ],
                            chipFamilies: [
                                ChipFamily(name: "Apple", chips: ["M2"])
                            ],
                            memoryOptions: ["8GB", "16GB"]
                        ),

                        Device(
                            name: "iPad Pro (7th generation)",
                            displaySizes: ["11“", "13“"],
                            colors: [
                                ColorModel(
                                    name: "Space Black",
                                    color: Color(red: 29 / 255, green: 29 / 255, blue: 31 / 255)
                                ),
                                ColorModel(
                                    name: "Silver",
                                    color: Color(red: 192 / 255, green: 192 / 255, blue: 192 / 255)
                                ),
                            ],
                            chipFamilies: [
                                ChipFamily(name: "Apple", chips: ["M4"])
                            ],
                            memoryOptions: ["8GB", "16GB"]
                        ),
                    ]
                ),
            ],
            operatingSystems: [
                OperatingSystem(
                    name: "iPadOS 13",
                    releases: [
                        "13.0", "13.0.1", "13.1", "13.1.1", "13.1.2", "13.1.3", "13.2", "13.2.2", "13.2.3", "13.3",
                        "13.3.1", "13.4", "13.4.1", "13.5", "13.5.1", "13.6", "13.6.1", "13.7",
                    ]
                ),
                OperatingSystem(
                    name: "iPadOS 14",
                    releases: [
                        "14.0", "14.0.1", "14.1", "14.2", "14.3", "14.4", "14.4.1", "14.4.2", "14.5", "14.5.1", "14.6",
                        "14.7", "14.7.1", "14.8", "14.8.1",
                    ]
                ),
                OperatingSystem(
                    name: "iPadOS 15",
                    releases: [
                        "15.0", "15.0.1", "15.0.2", "15.1", "15.2", "15.2.1", "15.3", "15.3.1", "15.4", "15.4.1",
                        "15.5", "15.6", "15.6.1", "15.7", "15.7.1", "15.7.2", "15.7.3", "15.7.4", "15.7.5", "15.7.6",
                        "15.7.7", "15.7.8", "15.7.9", "15.8", "15.8.1", "15.8.2", "15.8.3", "15.8.4", "15.8.5",
                    ]
                ),
                OperatingSystem(
                    name: "iPadOS 16",
                    releases: [
                        "16.1", "16.1.1", "16.2", "16.3", "16.3.1", "16.4", "16.4.1", "16.4.1 (a)", "16.5", "16.5.1",
                        "16.5.1 (c)", "16.6", "16.6.1", "16.7", "16.7.1", "16.7.2", "16.7.3", "16.7.4", "16.7.5",
                        "16.7.6", "16.7.7", "16.7.8", "16.7.9", "16.7.10", "16.7.11", "16.7.12",
                    ]
                ),
                OperatingSystem(
                    name: "iPadOS 17",
                    releases: [
                        "17.0", "17.0.1", "17.0.2", "17.0.3", "17.1", "17.1.1", "17.1.2", "17.2", "17.2.1", "17.3",
                        "17.3.1", "17.4", "17.4.1", "17.5", "17.5.1", "17.6", "17.6.1", "17.7", "17.7.1", "17.7.2",
                        "17.7.3", "17.7.4", "17.7.5", "17.7.6", "17.7.7", "17.7.8", "17.7.9", "17.7.10",
                    ]
                ),
                OperatingSystem(
                    name: "iPadOS 18",
                    releases: [
                        "18.0", "18.0.1", "18.1", "18.1.1", "18.2", "18.2.1", "18.3", "18.3.1", "18.3.2", "18.4",
                        "18.4.1", "18.5", "18.6", "18.6.1", "18.6.2", "18.7",
                    ]
                ),
                OperatingSystem(
                    name: "iPadOS 26",
                    releases: ["26.0"]
                ),
            ]
        ),

        // MARK: - Apple Watch
        Category(
            name: "Apple Watch",
            symbol: "applewatch",
            deviceCategories: [
                // MARK: Apple Watch
                DeviceCategory(
                    name: "Apple Watch",
                    devices: [
                        Device(
                            name: "Apple Watch (1st generation)",
                            displaySizes: ["38mm", "42mm"],
                            colors: [
                                ColorModel(
                                    name: "Stainless Steel",
                                    color: Color(red: 220 / 255, green: 220 / 255, blue: 220 / 255)
                                ),
                                ColorModel(
                                    name: "Space Black Stainless Steel",
                                    color: Color(red: 40 / 255, green: 40 / 255, blue: 40 / 255)
                                ),
                                ColorModel(
                                    name: "Aluminum",
                                    color: Color(red: 200 / 255, green: 200 / 255, blue: 200 / 255)
                                ),
                                ColorModel(
                                    name: "Space Gray Aluminum",
                                    color: Color(red: 80 / 255, green: 80 / 255, blue: 80 / 255)
                                ),
                                ColorModel(
                                    name: "18-Karat Yellow Gold",
                                    color: Color(red: 255 / 255, green: 215 / 255, blue: 0 / 255)
                                ),
                                ColorModel(
                                    name: "18-Karat Rose Gold",
                                    color: Color(red: 255 / 255, green: 192 / 255, blue: 203 / 255)
                                ),
                            ],
                            chipFamilies: [
                                ChipFamily(name: "Apple", chips: ["S1"])
                            ],
                            memoryOptions: ["512MB"]
                        ),

                        Device(
                            name: "Apple Watch Series 1",
                            displaySizes: ["38mm", "42mm"],
                            colors: [
                                ColorModel(
                                    name: "Space Gray Aluminum",
                                    color: Color(red: 80 / 255, green: 80 / 255, blue: 80 / 255)
                                ),
                                ColorModel(
                                    name: "Gold Aluminum",
                                    color: Color(red: 255 / 255, green: 215 / 255, blue: 0 / 255)
                                ),
                                ColorModel(
                                    name: "Silver Aluminum",
                                    color: Color(red: 192 / 255, green: 192 / 255, blue: 192 / 255)
                                ),
                            ],
                            chipFamilies: [
                                ChipFamily(name: "Apple", chips: ["S1P"])
                            ],
                            memoryOptions: ["512MB"]
                        ),

                        Device(
                            name: "Apple Watch Series 2",
                            displaySizes: ["38mm", "42mm"],
                            colors: [
                                ColorModel(
                                    name: "Space Gray Aluminum",
                                    color: Color(red: 80 / 255, green: 80 / 255, blue: 80 / 255)
                                ),
                                ColorModel(
                                    name: "Gold Aluminum",
                                    color: Color(red: 255 / 255, green: 215 / 255, blue: 0 / 255)
                                ),
                                ColorModel(
                                    name: "Silver Aluminum",
                                    color: Color(red: 192 / 255, green: 192 / 255, blue: 192 / 255)
                                ),
                                ColorModel(
                                    name: "Stainless Steel",
                                    color: Color(red: 220 / 255, green: 220 / 255, blue: 220 / 255)
                                ),
                                ColorModel(
                                    name: "Space Black Stainless Steel",
                                    color: Color(red: 40 / 255, green: 40 / 255, blue: 40 / 255)
                                ),
                            ],
                            chipFamilies: [
                                ChipFamily(name: "Apple", chips: ["S2"])
                            ],
                            memoryOptions: ["512MB"]
                        ),

                        Device(
                            name: "Apple Watch Series 3",
                            displaySizes: ["38mm", "42mm"],
                            colors: [
                                ColorModel(
                                    name: "Space Gray Aluminum",
                                    color: Color(red: 80 / 255, green: 80 / 255, blue: 80 / 255)
                                ),
                                ColorModel(
                                    name: "Gold Aluminum",
                                    color: Color(red: 255 / 255, green: 215 / 255, blue: 0 / 255)
                                ),
                                ColorModel(
                                    name: "Silver Aluminum",
                                    color: Color(red: 192 / 255, green: 192 / 255, blue: 192 / 255)
                                ),
                                ColorModel(
                                    name: "Stainless Steel",
                                    color: Color(red: 220 / 255, green: 220 / 255, blue: 220 / 255)
                                ),
                                ColorModel(
                                    name: "Space Black Stainless Steel",
                                    color: Color(red: 40 / 255, green: 40 / 255, blue: 40 / 255)
                                ),
                            ],
                            chipFamilies: [
                                ChipFamily(name: "Apple", chips: ["S3"])
                            ],
                            memoryOptions: ["768MB"]
                        ),

                        Device(
                            name: "Apple Watch Series 4",
                            displaySizes: ["40mm", "44mm"],
                            colors: [
                                ColorModel(
                                    name: "Space Gray Aluminum",
                                    color: Color(red: 80 / 255, green: 80 / 255, blue: 80 / 255)
                                ),
                                ColorModel(
                                    name: "Gold Aluminum",
                                    color: Color(red: 255 / 255, green: 215 / 255, blue: 0 / 255)
                                ),
                                ColorModel(
                                    name: "Silver Aluminum",
                                    color: Color(red: 192 / 255, green: 192 / 255, blue: 192 / 255)
                                ),
                                ColorModel(
                                    name: "Stainless Steel",
                                    color: Color(red: 220 / 255, green: 220 / 255, blue: 220 / 255)
                                ),
                                ColorModel(
                                    name: "Space Black Stainless Steel",
                                    color: Color(red: 40 / 255, green: 40 / 255, blue: 40 / 255)
                                ),
                            ],
                            chipFamilies: [
                                ChipFamily(name: "Apple", chips: ["S4"])
                            ],
                            memoryOptions: ["1GB"]
                        ),

                        Device(
                            name: "Apple Watch Series 5",
                            displaySizes: ["40mm", "44mm"],
                            colors: [
                                ColorModel(
                                    name: "Space Gray Aluminum",
                                    color: Color(red: 80 / 255, green: 80 / 255, blue: 80 / 255)
                                ),
                                ColorModel(
                                    name: "Gold Aluminum",
                                    color: Color(red: 255 / 255, green: 215 / 255, blue: 0 / 255)
                                ),
                                ColorModel(
                                    name: "Silver Aluminum",
                                    color: Color(red: 192 / 255, green: 192 / 255, blue: 192 / 255)
                                ),
                                ColorModel(
                                    name: "Stainless Steel",
                                    color: Color(red: 220 / 255, green: 220 / 255, blue: 220 / 255)
                                ),
                                ColorModel(
                                    name: "Space Black Stainless Steel",
                                    color: Color(red: 40 / 255, green: 40 / 255, blue: 40 / 255)
                                ),
                                ColorModel(
                                    name: "Titanium",
                                    color: Color(red: 150 / 255, green: 150 / 255, blue: 150 / 255)
                                ),
                                ColorModel(
                                    name: "Black Titanium",
                                    color: Color(red: 50 / 255, green: 50 / 255, blue: 50 / 255)
                                ),
                                ColorModel(
                                    name: "Ceramic",
                                    color: Color(red: 250 / 255, green: 250 / 255, blue: 250 / 255)
                                ),
                            ],
                            chipFamilies: [
                                ChipFamily(name: "Apple", chips: ["S5"])
                            ],
                            memoryOptions: ["1GB"]
                        ),

                        Device(
                            name: "Apple Watch Series 6",
                            displaySizes: ["40mm", "44mm"],
                            colors: [
                                ColorModel(
                                    name: "Blue Aluminum",
                                    color: Color(red: 60 / 255, green: 100 / 255, blue: 160 / 255)
                                ),
                                ColorModel(
                                    name: "Red Aluminum",
                                    color: Color(red: 255 / 255, green: 0 / 255, blue: 0 / 255)
                                ),
                                ColorModel(
                                    name: "Space Gray Aluminum",
                                    color: Color(red: 80 / 255, green: 80 / 255, blue: 80 / 255)
                                ),
                                ColorModel(
                                    name: "Gold Aluminum",
                                    color: Color(red: 255 / 255, green: 215 / 255, blue: 0 / 255)
                                ),
                                ColorModel(
                                    name: "Silver Aluminum",
                                    color: Color(red: 192 / 255, green: 192 / 255, blue: 192 / 255)
                                ),
                                ColorModel(
                                    name: "Stainless Steel",
                                    color: Color(red: 220 / 255, green: 220 / 255, blue: 220 / 255)
                                ),
                                ColorModel(
                                    name: "Graphite Stainless Steel",
                                    color: Color(red: 70 / 255, green: 70 / 255, blue: 70 / 255)
                                ),
                                ColorModel(
                                    name: "Gold Stainless Steel",
                                    color: Color(red: 255 / 255, green: 215 / 255, blue: 0 / 255)
                                ),
                            ],
                            chipFamilies: [
                                ChipFamily(name: "Apple", chips: ["S6"])
                            ],
                            memoryOptions: ["1GB"]
                        ),

                        Device(
                            name: "Apple Watch Series 7",
                            displaySizes: ["41mm", "45mm"],
                            colors: [
                                ColorModel(
                                    name: "Midnight Aluminum",
                                    color: Color(red: 25 / 255, green: 25 / 255, blue: 35 / 255)
                                ),
                                ColorModel(
                                    name: "Starlight Aluminum",
                                    color: Color(red: 240 / 255, green: 235 / 255, blue: 225 / 255)
                                ),
                                ColorModel(
                                    name: "Green Aluminum",
                                    color: Color(red: 80 / 255, green: 100 / 255, blue: 70 / 255)
                                ),
                                ColorModel(
                                    name: "Blue Aluminum",
                                    color: Color(red: 60 / 255, green: 100 / 255, blue: 160 / 255)
                                ),
                                ColorModel(
                                    name: "Red Aluminum",
                                    color: Color(red: 255 / 255, green: 0 / 255, blue: 0 / 255)
                                ),
                                ColorModel(
                                    name: "Stainless Steel",
                                    color: Color(red: 220 / 255, green: 220 / 255, blue: 220 / 255)
                                ),
                                ColorModel(
                                    name: "Graphite Stainless Steel",
                                    color: Color(red: 70 / 255, green: 70 / 255, blue: 70 / 255)
                                ),
                                ColorModel(
                                    name: "Gold Stainless Steel",
                                    color: Color(red: 255 / 255, green: 215 / 255, blue: 0 / 255)
                                ),
                            ],
                            chipFamilies: [
                                ChipFamily(name: "Apple", chips: ["S7"])
                            ],
                            memoryOptions: ["1GB"]
                        ),

                        Device(
                            name: "Apple Watch Series 8",
                            displaySizes: ["41mm", "45mm"],
                            colors: [
                                ColorModel(
                                    name: "Midnight Aluminum",
                                    color: Color(red: 25 / 255, green: 25 / 255, blue: 35 / 255)
                                ),
                                ColorModel(
                                    name: "Starlight Aluminum",
                                    color: Color(red: 240 / 255, green: 235 / 255, blue: 225 / 255)
                                ),
                                ColorModel(
                                    name: "Silver Aluminum",
                                    color: Color(red: 192 / 255, green: 192 / 255, blue: 192 / 255)
                                ),
                                ColorModel(
                                    name: "Red Aluminum",
                                    color: Color(red: 255 / 255, green: 0 / 255, blue: 0 / 255)
                                ),
                                ColorModel(
                                    name: "Stainless Steel",
                                    color: Color(red: 220 / 255, green: 220 / 255, blue: 220 / 255)
                                ),
                                ColorModel(
                                    name: "Graphite Stainless Steel",
                                    color: Color(red: 70 / 255, green: 70 / 255, blue: 70 / 255)
                                ),
                                ColorModel(
                                    name: "Gold Stainless Steel",
                                    color: Color(red: 255 / 255, green: 215 / 255, blue: 0 / 255)
                                ),
                            ],
                            chipFamilies: [
                                ChipFamily(name: "Apple", chips: ["S8"])
                            ],
                            memoryOptions: ["1GB"]
                        ),

                        Device(
                            name: "Apple Watch Series 9",
                            displaySizes: ["41mm", "45mm"],
                            colors: [
                                ColorModel(
                                    name: "Midnight Aluminum",
                                    color: Color(red: 25 / 255, green: 25 / 255, blue: 35 / 255)
                                ),
                                ColorModel(
                                    name: "Starlight Aluminum",
                                    color: Color(red: 240 / 255, green: 235 / 255, blue: 225 / 255)
                                ),
                                ColorModel(
                                    name: "Silver Aluminum",
                                    color: Color(red: 192 / 255, green: 192 / 255, blue: 192 / 255)
                                ),
                                ColorModel(
                                    name: "Red Aluminum",
                                    color: Color(red: 255 / 255, green: 0 / 255, blue: 0 / 255)
                                ),
                                ColorModel(
                                    name: "Pink Aluminum",
                                    color: Color(red: 255 / 255, green: 192 / 255, blue: 203 / 255)
                                ),
                                ColorModel(
                                    name: "Stainless Steel",
                                    color: Color(red: 220 / 255, green: 220 / 255, blue: 220 / 255)
                                ),
                                ColorModel(
                                    name: "Graphite Stainless Steel",
                                    color: Color(red: 70 / 255, green: 70 / 255, blue: 70 / 255)
                                ),
                                ColorModel(
                                    name: "Gold Stainless Steel",
                                    color: Color(red: 255 / 255, green: 215 / 255, blue: 0 / 255)
                                ),
                            ],
                            chipFamilies: [
                                ChipFamily(name: "Apple", chips: ["S9"])
                            ],
                            memoryOptions: ["1GB"]
                        ),

                        Device(
                            name: "Apple Watch Series 10",
                            displaySizes: ["41mm", "45mm"],
                            colors: [
                                ColorModel(
                                    name: "Midnight Aluminum",
                                    color: Color(red: 25 / 255, green: 25 / 255, blue: 35 / 255)
                                ),
                                ColorModel(
                                    name: "Starlight Aluminum",
                                    color: Color(red: 240 / 255, green: 235 / 255, blue: 225 / 255)
                                ),
                                ColorModel(
                                    name: "Silver Aluminum",
                                    color: Color(red: 192 / 255, green: 192 / 255, blue: 192 / 255)
                                ),
                                ColorModel(
                                    name: "Red Aluminum",
                                    color: Color(red: 255 / 255, green: 0 / 255, blue: 0 / 255)
                                ),
                                ColorModel(
                                    name: "Pink Aluminum",
                                    color: Color(red: 255 / 255, green: 192 / 255, blue: 203 / 255)
                                ),
                                ColorModel(
                                    name: "Stainless Steel",
                                    color: Color(red: 220 / 255, green: 220 / 255, blue: 220 / 255)
                                ),
                                ColorModel(
                                    name: "Graphite Stainless Steel",
                                    color: Color(red: 70 / 255, green: 70 / 255, blue: 70 / 255)
                                ),
                                ColorModel(
                                    name: "Gold Stainless Steel",
                                    color: Color(red: 255 / 255, green: 215 / 255, blue: 0 / 255)
                                ),
                            ],
                            chipFamilies: [
                                ChipFamily(name: "Apple", chips: ["S10"])
                            ],
                            memoryOptions: ["2GB"],
                            releaseDate: Calendar.current.date(from: DateComponents(year: 2024, month: 9, day: 9))!
                        ),

                        Device(
                            name: "Apple Watch Series 11",
                            displaySizes: ["42mm", "46mm"],
                            colors: [
                                ColorModel(
                                    name: "Rose Gold",
                                    color: Color(red: 255 / 255, green: 192 / 255, blue: 203 / 255)
                                ),
                                ColorModel(
                                    name: "Jet Black",
                                    color: Color(red: 0 / 255, green: 0 / 255, blue: 0 / 255)
                                ),
                                ColorModel(
                                    name: "Space Gray",
                                    color: Color(red: 80 / 255, green: 80 / 255, blue: 80 / 255)
                                ),
                                ColorModel(
                                    name: "Natural Titanium",
                                    color: Color(red: 150 / 255, green: 150 / 255, blue: 150 / 255)
                                ),
                                ColorModel(
                                    name: "Gold Titanium",
                                    color: Color(red: 255 / 255, green: 215 / 255, blue: 0 / 255)
                                ),
                                ColorModel(
                                    name: "Slate Titanium",
                                    color: Color(red: 80 / 255, green: 80 / 255, blue: 90 / 255)
                                ),
                            ],
                            chipFamilies: [
                                ChipFamily(name: "Apple", chips: ["S10"])
                            ],
                            memoryOptions: ["2GB"],
                            releaseDate: Calendar.current.date(from: DateComponents(year: 2025, month: 9, day: 9))!
                        ),
                    ]
                ),

                // MARK: Apple Watch SE
                DeviceCategory(
                    name: "Apple Watch SE",
                    devices: [
                        Device(
                            name: "Apple Watch SE (1st generation)",
                            displaySizes: ["40mm", "44mm"],
                            colors: [
                                ColorModel(
                                    name: "Space Gray Aluminum",
                                    color: Color(red: 80 / 255, green: 80 / 255, blue: 80 / 255)
                                ),
                                ColorModel(
                                    name: "Gold Aluminum",
                                    color: Color(red: 255 / 255, green: 215 / 255, blue: 0 / 255)
                                ),
                                ColorModel(
                                    name: "Silver Aluminum",
                                    color: Color(red: 192 / 255, green: 192 / 255, blue: 192 / 255)
                                ),
                            ],
                            chipFamilies: [
                                ChipFamily(name: "Apple", chips: ["S5"])
                            ],
                            memoryOptions: ["1GB"]
                        ),

                        Device(
                            name: "Apple Watch SE (2nd generation)",
                            displaySizes: ["40mm", "44mm"],
                            colors: [
                                ColorModel(
                                    name: "Midnight Aluminum",
                                    color: Color(red: 25 / 255, green: 25 / 255, blue: 35 / 255)
                                ),
                                ColorModel(
                                    name: "Starlight Aluminum",
                                    color: Color(red: 240 / 255, green: 235 / 255, blue: 225 / 255)
                                ),
                                ColorModel(
                                    name: "Silver Aluminum",
                                    color: Color(red: 192 / 255, green: 192 / 255, blue: 192 / 255)
                                ),
                            ],
                            chipFamilies: [
                                ChipFamily(name: "Apple", chips: ["S8"])
                            ],
                            memoryOptions: ["1GB"]
                        ),

                        Device(
                            name: "Apple Watch SE (3rd generation)",
                            displaySizes: ["40mm", "44mm"],
                            colors: [
                                ColorModel(
                                    name: "Starlight Aluminum",
                                    color: Color(red: 240 / 255, green: 235 / 255, blue: 225 / 255)
                                ),
                                ColorModel(
                                    name: "Midnight Aluminum",
                                    color: Color(red: 25 / 255, green: 25 / 255, blue: 35 / 255)
                                ),
                            ],
                            chipFamilies: [
                                ChipFamily(name: "Apple", chips: ["S10"])
                            ],
                            memoryOptions: ["2GB"],
                            releaseDate: Calendar.current.date(from: DateComponents(year: 2025, month: 9, day: 9))!
                        ),
                    ]
                ),

                // MARK: Apple Watch Ultra
                DeviceCategory(
                    name: "Apple Watch Ultra",
                    devices: [
                        Device(
                            name: "Apple Watch Ultra",
                            displaySizes: ["49mm"],
                            colors: [
                                ColorModel(
                                    name: "Natural Titanium",
                                    color: Color(red: 150 / 255, green: 150 / 255, blue: 150 / 255)
                                )
                            ],
                            chipFamilies: [
                                ChipFamily(name: "Apple", chips: ["S8"])
                            ],
                            memoryOptions: ["1GB"],
                            releaseDate: Calendar.current.date(from: DateComponents(year: 2022, month: 9, day: 23))!
                        ),

                        Device(
                            name: "Apple Watch Ultra 2",
                            displaySizes: ["49mm"],
                            colors: [
                                ColorModel(
                                    name: "Natural Titanium",
                                    color: Color(red: 150 / 255, green: 150 / 255, blue: 150 / 255)
                                ),
                                ColorModel(
                                    name: "Black Titanium",
                                    color: Color(red: 50 / 255, green: 50 / 255, blue: 50 / 255)
                                ),
                            ],
                            chipFamilies: [
                                ChipFamily(name: "Apple", chips: ["S9"])
                            ],
                            memoryOptions: ["1GB"],
                            releaseDate: Calendar.current.date(from: DateComponents(year: 2023, month: 9, day: 12))!
                        ),

                        Device(
                            name: "Apple Watch Ultra 3",
                            displaySizes: ["49mm"],
                            colors: [
                                ColorModel(
                                    name: "Natural Titanium",
                                    color: Color(red: 150 / 255, green: 150 / 255, blue: 150 / 255)
                                ),
                                ColorModel(
                                    name: "Black Titanium",
                                    color: Color(red: 50 / 255, green: 50 / 255, blue: 50 / 255)
                                ),
                            ],
                            chipFamilies: [
                                ChipFamily(name: "Apple", chips: ["S10"])
                            ],
                            memoryOptions: ["2GB"],
                            releaseDate: Calendar.current.date(from: DateComponents(year: 2025, month: 9, day: 9))!
                        ),
                    ]
                ),
            ],
            operatingSystems: [
                OperatingSystem(name: "watchOS 1", releases: ["1.0", "1.0.1"]),
                OperatingSystem(name: "watchOS 2", releases: ["2.0", "2.0.1", "2.1", "2.2", "2.2.1", "2.2.2"]),
                OperatingSystem(name: "watchOS 3", releases: ["3.1", "3.1.1", "3.1.3", "3.2", "3.2.2", "3.2.3"]),
                OperatingSystem(
                    name: "watchOS 4",
                    releases: ["4.0", "4.1", "4.2", "4.2.2", "4.2.3", "4.3", "4.3.1", "4.3.2"]
                ),
                OperatingSystem(
                    name: "watchOS 5",
                    releases: [
                        "5.0", "5.0.1", "5.1", "5.1.1", "5.1.2", "5.1.3", "5.2", "5.2.1", "5.3", "5.3.1", "5.3.2",
                        "5.3.3", "5.3.4", "5.3.5", "5.3.6", "5.3.7", "5.3.8", "5.3.9",
                    ]
                ),
                OperatingSystem(
                    name: "watchOS 6",
                    releases: [
                        "6.0", "6.0.1", "6.1", "6.1.1", "6.1.2", "6.1.3", "6.2", "6.2.1", "6.2.5", "6.2.6", "6.2.8",
                        "6.3",
                    ]
                ),
                OperatingSystem(
                    name: "watchOS 7",
                    releases: [
                        "7.0", "7.0.1", "7.0.2", "7.0.3", "7.1", "7.2", "7.3", "7.3.1", "7.3.2", "7.3.3", "7.4", "7.5",
                        "7.6", "7.6.1", "7.6.2",
                    ]
                ),
                OperatingSystem(
                    name: "watchOS 8",
                    releases: [
                        "8.0", "8.0.1", "8.1", "8.1.1", "8.3", "8.4", "8.4.1", "8.4.2", "8.5", "8.5.1", "8.6", "8.7",
                        "8.7.1", "8.8", "8.8.1",
                    ]
                ),
                OperatingSystem(
                    name: "watchOS 9",
                    releases: [
                        "9.0", "9.0.1", "9.0.2", "9.1", "9.1.1", "9.2", "9.3", "9.3.1", "9.4", "9.5", "9.5.1", "9.5.2",
                        "9.6", "9.6.1", "9.6.2", "9.6.3",
                    ]
                ),
                OperatingSystem(
                    name: "watchOS 10",
                    releases: [
                        "10.0", "10.0.1", "10.0.2", "10.1", "10.1.1", "10.2", "10.2.1", "10.3", "10.4", "10.5", "10.6",
                        "10.6.1",
                    ]
                ),
                OperatingSystem(
                    name: "watchOS 11",
                    releases: [
                        "11.0", "11.0.1", "11.1", "11.1.1", "11.2", "11.2.1", "11.3", "11.3.1", "11.4", "11.5", "11.6",
                        "11.6.1",
                    ]
                ),
                OperatingSystem(name: "watchOS 26", releases: ["26.0"]),
            ]
        ),

        // MARK: - AirPods
        Category(
            name: "AirPods",
            symbol: "airpods.pro.chargingcase.wireless.fill",
            deviceCategories: [
                // MARK: AirPods
                DeviceCategory(
                    name: "AirPods",
                    devices: [
                        Device(
                            name: "AirPods (1st generation)",
                            displaySizes: [],
                            colors: [
                                ColorModel(
                                    name: "White",
                                    color: Color(red: 255 / 255, green: 255 / 255, blue: 255 / 255)
                                )
                            ],
                            chipFamilies: [
                                ChipFamily(name: "Apple", chips: ["W1"])
                            ],
                            memoryOptions: [""]
                        ),

                        Device(
                            name: "AirPods (2nd generation)",
                            displaySizes: [],
                            colors: [
                                ColorModel(
                                    name: "White",
                                    color: Color(red: 255 / 255, green: 255 / 255, blue: 255 / 255)
                                )
                            ],
                            chipFamilies: [
                                ChipFamily(name: "Apple", chips: ["H1"])
                            ],
                            memoryOptions: [""]
                        ),

                        Device(
                            name: "AirPods (3rd generation)",
                            displaySizes: [],
                            colors: [
                                ColorModel(
                                    name: "White",
                                    color: Color(red: 255 / 255, green: 255 / 255, blue: 255 / 255)
                                )
                            ],
                            chipFamilies: [
                                ChipFamily(name: "Apple", chips: ["H1"])
                            ],
                            memoryOptions: [""]
                        ),

                        Device(
                            name: "AirPods (4th generation)",
                            displaySizes: [],
                            colors: [
                                ColorModel(
                                    name: "White",
                                    color: Color(red: 255 / 255, green: 255 / 255, blue: 255 / 255)
                                )
                            ],
                            chipFamilies: [
                                ChipFamily(name: "Apple", chips: ["H2"])
                            ],
                            memoryOptions: [""]
                        ),

                        Device(
                            name: "AirPods (4th generation) with ANC",
                            displaySizes: [],
                            colors: [
                                ColorModel(
                                    name: "White",
                                    color: Color(red: 255 / 255, green: 255 / 255, blue: 255 / 255)
                                )
                            ],
                            chipFamilies: [
                                ChipFamily(name: "Apple", chips: ["H2"])
                            ],
                            memoryOptions: [""]
                        ),
                    ]
                ),

                // MARK: AirPods Max
                DeviceCategory(
                    name: "AirPods Max",
                    devices: [
                        Device(
                            name: "AirPods Max",
                            displaySizes: [],
                            colors: [
                                ColorModel(
                                    name: "Space Gray",
                                    color: Color(red: 105 / 255, green: 105 / 255, blue: 105 / 255)
                                ),
                                ColorModel(
                                    name: "Silver",
                                    color: Color(red: 192 / 255, green: 192 / 255, blue: 192 / 255)
                                ),
                                ColorModel(
                                    name: "Sky Blue",
                                    color: Color(red: 135 / 255, green: 206 / 255, blue: 235 / 255)
                                ),
                                ColorModel(
                                    name: "Pink",
                                    color: Color(red: 255 / 255, green: 192 / 255, blue: 203 / 255)
                                ),
                                ColorModel(name: "Green", color: Color(red: 0 / 255, green: 128 / 255, blue: 0 / 255)),
                                ColorModel(
                                    name: "Midnight",
                                    color: Color(red: 0 / 255, green: 0 / 255, blue: 128 / 255)
                                ),
                                ColorModel(
                                    name: "Starlight",
                                    color: Color(red: 255 / 255, green: 248 / 255, blue: 220 / 255)
                                ),
                                ColorModel(name: "Blue", color: Color(red: 0 / 255, green: 0 / 255, blue: 255 / 255)),
                                ColorModel(
                                    name: "Purple",
                                    color: Color(red: 128 / 255, green: 0 / 255, blue: 128 / 255)
                                ),
                                ColorModel(
                                    name: "Orange",
                                    color: Color(red: 255 / 255, green: 165 / 255, blue: 0 / 255)
                                ),
                            ],
                            chipFamilies: [
                                ChipFamily(name: "Apple", chips: ["H1"])
                            ],
                            memoryOptions: [""]
                        )
                    ]
                ),

                // MARK: AirPods Pro
                DeviceCategory(
                    name: "AirPods Pro",
                    devices: [
                        Device(
                            name: "AirPods Pro (1st generation)",
                            displaySizes: [],
                            colors: [
                                ColorModel(
                                    name: "White",
                                    color: Color(red: 255 / 255, green: 255 / 255, blue: 255 / 255)
                                )
                            ],
                            chipFamilies: [
                                ChipFamily(name: "Apple", chips: ["H1"])
                            ],
                            memoryOptions: [""]
                        ),

                        Device(
                            name: "AirPods Pro (2nd generation)",
                            displaySizes: [],
                            colors: [
                                ColorModel(
                                    name: "White",
                                    color: Color(red: 255 / 255, green: 255 / 255, blue: 255 / 255)
                                )
                            ],
                            chipFamilies: [
                                ChipFamily(name: "Apple", chips: ["H2", "U1 (in case)"])
                            ],
                            memoryOptions: [""]
                        ),

                        Device(
                            name: "AirPods Pro (3rd generation)",
                            displaySizes: [],
                            colors: [
                                ColorModel(
                                    name: "White",
                                    color: Color(red: 255 / 255, green: 255 / 255, blue: 255 / 255)
                                ),
                                ColorModel(
                                    name: "Midnight",
                                    color: Color(red: 0 / 255, green: 0 / 255, blue: 128 / 255)
                                ),
                                ColorModel(
                                    name: "Starlight",
                                    color: Color(red: 255 / 255, green: 248 / 255, blue: 220 / 255)
                                ),
                            ],
                            chipFamilies: [
                                ChipFamily(name: "Apple", chips: ["H2"])
                            ],
                            memoryOptions: [""],
                        ),
                    ]
                ),
            ],
            operatingSystems: [
                OperatingSystem(
                    name: "AirPods Pro (2nd gen, USB-C)",
                    releases: ["7E93"]
                ),
                OperatingSystem(
                    name: "AirPods Pro (2nd gen, Lightning)",
                    releases: ["7E93"]
                ),
                OperatingSystem(
                    name: "AirPods Pro (1st gen)",
                    releases: ["6F21"]
                ),
                OperatingSystem(
                    name: "AirPods (4th gen)",
                    releases: ["7E93"]
                ),
                OperatingSystem(
                    name: "AirPods (4th gen with ANC)",
                    releases: ["7E93"]
                ),
                OperatingSystem(
                    name: "AirPods (3rd gen)",
                    releases: ["6F21"]
                ),
                OperatingSystem(
                    name: "AirPods (2nd gen)",
                    releases: ["6F21"]
                ),
                OperatingSystem(
                    name: "AirPods (1st gen)",
                    releases: ["6.8.8"]
                ),
                OperatingSystem(
                    name: "AirPods Max (USB-C)",
                    releases: ["7E99"]
                ),
                OperatingSystem(
                    name: "AirPods Max (Lightning)",
                    releases: ["6F25"]
                ),
            ]
        ),

        // MARK: - Apple TV
        Category(
            name: "Apple TV",
            symbol: "appletv.fill",
            deviceCategories: [

                // MARK: Apple TV
                DeviceCategory(
                    name: "Apple TV",
                    devices: [
                        Device(
                            name: "Apple TV (1st generation)",
                            displaySizes: [],
                            colors: [
                                ColorModel(
                                    name: "Silver",
                                    color: Color(red: 192 / 255, green: 192 / 255, blue: 192 / 255)
                                )
                            ],
                            chipFamilies: [
                                ChipFamily(name: "Intel", chips: ["Pentium M"])
                            ],
                            memoryOptions: ["40 GB", "160 GB"]
                        ),

                        Device(
                            name: "Apple TV (2nd generation)",
                            displaySizes: [],
                            colors: [
                                ColorModel(name: "Black", color: Color(red: 0 / 255, green: 0 / 255, blue: 0 / 255))
                            ],
                            chipFamilies: [
                                ChipFamily(name: "Apple", chips: ["A4"])
                            ],
                            memoryOptions: ["8 GB"]
                        ),

                        Device(
                            name: "Apple TV (3rd generation)",
                            displaySizes: [],
                            colors: [
                                ColorModel(name: "Black", color: Color(red: 0 / 255, green: 0 / 255, blue: 0 / 255))
                            ],
                            chipFamilies: [
                                ChipFamily(name: "Apple", chips: ["A5"])
                            ],
                            memoryOptions: ["8 GB"]
                        ),
                    ]
                ),

                // MARK: Apple TV HD
                DeviceCategory(
                    name: "Apple TV HD",
                    devices: [
                        Device(
                            name: "Apple TV HD",
                            displaySizes: [],
                            colors: [
                                ColorModel(name: "Black", color: Color(red: 0 / 255, green: 0 / 255, blue: 0 / 255))
                            ],
                            chipFamilies: [
                                ChipFamily(name: "Apple", chips: ["A8"])
                            ],
                            memoryOptions: ["32 GB", "64 GB"]
                        )
                    ]
                ),

                // MARK: Apple TV 4K
                DeviceCategory(
                    name: "Apple TV 4K",
                    devices: [
                        Device(
                            name: "Apple TV 4K (1st generation)",
                            displaySizes: [],
                            colors: [
                                ColorModel(name: "Black", color: Color(red: 0 / 255, green: 0 / 255, blue: 0 / 255))
                            ],
                            chipFamilies: [
                                ChipFamily(name: "Apple", chips: ["A10X Fusion"])
                            ],
                            memoryOptions: ["32 GB", "64 GB"]
                        ),

                        Device(
                            name: "Apple TV 4K (2nd generation)",
                            displaySizes: [],
                            colors: [
                                ColorModel(name: "Black", color: Color(red: 0 / 255, green: 0 / 255, blue: 0 / 255))
                            ],
                            chipFamilies: [
                                ChipFamily(name: "Apple", chips: ["A12 Bionic"])
                            ],
                            memoryOptions: ["32 GB", "64 GB"]
                        ),

                        Device(
                            name: "Apple TV 4K (3rd generation)",
                            displaySizes: [],
                            colors: [
                                ColorModel(name: "Black", color: Color(red: 0 / 255, green: 0 / 255, blue: 0 / 255))
                            ],
                            chipFamilies: [
                                ChipFamily(name: "Apple", chips: ["A15 Bionic"])
                            ],
                            memoryOptions: ["64 GB", "128 GB"]
                        ),
                    ]
                ),
            ],
            operatingSystems: [
                OperatingSystem(name: "tvOS 9", releases: ["9.0", "9.0.1", "9.1", "9.1.1", "9.2", "9.2.1", "9.2.2"]),
                OperatingSystem(
                    name: "tvOS 10",
                    releases: ["10.0", "10.0.1", "10.0.2", "10.1", "10.1.1", "10.2", "10.2.1", "10.2.2"]
                ),
                OperatingSystem(
                    name: "tvOS 11",
                    releases: ["11.0", "11.1", "11.2", "11.2.1", "11.2.5", "11.2.6", "11.3", "11.4", "11.4.1"]
                ),
                OperatingSystem(
                    name: "tvOS 12",
                    releases: ["12.0", "12.0.1", "12.1", "12.1.1", "12.1.2", "12.2", "12.3", "12.4"]
                ),
                OperatingSystem(
                    name: "tvOS 13",
                    releases: ["13.0", "13.2", "13.2.3", "13.3", "13.3.1", "13.4", "13.4.5", "13.4.6", "13.4.8"]
                ),
                OperatingSystem(
                    name: "tvOS 14",
                    releases: ["14.0", "14.0.1", "14.0.2", "14.2", "14.3", "14.4", "14.5", "14.6", "14.7"]
                ),
                OperatingSystem(
                    name: "tvOS 15",
                    releases: [
                        "15.0", "15.0.1", "15.1", "15.1.1", "15.2", "15.3", "15.4", "15.4.1", "15.5", "15.5.1", "15.6",
                        "15.6.1",
                    ]
                ),
                OperatingSystem(
                    name: "tvOS 16",
                    releases: [
                        "16.0", "16.1", "16.1.1", "16.2", "16.3", "16.3.1", "16.3.2", "16.4", "16.4.1", "16.5", "16.6",
                    ]
                ),
                OperatingSystem(
                    name: "tvOS 17",
                    releases: [
                        "17.0", "17.0.1", "17.1", "17.1.1", "17.2", "17.2.1", "17.3", "17.3.1", "17.4", "17.4.1",
                        "17.5", "17.5.1", "17.6", "17.6.1", "17.7", "17.7.1", "17.7.2", "17.7.3", "17.7.4", "17.7.5",
                        "17.7.6", "17.7.7", "17.7.8", "17.7.9", "17.7.10",
                    ]
                ),
                OperatingSystem(
                    name: "tvOS 18",
                    releases: [
                        "18.0", "18.1", "18.2", "18.2.1", "18.3", "18.3.1", "18.4", "18.4.1", "18.5", "18.6", "18.6.1",
                    ]
                ),
                OperatingSystem(name: "tvOS 26", releases: ["26.0"]),
            ]
        ),

        // MARK: - iPod
        Category(
            name: "iPod",
            symbol: "ipod",
            deviceCategories: [
                // MARK: iPod
                DeviceCategory(
                    name: "iPod",
                    devices: [
                        Device(
                            name: "iPod (Original)",
                            displaySizes: ["2.0\""],
                            colors: [
                                ColorModel(
                                    name: "White",
                                    color: Color(red: 255 / 255, green: 255 / 255, blue: 255 / 255)
                                )
                            ],
                            chipFamilies: [
                                ChipFamily(name: "ARM", chips: ["ARM 7TDMI"])
                            ],
                            memoryOptions: ["32MB"]
                        )
                    ]
                ),

                // MARK: iPod Mini
                DeviceCategory(
                    name: "iPod Mini",
                    devices: [
                        Device(
                            name: "iPod mini",
                            displaySizes: ["1.67\""],
                            colors: [
                                ColorModel(
                                    name: "Silver",
                                    color: Color(red: 192 / 255, green: 192 / 255, blue: 192 / 255)
                                ),
                                ColorModel(name: "Gold", color: Color(red: 255 / 255, green: 215 / 255, blue: 0 / 255)),
                                ColorModel(name: "Blue", color: Color(red: 0 / 255, green: 0 / 255, blue: 255 / 255)),
                                ColorModel(
                                    name: "Pink",
                                    color: Color(red: 255 / 255, green: 192 / 255, blue: 203 / 255)
                                ),
                                ColorModel(name: "Green", color: Color(red: 0 / 255, green: 128 / 255, blue: 0 / 255)),
                            ],
                            chipFamilies: [
                                ChipFamily(name: "ARM", chips: ["ARM 7TDMI"])
                            ],
                            memoryOptions: ["32MB"]
                        )
                    ]
                ),

                // MARK: iPod Shuffle
                DeviceCategory(
                    name: "iPod Shuffle",
                    devices: [
                        Device(
                            name: "iPod shuffle (1st gen)",
                            displaySizes: ["None"],
                            colors: [
                                ColorModel(
                                    name: "White",
                                    color: Color(red: 255 / 255, green: 255 / 255, blue: 255 / 255)
                                )
                            ],
                            chipFamilies: [
                                ChipFamily(name: "SigmaTel", chips: ["D-Major"])
                            ],
                            memoryOptions: ["None"]
                        ),

                        Device(
                            name: "iPod shuffle (2nd gen)",
                            displaySizes: ["None"],
                            colors: [
                                ColorModel(
                                    name: "Silver",
                                    color: Color(red: 192 / 255, green: 192 / 255, blue: 192 / 255)
                                ),
                                ColorModel(
                                    name: "Pink",
                                    color: Color(red: 255 / 255, green: 192 / 255, blue: 203 / 255)
                                ),
                                ColorModel(name: "Blue", color: Color(red: 0 / 255, green: 0 / 255, blue: 255 / 255)),
                                ColorModel(name: "Green", color: Color(red: 0 / 255, green: 128 / 255, blue: 0 / 255)),
                                ColorModel(name: "Red", color: Color(red: 255 / 255, green: 0 / 255, blue: 0 / 255)),
                                ColorModel(
                                    name: "Purple",
                                    color: Color(red: 128 / 255, green: 0 / 255, blue: 128 / 255)
                                ),
                            ],
                            chipFamilies: [
                                ChipFamily(name: "SigmaTel", chips: ["D-Major"])
                            ],
                            memoryOptions: ["None"]
                        ),

                        Device(
                            name: "iPod shuffle (3rd gen)",
                            displaySizes: ["None"],
                            colors: [
                                ColorModel(
                                    name: "Silver",
                                    color: Color(red: 192 / 255, green: 192 / 255, blue: 192 / 255)
                                ),
                                ColorModel(name: "Black", color: Color(red: 0 / 255, green: 0 / 255, blue: 0 / 255)),
                                ColorModel(
                                    name: "Pink",
                                    color: Color(red: 255 / 255, green: 192 / 255, blue: 203 / 255)
                                ),
                                ColorModel(name: "Blue", color: Color(red: 0 / 255, green: 0 / 255, blue: 255 / 255)),
                                ColorModel(name: "Green", color: Color(red: 0 / 255, green: 128 / 255, blue: 0 / 255)),
                                ColorModel(name: "Red", color: Color(red: 255 / 255, green: 0 / 255, blue: 0 / 255)),
                            ],
                            chipFamilies: [
                                ChipFamily(name: "Apple", chips: ["Apple 4801"])
                            ],
                            memoryOptions: ["None"]
                        ),

                        Device(
                            name: "iPod shuffle (4th gen)",
                            displaySizes: ["None"],
                            colors: [
                                ColorModel(
                                    name: "Space Gray",
                                    color: Color(red: 105 / 255, green: 105 / 255, blue: 105 / 255)
                                ),
                                ColorModel(
                                    name: "Silver",
                                    color: Color(red: 192 / 255, green: 192 / 255, blue: 192 / 255)
                                ),
                                ColorModel(name: "Gold", color: Color(red: 255 / 255, green: 215 / 255, blue: 0 / 255)),
                                ColorModel(
                                    name: "Pink",
                                    color: Color(red: 255 / 255, green: 192 / 255, blue: 203 / 255)
                                ),
                                ColorModel(name: "Blue", color: Color(red: 0 / 255, green: 0 / 255, blue: 255 / 255)),
                                ColorModel(name: "Red", color: Color(red: 255 / 255, green: 0 / 255, blue: 0 / 255)),
                            ],
                            chipFamilies: [
                                ChipFamily(name: "Apple", chips: ["Apple 4801"])
                            ],
                            memoryOptions: ["None"]
                        ),
                    ]
                ),

                // MARK: iPod Nano
                DeviceCategory(
                    name: "iPod Nano",
                    devices: [
                        Device(
                            name: "iPod nano (1st gen)",
                            displaySizes: ["1.5\""],
                            colors: [
                                ColorModel(
                                    name: "White",
                                    color: Color(red: 255 / 255, green: 255 / 255, blue: 255 / 255)
                                ),
                                ColorModel(name: "Black", color: Color(red: 0 / 255, green: 0 / 255, blue: 0 / 255)),
                            ],
                            chipFamilies: [
                                ChipFamily(name: "Samsung", chips: ["Samsung ARM7"])
                            ],
                            memoryOptions: ["32MB"]
                        ),

                        Device(
                            name: "iPod nano (2nd gen)",
                            displaySizes: ["1.5\""],
                            colors: [
                                ColorModel(
                                    name: "Silver",
                                    color: Color(red: 192 / 255, green: 192 / 255, blue: 192 / 255)
                                ),
                                ColorModel(name: "Blue", color: Color(red: 0 / 255, green: 0 / 255, blue: 255 / 255)),
                                ColorModel(name: "Green", color: Color(red: 0 / 255, green: 128 / 255, blue: 0 / 255)),
                                ColorModel(
                                    name: "Pink",
                                    color: Color(red: 255 / 255, green: 192 / 255, blue: 203 / 255)
                                ),
                                ColorModel(name: "Black", color: Color(red: 0 / 255, green: 0 / 255, blue: 0 / 255)),
                                ColorModel(name: "Red", color: Color(red: 255 / 255, green: 0 / 255, blue: 0 / 255)),
                            ],
                            chipFamilies: [
                                ChipFamily(name: "Samsung", chips: ["Samsung ARM7"])
                            ],
                            memoryOptions: ["32MB"]
                        ),

                        Device(
                            name: "iPod nano (3rd gen)",
                            displaySizes: ["2.0\""],
                            colors: [
                                ColorModel(
                                    name: "Silver",
                                    color: Color(red: 192 / 255, green: 192 / 255, blue: 192 / 255)
                                ),
                                ColorModel(name: "Black", color: Color(red: 0 / 255, green: 0 / 255, blue: 0 / 255)),
                                ColorModel(name: "Blue", color: Color(red: 0 / 255, green: 0 / 255, blue: 255 / 255)),
                                ColorModel(name: "Green", color: Color(red: 0 / 255, green: 128 / 255, blue: 0 / 255)),
                                ColorModel(
                                    name: "Pink",
                                    color: Color(red: 255 / 255, green: 192 / 255, blue: 203 / 255)
                                ),
                                ColorModel(name: "Red", color: Color(red: 255 / 255, green: 0 / 255, blue: 0 / 255)),
                            ],
                            chipFamilies: [
                                ChipFamily(name: "Samsung", chips: ["Samsung ARM7"])
                            ],
                            memoryOptions: ["32MB"]
                        ),

                        Device(
                            name: "iPod nano (4th gen)",
                            displaySizes: ["2.0\""],
                            colors: [
                                ColorModel(
                                    name: "Silver",
                                    color: Color(red: 192 / 255, green: 192 / 255, blue: 192 / 255)
                                ),
                                ColorModel(name: "Black", color: Color(red: 0 / 255, green: 0 / 255, blue: 0 / 255)),
                                ColorModel(name: "Blue", color: Color(red: 0 / 255, green: 0 / 255, blue: 255 / 255)),
                                ColorModel(name: "Green", color: Color(red: 0 / 255, green: 128 / 255, blue: 0 / 255)),
                                ColorModel(
                                    name: "Purple",
                                    color: Color(red: 128 / 255, green: 0 / 255, blue: 128 / 255)
                                ),
                                ColorModel(
                                    name: "Pink",
                                    color: Color(red: 255 / 255, green: 192 / 255, blue: 203 / 255)
                                ),
                                ColorModel(name: "Red", color: Color(red: 255 / 255, green: 0 / 255, blue: 0 / 255)),
                                ColorModel(
                                    name: "Yellow",
                                    color: Color(red: 255 / 255, green: 255 / 255, blue: 0 / 255)
                                ),
                                ColorModel(
                                    name: "Orange",
                                    color: Color(red: 255 / 255, green: 165 / 255, blue: 0 / 255)
                                ),
                            ],
                            chipFamilies: [
                                ChipFamily(name: "Samsung", chips: ["Samsung ARM7"])
                            ],
                            memoryOptions: ["32MB"]
                        ),

                        Device(
                            name: "iPod nano (5th gen)",
                            displaySizes: ["2.2\""],
                            colors: [
                                ColorModel(
                                    name: "Silver",
                                    color: Color(red: 192 / 255, green: 192 / 255, blue: 192 / 255)
                                ),
                                ColorModel(name: "Black", color: Color(red: 0 / 255, green: 0 / 255, blue: 0 / 255)),
                                ColorModel(
                                    name: "Purple",
                                    color: Color(red: 128 / 255, green: 0 / 255, blue: 128 / 255)
                                ),
                                ColorModel(name: "Blue", color: Color(red: 0 / 255, green: 0 / 255, blue: 255 / 255)),
                                ColorModel(name: "Green", color: Color(red: 0 / 255, green: 128 / 255, blue: 0 / 255)),
                                ColorModel(
                                    name: "Yellow",
                                    color: Color(red: 255 / 255, green: 255 / 255, blue: 0 / 255)
                                ),
                                ColorModel(
                                    name: "Orange",
                                    color: Color(red: 255 / 255, green: 165 / 255, blue: 0 / 255)
                                ),
                                ColorModel(name: "Red", color: Color(red: 255 / 255, green: 0 / 255, blue: 0 / 255)),
                                ColorModel(
                                    name: "Pink",
                                    color: Color(red: 255 / 255, green: 192 / 255, blue: 203 / 255)
                                ),
                            ],
                            chipFamilies: [
                                ChipFamily(name: "Samsung", chips: ["Samsung ARM7"])
                            ],
                            memoryOptions: ["32MB"]
                        ),

                        Device(
                            name: "iPod nano (6th gen)",
                            displaySizes: ["1.54\""],
                            colors: [
                                ColorModel(
                                    name: "Space Gray",
                                    color: Color(red: 105 / 255, green: 105 / 255, blue: 105 / 255)
                                ),
                                ColorModel(
                                    name: "Silver",
                                    color: Color(red: 192 / 255, green: 192 / 255, blue: 192 / 255)
                                ),
                                ColorModel(name: "Blue", color: Color(red: 0 / 255, green: 0 / 255, blue: 255 / 255)),
                                ColorModel(name: "Green", color: Color(red: 0 / 255, green: 128 / 255, blue: 0 / 255)),
                                ColorModel(
                                    name: "Orange",
                                    color: Color(red: 255 / 255, green: 165 / 255, blue: 0 / 255)
                                ),
                                ColorModel(
                                    name: "Pink",
                                    color: Color(red: 255 / 255, green: 192 / 255, blue: 203 / 255)
                                ),
                                ColorModel(name: "Red", color: Color(red: 255 / 255, green: 0 / 255, blue: 0 / 255)),
                            ],
                            chipFamilies: [
                                ChipFamily(name: "Samsung", chips: ["Samsung ARM7"])
                            ],
                            memoryOptions: ["64MB"]
                        ),

                        Device(
                            name: "iPod nano (7th gen)",
                            displaySizes: ["2.5\""],
                            colors: [
                                ColorModel(
                                    name: "Space Gray",
                                    color: Color(red: 105 / 255, green: 105 / 255, blue: 105 / 255)
                                ),
                                ColorModel(
                                    name: "Silver",
                                    color: Color(red: 192 / 255, green: 192 / 255, blue: 192 / 255)
                                ),
                                ColorModel(name: "Gold", color: Color(red: 255 / 255, green: 215 / 255, blue: 0 / 255)),
                                ColorModel(
                                    name: "Pink",
                                    color: Color(red: 255 / 255, green: 192 / 255, blue: 203 / 255)
                                ),
                                ColorModel(name: "Blue", color: Color(red: 0 / 255, green: 0 / 255, blue: 255 / 255)),
                                ColorModel(name: "Red", color: Color(red: 255 / 255, green: 0 / 255, blue: 0 / 255)),
                            ],
                            chipFamilies: [
                                ChipFamily(name: "Apple", chips: ["Apple 4801"])
                            ],
                            memoryOptions: ["64MB"]
                        ),
                    ]
                ),

                // MARK: iPod Classic
                DeviceCategory(
                    name: "iPod Classic",
                    devices: [
                        Device(
                            name: "iPod classic (1st gen)",
                            displaySizes: ["2.0\""],
                            colors: [
                                ColorModel(
                                    name: "White",
                                    color: Color(red: 255 / 255, green: 255 / 255, blue: 255 / 255)
                                )
                            ],
                            chipFamilies: [
                                ChipFamily(name: "ARM", chips: ["ARM 7TDMI"])
                            ],
                            memoryOptions: ["32MB"]
                        ),
                        Device(
                            name: "iPod classic (2nd gen)",
                            displaySizes: ["2.0\""],
                            colors: [
                                ColorModel(
                                    name: "White",
                                    color: Color(red: 255 / 255, green: 255 / 255, blue: 255 / 255)
                                )
                            ],
                            chipFamilies: [
                                ChipFamily(name: "ARM", chips: ["ARM 7TDMI"])
                            ],
                            memoryOptions: ["32MB"]
                        ),
                        Device(
                            name: "iPod classic (3rd gen)",
                            displaySizes: ["2.0\""],
                            colors: [
                                ColorModel(
                                    name: "White",
                                    color: Color(red: 255 / 255, green: 255 / 255, blue: 255 / 255)
                                )
                            ],
                            chipFamilies: [
                                ChipFamily(name: "ARM", chips: ["ARM 7TDMI"])
                            ],
                            memoryOptions: ["32MB"]
                        ),
                        Device(
                            name: "iPod classic (4th gen)",
                            displaySizes: ["2.0\""],
                            colors: [
                                ColorModel(
                                    name: "White",
                                    color: Color(red: 255 / 255, green: 255 / 255, blue: 255 / 255)
                                )
                            ],
                            chipFamilies: [
                                ChipFamily(name: "ARM", chips: ["ARM 7TDMI"])
                            ],
                            memoryOptions: ["32MB"]
                        ),
                        Device(
                            name: "iPod classic (5th gen)",
                            displaySizes: ["2.5\""],
                            colors: [
                                ColorModel(
                                    name: "White",
                                    color: Color(red: 255 / 255, green: 255 / 255, blue: 255 / 255)
                                ),
                                ColorModel(name: "Black", color: Color(red: 0 / 255, green: 0 / 255, blue: 0 / 255)),
                            ],
                            chipFamilies: [
                                ChipFamily(name: "Samsung", chips: ["Samsung ARM7"])
                            ],
                            memoryOptions: ["64MB"]
                        ),
                        Device(
                            name: "iPod classic (6th gen)",
                            displaySizes: ["2.5\""],
                            colors: [
                                ColorModel(
                                    name: "Silver",
                                    color: Color(red: 192 / 255, green: 192 / 255, blue: 192 / 255)
                                ),
                                ColorModel(name: "Black", color: Color(red: 0 / 255, green: 0 / 255, blue: 0 / 255)),
                            ],
                            chipFamilies: [
                                ChipFamily(name: "Apple", chips: ["Apple ARM"])
                            ],
                            memoryOptions: ["64MB"]
                        ),
                    ]
                ),

                // MARK: iPod Touch
                DeviceCategory(
                    name: "iPod Touch",
                    devices: [
                        Device(
                            name: "iPod touch (1st gen)",
                            displaySizes: ["3.5\""],
                            colors: [
                                ColorModel(
                                    name: "Silver",
                                    color: Color(red: 192 / 255, green: 192 / 255, blue: 192 / 255)
                                )
                            ],
                            chipFamilies: [
                                ChipFamily(name: "Samsung", chips: ["S5L8900"])
                            ],
                            memoryOptions: ["128MB"]
                        ),
                        Device(
                            name: "iPod touch (2nd gen)",
                            displaySizes: ["3.5\""],
                            colors: [
                                ColorModel(
                                    name: "Silver",
                                    color: Color(red: 192 / 255, green: 192 / 255, blue: 192 / 255)
                                )
                            ],
                            chipFamilies: [
                                ChipFamily(name: "Samsung", chips: ["S5L8720"])
                            ],
                            memoryOptions: ["128MB"]
                        ),
                        Device(
                            name: "iPod touch (3rd gen)",
                            displaySizes: ["3.5\""],
                            colors: [
                                ColorModel(
                                    name: "Silver",
                                    color: Color(red: 192 / 255, green: 192 / 255, blue: 192 / 255)
                                )
                            ],
                            chipFamilies: [
                                ChipFamily(name: "Samsung", chips: ["S5L8922"])
                            ],
                            memoryOptions: ["256MB"]
                        ),
                        Device(
                            name: "iPod touch (4th gen)",
                            displaySizes: ["3.5\""],
                            colors: [
                                ColorModel(name: "Black", color: Color(red: 0 / 255, green: 0 / 255, blue: 0 / 255)),
                                ColorModel(
                                    name: "White",
                                    color: Color(red: 255 / 255, green: 255 / 255, blue: 255 / 255)
                                ),
                            ],
                            chipFamilies: [
                                ChipFamily(name: "Apple", chips: ["A4"])
                            ],
                            memoryOptions: ["256MB"]
                        ),
                        Device(
                            name: "iPod touch (5th gen)",
                            displaySizes: ["4.0\""],
                            colors: [
                                ColorModel(
                                    name: "Silver",
                                    color: Color(red: 192 / 255, green: 192 / 255, blue: 192 / 255)
                                ),
                                ColorModel(
                                    name: "Space Gray",
                                    color: Color(red: 105 / 255, green: 105 / 255, blue: 105 / 255)
                                ),
                                ColorModel(
                                    name: "Pink",
                                    color: Color(red: 255 / 255, green: 192 / 255, blue: 203 / 255)
                                ),
                                ColorModel(
                                    name: "Yellow",
                                    color: Color(red: 255 / 255, green: 255 / 255, blue: 0 / 255)
                                ),
                                ColorModel(name: "Blue", color: Color(red: 0 / 255, green: 0 / 255, blue: 255 / 255)),
                                ColorModel(name: "Red", color: Color(red: 255 / 255, green: 0 / 255, blue: 0 / 255)),
                            ],
                            chipFamilies: [
                                ChipFamily(name: "Apple", chips: ["A5"])
                            ],
                            memoryOptions: ["512MB"]
                        ),
                        Device(
                            name: "iPod touch (6th gen)",
                            displaySizes: ["4.0\""],
                            colors: [
                                ColorModel(
                                    name: "Space Gray",
                                    color: Color(red: 105 / 255, green: 105 / 255, blue: 105 / 255)
                                ),
                                ColorModel(name: "Gold", color: Color(red: 255 / 255, green: 215 / 255, blue: 0 / 255)),
                                ColorModel(
                                    name: "Silver",
                                    color: Color(red: 192 / 255, green: 192 / 255, blue: 192 / 255)
                                ),
                                ColorModel(
                                    name: "Pink",
                                    color: Color(red: 255 / 255, green: 192 / 255, blue: 203 / 255)
                                ),
                                ColorModel(name: "Blue", color: Color(red: 0 / 255, green: 0 / 255, blue: 255 / 255)),
                                ColorModel(name: "Red", color: Color(red: 255 / 255, green: 0 / 255, blue: 0 / 255)),
                            ],
                            chipFamilies: [
                                ChipFamily(name: "Apple", chips: ["A8"])
                            ],
                            memoryOptions: ["1GB"]
                        ),
                        Device(
                            name: "iPod touch (7th gen)",
                            displaySizes: ["4.0\""],
                            colors: [
                                ColorModel(
                                    name: "Space Gray",
                                    color: Color(red: 105 / 255, green: 105 / 255, blue: 105 / 255)
                                ),
                                ColorModel(name: "Gold", color: Color(red: 255 / 255, green: 215 / 255, blue: 0 / 255)),
                                ColorModel(
                                    name: "Silver",
                                    color: Color(red: 192 / 255, green: 192 / 255, blue: 192 / 255)
                                ),
                                ColorModel(
                                    name: "Pink",
                                    color: Color(red: 255 / 255, green: 192 / 255, blue: 203 / 255)
                                ),
                                ColorModel(name: "Blue", color: Color(red: 0 / 255, green: 0 / 255, blue: 255 / 255)),
                                ColorModel(name: "Red", color: Color(red: 255 / 255, green: 0 / 255, blue: 0 / 255)),
                            ],
                            chipFamilies: [
                                ChipFamily(name: "Apple", chips: ["A10 Fusion"])
                            ],
                            memoryOptions: ["2GB"]
                        ),
                    ]
                ),
            ],
            operatingSystems: [
                OperatingSystem(
                    name: "iPod touch (1st generation)",
                    releases: [
                        "1.0", "1.1", "1.1.1", "1.1.2", "1.1.3", "1.1.4", "1.1.5", "2.0", "2.0.1", "2.0.2", "2.1",
                        "2.1.1", "2.2", "2.2.1", "3.0", "3.1", "3.1.1", "3.1.2", "3.1.3",
                    ]
                ),
                OperatingSystem(
                    name: "iPod touch (2nd generation)",
                    releases: [
                        "2.1.1", "2.2", "2.2.1", "3.0", "3.1", "3.1.1", "3.1.2", "3.1.3", "4.0", "4.1", "4.2", "4.2.1",
                    ]
                ),
                OperatingSystem(
                    name: "iPod touch (3rd generation)",
                    releases: [
                        "3.1.1", "3.1.2", "3.1.3", "4.0", "4.1", "4.2", "4.2.1", "4.3", "4.3.1", "4.3.2", "4.3.3",
                        "4.3.4", "4.3.5", "5.0", "5.0.1", "5.1", "5.1.1",
                    ]
                ),
                OperatingSystem(
                    name: "iPod touch (4th generation)",
                    releases: [
                        "4.1", "4.2.1", "4.3", "4.3.1", "4.3.2", "4.3.3", "4.3.4", "4.3.5", "5.0", "5.0.1", "5.1",
                        "5.1.1", "6.0", "6.0.1", "6.1", "6.1.1", "6.1.2", "6.1.3", "6.1.4", "6.1.5", "6.1.6",
                    ]
                ),
                OperatingSystem(
                    name: "iPod touch (5th generation)",
                    releases: [
                        "6.0", "6.0.1", "6.1", "6.1.1", "6.1.2", "6.1.3", "6.1.4", "6.1.5", "6.1.6", "7.0", "7.0.1",
                        "7.0.2", "7.0.3", "7.0.4", "7.0.5", "7.0.6", "7.1", "7.1.1", "7.1.2", "8.0", "8.0.1", "8.0.2",
                        "8.1", "8.1.1", "8.1.2", "8.1.3", "8.2", "8.3", "8.4", "8.4.1", "9.0", "9.0.1", "9.0.2", "9.1",
                        "9.2", "9.2.1", "9.3", "9.3.1", "9.3.2", "9.3.3", "9.3.4", "9.3.5", "9.3.6",
                    ]
                ),
                OperatingSystem(
                    name: "iPod touch (6th generation)",
                    releases: [
                        "8.4", "8.4.1", "9.0", "9.0.1", "9.0.2", "9.1", "9.2", "9.2.1", "9.3", "9.3.1", "9.3.2",
                        "9.3.3", "9.3.4", "9.3.5", "9.3.6", "10.0", "10.0.1", "10.0.2", "10.0.3", "10.1", "10.1.1",
                        "10.2", "10.2.1", "10.3", "10.3.1", "10.3.2", "10.3.3", "10.3.4", "11.0", "11.0.1", "11.0.2",
                        "11.0.3", "11.1", "11.1.1", "11.1.2", "11.2", "11.2.1", "11.2.2", "11.2.5", "11.2.6", "11.3",
                        "11.3.1", "11.4", "11.4.1", "12.0", "12.0.1", "12.1", "12.1.1", "12.1.2", "12.1.3", "12.1.4",
                        "12.2", "12.3", "12.3.1", "12.3.2", "12.4", "12.4.1", "12.4.2", "12.4.3", "12.4.4", "12.4.5",
                        "12.4.6", "12.4.7", "12.4.8", "12.5", "12.5.1", "12.5.2", "12.5.3", "12.5.4", "12.5.5",
                        "12.5.6", "12.5.7",
                    ]
                ),
                OperatingSystem(
                    name: "iPod touch (7th generation)",
                    releases: [
                        "12.3.1", "12.4", "12.4.1", "12.4.2", "12.4.3", "12.4.4", "12.4.5", "12.4.6", "12.4.7",
                        "12.4.8", "12.5", "12.5.1", "12.5.2", "12.5.3", "12.5.4", "12.5.5", "12.5.6", "12.5.7", "13.0",
                        "13.1", "13.1.1", "13.1.2", "13.1.3", "13.2", "13.2.1", "13.2.2", "13.2.3", "13.3", "13.3.1",
                        "13.4", "13.4.1", "13.5", "13.5.1", "13.6", "13.6.1", "13.7", "14.0", "14.0.1", "14.1", "14.2",
                        "14.2.1", "14.3", "14.4", "14.4.1", "14.4.2", "14.5", "14.5.1", "14.6", "14.7", "14.7.1",
                        "14.8", "14.8.1", "15.0", "15.0.1", "15.0.2", "15.1", "15.1.1", "15.2", "15.2.1", "15.3",
                        "15.3.1", "15.4", "15.4.1", "15.5", "15.6", "15.6.1", "15.7", "15.7.1", "15.7.2", "15.7.3",
                        "15.7.4", "15.7.5", "15.7.6", "15.7.7", "15.7.8", "15.8", "15.8.1", "15.8.2", "15.8.3",
                        "15.8.4",
                    ]
                ),
            ]
        ),

        // MARK: - HomePod
        Category(
            name: "HomePod",
            symbol: "homepod.and.homepod.mini.fill",
            deviceCategories: [
                // MARK: HomePod
                DeviceCategory(
                    name: "HomePod",
                    devices: [
                        Device(
                            name: "HomePod (1st generation)",
                            displaySizes: [],
                            colors: [
                                ColorModel(
                                    name: "Space Gray",
                                    color: Color(red: 25 / 255, green: 25 / 255, blue: 25 / 255)
                                ),
                                ColorModel(
                                    name: "White",
                                    color: Color(red: 255 / 255, green: 255 / 255, blue: 255 / 255)
                                ),
                            ],
                            chipFamilies: [
                                ChipFamily(name: "Apple", chips: ["A8"])
                            ],
                            memoryOptions: ["1GB"]
                        ),

                        Device(
                            name: "HomePod (2nd generation)",
                            displaySizes: [],
                            colors: [
                                ColorModel(name: "Midnight", color: Color(red: 0 / 255, green: 0 / 255, blue: 0 / 255)),
                                ColorModel(
                                    name: "White",
                                    color: Color(red: 255 / 255, green: 255 / 255, blue: 255 / 255)
                                ),
                            ],
                            chipFamilies: [
                                ChipFamily(name: "Apple", chips: ["S7"])
                            ],
                            memoryOptions: ["1GB"]
                        ),
                    ]
                ),

                // MARK: HomePod Mini
                DeviceCategory(
                    name: "HomePod Mini",
                    devices: [
                        Device(
                            name: "HomePod mini",
                            displaySizes: [],
                            colors: [
                                ColorModel(
                                    name: "Space Gray",
                                    color: Color(red: 25 / 255, green: 25 / 255, blue: 25 / 255)
                                ),
                                ColorModel(
                                    name: "White",
                                    color: Color(red: 255 / 255, green: 255 / 255, blue: 255 / 255)
                                ),
                                ColorModel(
                                    name: "Yellow",
                                    color: Color(red: 252 / 255, green: 228 / 255, blue: 147 / 255)
                                ),
                                ColorModel(
                                    name: "Orange",
                                    color: Color(red: 247 / 255, green: 137 / 255, blue: 67 / 255)
                                ),
                                ColorModel(
                                    name: "Blue",
                                    color: Color(red: 104 / 255, green: 171 / 255, blue: 201 / 255)
                                ),
                                ColorModel(name: "Midnight", color: Color(red: 0 / 255, green: 0 / 255, blue: 0 / 255)),
                            ],
                            chipFamilies: [
                                ChipFamily(name: "Apple", chips: ["S5"])
                            ],
                            memoryOptions: ["1GB"]
                        )
                    ]
                ),
            ],
            operatingSystems: [
                OperatingSystem(
                    name: "HomePod OS 1",
                    releases: ["1.0", "1.0.1", "1.0.2", "1.0.3", "1.0.4", "1.1", "1.1.1"]
                ),
                OperatingSystem(
                    name: "HomePod OS 2",
                    releases: ["2.0", "2.0.1"]
                ),
                OperatingSystem(
                    name: "HomePod OS 11",
                    releases: ["11.2.5", "11.2.6", "11.3", "11.4", "11.4.1"]
                ),
                OperatingSystem(
                    name: "HomePod OS 12",
                    releases: ["12.0", "12.0.1", "12.1", "12.1.1", "12.1.3", "12.1.4", "12.2", "12.3", "12.4"]
                ),
                OperatingSystem(
                    name: "HomePod OS 13",
                    releases: [
                        "13.0", "13.2", "13.2.1", "13.2.2", "13.3", "13.3.1", "13.4", "13.4.1", "13.4.5", "13.4.6",
                        "13.5", "13.6",
                    ]
                ),
                OperatingSystem(
                    name: "HomePod OS 14",
                    releases: ["14.0", "14.1", "14.2", "14.2.1", "14.3", "14.4", "14.5", "14.6", "14.7"]
                ),
                OperatingSystem(
                    name: "HomePod OS 15",
                    releases: [
                        "15.0", "15.0.1", "15.0.2", "15.1", "15.1.1", "15.2", "15.2.1", "15.3", "15.3.1", "15.4",
                        "15.4.1", "15.5", "15.5.1", "15.6", "15.6.1", "15.7",
                    ]
                ),
                OperatingSystem(
                    name: "HomePod OS 16",
                    releases: [
                        "16.0", "16.1", "16.1.1", "16.1.2", "16.2", "16.3", "16.3.1", "16.3.2", "16.4", "16.4.1",
                        "16.5", "16.6", "16.6.1", "16.7", "16.7.1", "16.7.2", "16.7.3", "16.7.4", "16.7.5", "16.7.6",
                        "16.7.7", "16.7.8", "16.7.9", "16.7.10",
                    ]
                ),
                OperatingSystem(
                    name: "HomePod OS 17",
                    releases: [
                        "17.0", "17.0.1", "17.0.2", "17.0.3", "17.1", "17.1.1", "17.1.2", "17.2", "17.2.1", "17.3",
                        "17.3.1", "17.4", "17.4.1", "17.5", "17.5.1", "17.6", "17.6.1", "17.7", "17.7.1", "17.7.2",
                        "17.7.3", "17.7.4", "17.7.5", "17.7.6", "17.7.7", "17.7.8", "17.7.9", "17.7.10",
                    ]
                ),
                OperatingSystem(
                    name: "HomePod OS 18",
                    releases: [
                        "18.0", "18.0.1", "18.1", "18.2", "18.2.1", "18.3", "18.3.1", "18.3.2", "18.4", "18.4.1",
                        "18.5", "18.6", "18.6.1",
                    ]
                ),
                OperatingSystem(
                    name: "HomePod OS 26",
                    releases: ["26.0"]
                ),
            ]
        ),

        // MARK: - Apple Vision
        Category(
            name: "Apple Vision",
            symbol: "vision.pro",
            deviceCategories: [
                // MARK: Vision Pro
                DeviceCategory(
                    name: "Vision Pro",
                    devices: [
                        Device(
                            name: "Apple Vision Pro",
                            displaySizes: ["23 million pixels"],
                            colors: [
                                ColorModel(
                                    name: "Space Gray",
                                    color: Color(red: 25 / 255, green: 25 / 255, blue: 25 / 255)
                                )
                            ],
                            chipFamilies: [
                                ChipFamily(name: "Apple", chips: ["M2", "R1"])
                            ],
                            memoryOptions: ["16GB"]
                        )
                    ]
                )
            ],
            operatingSystems: [
                OperatingSystem(
                    name: "visionOS 1",
                    releases: ["1.0", "1.0.1", "1.0.2", "1.0.3", "1.1", "1.1.1", "1.1.2", "1.2", "1.3"]
                ),
                OperatingSystem(
                    name: "visionOS 2",
                    releases: [
                        "2.0", "2.0.1", "2.1", "2.1.1", "2.2", "2.3", "2.3.1", "2.3.2", "2.4", "2.4.1", "2.5", "2.6",
                    ]
                ),
                OperatingSystem(name: "visionOS 26", releases: ["26.0"]),
            ]
        ),
    ]

    func deviceCategories(in category: String) -> [DeviceCategory] {
        categories.first(where: { $0.name == category })?.deviceCategories ?? []
    }

    func devices(in deviceCategory: String) -> [Device] {
        categories.flatMap(\.deviceCategories).filter { $0.name == deviceCategory }.flatMap(\.devices)
    }

    func deviceData(for selectedDevice: String) -> Device? {
        categories.flatMap(\.deviceCategories).flatMap(\.devices).first(where: { $0.name == selectedDevice })
    }
}
