//
//  Device.swift
//  Everlog
//
//  Created by Radoslav Bley on 10/09/2025.
//

import Foundation
import SwiftData

@Model
class StoredDeviceModel {
    // Basic Info
    var category: String = ""
    var model: String = ""
    var releaseDate: Date = Date.now
    var osVersion: String = ""
    var serialNumber: String = ""
    var currentCondition: String = ""
    var comments: String = ""

    var macName: String {
        if !displaySize.isEmpty {
            return "\(model) \(displaySize)"
        }

        return model
    }

    var symbol: String {
        switch model {
        case let mb where mb.contains("MacBook"): return "macbook"
        case "iMac": return "desktopcomputer"
        case "Mac mini": return "macmini"
        case "Mac Studio": return "macstudio"
        case "Mac Pro": return "macpro.gen3"
        case let ip where ip.contains("iPhone"): return "iphone"
        case let ipad where ipad.contains("iPad"): return "ipad"
        case let watch where watch.contains("Watch"): return "applewatch"
        case let apm where apm.contains("AirPods Max"): return "airpodsmax"
        case let app where app.contains("AirPods Pro"): return "airpodspro"
        case let ap where ap.contains("AirPods"): return "airpods"
        case let tv where tv.contains("Apple TV"): return "appletv.fill"
        case let ipod where ipod.contains("iPod"): return "ipod"
        case "HomePod mini": return "homepod.mini"
        case let homepod where homepod.contains("HomePod"): return "homepod"
        case let vision where vision.contains("Apple Vision"): return "vision.pro"
        default: return "desktopcomputer.and.macbook"
        }
    }

    // Hardware Configuration
    var color: String = ""
    var chip: String = ""
    var memory: String = ""
    var storage: String = ""
    var displaySize: String = ""

    // Purchase
    var purchasedCondition: String = ""
    var purchasedFrom: String = ""
    var purchaseDate: Date = Date.distantPast
    var purchasePrice: Double = 0.0
    var ownedFor: DateComponents {
        if sold {
            return Calendar.current.dateComponents([.day], from: purchaseDate, to: soldDate)
        }

        return Calendar.current.dateComponents([.day], from: purchaseDate, to: Date.now)
    }

    // Trade-in
    var tradedIn: Bool = false
    var tradedInDevice: String = ""
    var tradedInPrice: Double = 0.0
    var totalCost: Double {
        if tradedIn {
            return purchasePrice - tradedInPrice
        }

        return purchasePrice
    }

    // Warranty
    var warranty: String {
        if warrantyPeriod < Date.now {
            return "Expired"
        }

        if appleCare {
            return "AppleCare+"
        }

        if warrantyExtended {
            return "Extended Warranty"
        }

        return "Limited Warranty"
    }
    var warrantyPeriod: Date {
        if appleCare {
            return Calendar.current.date(byAdding: .day, value: (365 * appleCarePeriod) - 1, to: purchaseDate)!
        }

        if warrantyExtended {
            return Calendar.current.date(byAdding: .day, value: (365 * warrantyExtendedPeriod) - 1, to: purchaseDate)!
        }

        return Calendar.current.date(byAdding: .day, value: 365 - 1, to: purchaseDate)!
    }
    var warrantyExtended: Bool = false
    var warrantyExtendedPeriod: Int = 2
    var appleCare: Bool = false
    var appleCarePeriod: Int = 2

    // Sold
    var sold: Bool = false
    var soldDate: Date = Date.now
    var soldPrice: Double = 0.0
    var soldReason: String = ""

    init(
        category: String,
        model: String,
        releaseDate: Date,
        osVersion: String,
        serialNumber: String,
        currentCondition: String,
        comments: String,
        color: String,
        chip: String,
        memory: String,
        storage: String,
        displaySize: String,
        purchasedCondition: String,
        purchasedFrom: String,
        purchaseDate: Date,
        purchasePrice: Double,
        tradedIn: Bool,
        tradedInDevice: String,
        tradedInPrice: Double,
        warrantyExtended: Bool,
        warrantyExtendedPeriod: Int,
        appleCare: Bool,
        appleCarePeriod: Int,
        sold: Bool,
        soldDate: Date,
        soldPrice: Double,
        soldReason: String
    ) {
        self.category = category
        self.model = model
        self.releaseDate = releaseDate
        self.osVersion = osVersion
        self.serialNumber = serialNumber
        self.currentCondition = currentCondition
        self.comments = comments
        self.color = color
        self.chip = chip
        self.memory = memory
        self.storage = storage
        self.displaySize = displaySize
        self.purchasedCondition = purchasedCondition
        self.purchasedFrom = purchasedFrom
        self.purchaseDate = purchaseDate
        self.purchasePrice = purchasePrice
        self.tradedIn = tradedIn
        self.tradedInDevice = tradedInDevice
        self.tradedInPrice = tradedInPrice
        self.warrantyExtended = warrantyExtended
        self.warrantyExtendedPeriod = warrantyExtendedPeriod
        self.appleCare = appleCare
        self.appleCarePeriod = appleCarePeriod
        self.sold = sold
        self.soldDate = soldDate
        self.soldPrice = soldPrice
        self.soldReason = soldReason
    }
}
