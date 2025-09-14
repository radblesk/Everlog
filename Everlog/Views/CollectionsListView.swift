//
//  CollectionsListView.swift
//  Everlog
//
//  Created by Radoslav Bley on 13/09/2025.
//

import SwiftData
import SwiftUI

struct CollectionsListView: View {
    @StateObject private var navModel = NavigationModel()
    @Environment(\.scenePhase) private var scenePhase
    @State private var searchText: String = ""
    @Query var devices: [StoredDeviceModel]
    @State private var addingDevice: Bool = false
    @State var selection: String? {
        didSet {
            if let selection {
                print(selection)
            }
        }
    }

    enum DeviceType: String, CaseIterable, Codable {
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

    var body: some View {
        NavigationStack(path: $navModel.path) {
            if searchText.isEmpty {
                List(selection: $selection) {
                    Section("Products") {
                        ForEach(DeviceType.allCases, id: \.rawValue) { deviceType in
                            NavigationLink(
                                value: deviceType,
                                label: {
                                    Label(deviceType.rawValue, systemImage: deviceType.deviceSymbol)
                                        .badge(deviceCount(deviceType))
                                }
                            )
                        }
                    }
                }
                .toolbar {
                    DefaultToolbarItem(kind: .search, placement: .bottomBar)
                    ToolbarSpacer(.flexible, placement: .bottomBar)
                    ToolbarItem(placement: .bottomBar) {
                        Button("Add device", systemImage: "plus") {
                            addingDevice.toggle()
                        }
                        .buttonStyle(.glassProminent)
                    }
                }
                .navigationTitle("Collection")
                .navigationDestination(for: DeviceType.self) { deviceType in
                    DevicesView(addingDevice: $addingDevice, category: deviceType.rawValue, contains: searchText)
                        .modelContainer(for: StoredDeviceModel.self)
                        .toolbar {
                            DefaultToolbarItem(kind: .search, placement: .bottomBar)
                            ToolbarSpacer(.flexible, placement: .bottomBar)
                            ToolbarItem(placement: .bottomBar) {
                                Button("Add device", systemImage: "plus") {
                                    addingDevice.toggle()
                                }
                                .buttonStyle(.glassProminent)
                            }
                        }
                        .environmentObject(navModel)
                        .onDisappear {
                            selection = ""
                        }
                }
                .navigationDestination(for: StoredDeviceModel.self) { device in
                    DeviceDetailView(device: device)
                }
            } else {
                DevicesView(addingDevice: $addingDevice, category: "", contains: searchText)
                    .toolbar {
                        DefaultToolbarItem(kind: .search, placement: .bottomBar)
                        ToolbarSpacer(.flexible, placement: .bottomBar)
                        ToolbarItem(placement: .bottomBar) {
                            Button("Add device", systemImage: "plus") {
                                addingDevice.toggle()
                            }
                            .buttonStyle(.glassProminent)
                        }
                    }
            }
        }
        .searchable(text: $searchText)
        .sheet(
            isPresented: $addingDevice,
            content: {
                NavigationStack {
                    AddDeviceView(selection: selection)
                        .environmentObject(navModel)
                }
            }
        )
        .onChange(of: scenePhase) {
            navModel.save()
        }
    }

    func deviceCount(_ type: DeviceType) -> Int {
        switch type {
        case .mac: return devices.count(where: { $0.category == "Mac" })
        case .iphone: return devices.count(where: { $0.category == "iPhone" })
        case .ipad: return devices.count(where: { $0.category == "iPad" })
        case .watch: return devices.count(where: { $0.category == "Apple Watch" })
        case .airpods: return devices.count(where: { $0.category == "AirPods" })
        case .tv: return devices.count(where: { $0.category == "Apple TV" })
        case .ipod: return devices.count(where: { $0.category == "iPod" })
        case .homepod: return devices.count(where: { $0.category == "HomePod" })
        case .vision: return devices.count(where: { $0.category == "Apple Vision" })
        }
    }
}

#Preview {
    //    NavigationStack {
    CollectionsListView()
        .modelContainer(for: StoredDeviceModel.self)
    //    }
}
