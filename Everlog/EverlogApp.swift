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
    @AppStorage("preferredScheme") private var preferredScheme: String = "system"
    @AppStorage("accentColorHex") private var accentColorHex: String = "007AFF"
    
    var body: some Scene {
        WindowGroup {
            CollectionsListView()
                .preferredColorScheme(preferredScheme == "dark" ? .dark : preferredScheme == "light" ? .light : nil)
                .tint(Color(hex: accentColorHex) ?? Color.accentColor)
        }
        .environmentObject(navModel)
        .modelContainer(for: StoredDeviceModel.self)
    }
}
