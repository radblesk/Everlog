//
//  Device.swift
//  Everlog
//
//  Created by Radoslav Bley on 10/09/2025.
//

import Foundation
import SwiftData

@Model
class Mac {
    // Basic Info
    var model: String = ""
    var comments: String = ""

    // Condition
    var currentCondition: String = "Perfect"
    var damagedParts: [String]? = []

    // Dates
    var releaseDate: Date = Date.now

    // Configuration
    var color: String = "Silver"
    var processor: String = "M1"
    var memory: String = "8 GB"
    var storage: String = "256 GB"
    var displaySize: String = "14″"

    // Software
    var macOSVersion: String = "15.0"
    //    var macOSVersionName: String {
    //        if macOSVersion == 26.0.distance(to: 26.9) {
    //            return "Tahoe"
    //        } else if macOSVersion == 15.0.distance(to: 15.9) {
    //            return "Sequoia"
    //        } else if macOSVersion == 14.0.distance(to: 14.9) {
    //            return "Sonoma"
    //        }
    //
    //        return "Unknown"
    //    }

    // Hardware
    var serialNumber: String = ""

    // Purchase
    var purchaseDate: Date = Date.distantPast
    var purchasePrice: Double = 0.0
    var purchasedFrom: String = ""
    var purchasedCondition: String = "New"
    var warranty: String = ""
    var warrantyDate: Date {
        if warrantyExtended {
            return Calendar.current.date(byAdding: .day, value: 729, to: purchaseDate)!
        }

        return Calendar.current.date(byAdding: .day, value: 364, to: purchaseDate)!
    }
    var warrantyExtended: Bool = false
    var warrantyExtendedDate: Date? = nil
    var appleCare: Bool = false
    var sold: Bool = false
    var soldDate: Date? = nil
    var soldPrice: Double? = nil
    var soldReason: String? = nil
    var ownedFor: DateComponents {
        return Calendar.current.dateComponents([.day], from: purchaseDate, to: Date.now)
    }

    init(
        model: String,
        comments: String,
        currentCondition: String,
        damagedParts: [String]? = nil,
        releaseDate: Date,
        color: String,
        processor: String,
        memory: String,
        storage: String,
        displaySize: String,
        macOSVersion: String,
        serialNumber: String,
        purchaseDate: Date,
        purchasePrice: Double,
        purchasedCondition: String,
        warranty: String,
        warrantyExtended: Bool,
        warrantyExtendedDate: Date? = nil,
        appleCare: Bool,
        sold: Bool,
        soldDate: Date? = nil,
        soldPrice: Double? = nil,
        soldReason: String? = nil
    ) {
        self.model = model
        self.comments = comments
        self.currentCondition = currentCondition
        self.damagedParts = damagedParts
        self.releaseDate = releaseDate
        self.color = color
        self.processor = processor
        self.memory = memory
        self.storage = storage
        self.displaySize = displaySize
        self.macOSVersion = macOSVersion
        self.serialNumber = serialNumber
        self.purchaseDate = purchaseDate
        self.purchasePrice = purchasePrice
        self.purchasedCondition = purchasedCondition
        self.warranty = warranty
        self.warrantyExtended = warrantyExtended
        self.warrantyExtendedDate = warrantyExtendedDate
        self.appleCare = appleCare
        self.sold = sold
        self.soldDate = soldDate
        self.soldPrice = soldPrice
        self.soldReason = soldReason
    }
}
