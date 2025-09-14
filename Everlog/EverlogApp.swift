//
//  EverlogApp.swift
//  Everlog
//
//  Created by Radoslav Bley on 10/09/2025.
//

import SwiftUI
import SwiftData

@main
struct EverlogApp: App {
    @StateObject private var navModel = NavigationModel()
    
    var body: some Scene {
        WindowGroup {
            CollectionsListView()
        }
        .environmentObject(navModel)
        .modelContainer(for: StoredDeviceModel.self)
    }
}
