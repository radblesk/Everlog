//
//  Everlog_for_watchOSApp.swift
//  Everlog for watchOS Watch App
//
//  Created by Radoslav Bley on 14/09/2025.
//

import SwiftData
import SwiftUI

@main
struct Everlog_for_watchOS_Watch_AppApp: App {
    @StateObject private var navModel = NavigationModel()

    var body: some Scene {
        WindowGroup {
            CollectionsListView()
        }
        .environmentObject(navModel)
        .modelContainer(for: StoredDeviceModel.self)
    }
}
