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
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [Mac.self])
    }
}
