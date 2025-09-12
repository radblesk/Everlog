//
//  ContentView.swift
//  Everlog
//
//  Created by Radoslav Bley on 10/09/2025.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    enum DeviceType: String, CaseIterable {
        case mac = "Mac"
        case iphone = "iPhone"
        case ipad = "iPad"
        case watch = "Apple Watch"
        case airpods = "AirPods"
        case tv = "Apple TV"
        case ipod = "iPod"
        case homepod = "HomePod"
        case vision = "Apple Vision"
        
        var deviceSymbol: String {
            switch self {
            case .airpods: "airpodspro.chargingcase.wireless.fill"
            case .homepod: "homepod.fill"
            case .ipad: "ipad"
            case .iphone: "iphone"
            case .ipod: "ipod"
            case .mac: "macbook"
            case .tv: "appletv.fill"
            case .vision: "vision.pro"
            case .watch: "applewatch"
            }
        }
    }

    @State private var selectedDeviceType: DeviceType?

    var body: some View {
        NavigationSplitView {
            List(selection: $selectedDeviceType) {
                Section("Products") {
                    ForEach(DeviceType.allCases, id: \.rawValue) { deviceType in
                        NavigationLink(
                            value: deviceType,
                            label: {
                                Label(deviceType.rawValue, systemImage: deviceType.deviceSymbol)
                            }
                        )
                    }
                }
            }
            .navigationTitle("Collection")
        } detail: {
            NavigationStack {
                switch selectedDeviceType {
                case .mac:
                    MacsView()
                //            case .iphone:
                //                <#code#>
                //            case .ipad:
                //                <#code#>
                //            case .watch:
                //                <#code#>
                //            case .airpods:
                //                <#code#>
                //            case .tv:
                //                <#code#>
                //            case .ipod:
                //                <#code#>
                //            case .homepod:
                //                <#code#>
                //            case .vision:
                //                <#code#>
                default:
                    ContentUnavailableView("Unfinished view", systemImage: "swift")
                }
            }
        }
        .navigationSplitViewStyle(.balanced)
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Mac.self)
}
