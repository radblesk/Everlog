//
//  DeviceType.swift
//  Everlog
//
//  Created by Radoslav Bley on 14/09/2025.
//

import SwiftUI

enum NavigationOptions: Equatable, Hashable, Identifiable, Codable {
    case mac
    case iphone
    case ipad
    case watch
    case airpods
    case tv
    case ipod
    case homepod
    case vision

    static let mainPages: [NavigationOptions] = [.mac, .iphone, .ipad, .watch, .airpods, .tv, .ipod, .homepod, .vision]

    var id: String {
        switch self {
        case .mac: return "Mac"
        case .iphone: return "iPhone"
        case .ipad: return "iPad"
        case .watch: return "Watch"
        case .airpods: return "AirPods"
        case .tv: return "TV"
        case .ipod: return "iPod"
        case .homepod: return "HomePod"
        case .vision: return "Vision"
        }
    }

    var name: String {
        switch self {
        case .mac: "Mac"
        case .iphone: "iPhone"
        case .ipad: "iPad"
        case .watch: "Apple Watch"
        case .airpods: "AirPods"
        case .tv: "Apple TV"
        case .ipod: "iPod"
        case .homepod: "HomePod"
        case .vision: "Apple Vision"
        }
    }

    var deviceSymbol: String {
        switch self {
        case .mac: "macbook"
        case .iphone: "iphone"
        case .ipad: "ipad"
        case .watch: "applewatch"
        case .airpods: "airpodspro.chargingcase.wireless.fill"
        case .tv: "appletv.fill"
        case .ipod: "ipod"
        case .homepod: "homepod.fill"
        case .vision: "vision.pro"
        }
    }

    var sortOrder: [SortDescriptor<StoredDeviceModel>] {
        switch self {
        default: [SortDescriptor(\.purchaseDate, order: .reverse)]
        }
    }

    var filter: Predicate<StoredDeviceModel> {
        let categoryName = self.name
        return #Predicate<StoredDeviceModel> { device in
            device.category == categoryName
        }
    }

    @MainActor @ViewBuilder func viewForPage() -> some View {
        switch self {
        default:
            DevicesView(sortOrder: sortOrder, filter: filter, currentView: self.name, currentSymbol: self.deviceSymbol)
        }
    }
}
