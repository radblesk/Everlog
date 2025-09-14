//
//  DevicesView.swift
//  Everlog
//
//  Created by Radoslav Bley on 11/09/2025.
//

import SwiftData
import SwiftUI

struct DevicesView: View {
    @Environment(\.modelContext) var modelContext
    @EnvironmentObject var navModel: NavigationModel
    @Query private var devices: [StoredDeviceModel]
    @Binding var addingDevice: Bool
    var category: String
    var contains: String

    var body: some View {
        if !devices.isEmpty {
            List {
                ForEach(Array(Set(devices.compactMap(\.model))).sorted(), id: \.self) { model in
                    Section(model) {
                        ForEach(devices.filter { $0.model == model }) { mac in
                            NavigationLink(value: mac) {
                                DeviceCard(query: contains, device: mac)
                            }
                        }
                        .onDelete(perform: deleteMac)
                    }
                }
            }
            .scrollDismissesKeyboard(.immediately)
            .navigationTitle("\(category) Collection")
            .navigationDestination(for: StoredDeviceModel.self) { device in
                DeviceDetailView(device: device)
            }
        } else {
            if contains.isEmpty {
                ContentUnavailableView {
                    Button {
                        addingDevice.toggle()
                    } label: {
                        Label("No \(inflection(of: category))", systemImage: categorySymbol())
                    }
                } description: {
                    Text("Tap to add \(category) to your collection")
                }
            } else {
                ContentUnavailableView("No results for \"\(contains)\"", systemImage: "magnifyingglass", description: Text("Check for typos or try a different search"))
            }
        }
    }

    func deleteMac(at offsets: IndexSet) {
        for offset in offsets {
            let mac = devices[offset]
            modelContext.delete(mac)
        }
    }

    func categorySymbol() -> String {
        switch category {
        case "Mac": return "desktopcomputer.and.macbook"
        case "iPhone": return "iphone"
        case "iPad": return "ipad"
        case "Apple Watch": return "applewatch"
        case "AirPods": return "airpodspro"
        case "Apple TV": return "appletv"
        case "iPod": return "ipod"
        case "HomePod": return "homepod.and.homepod.mini.badge.plus"
        case "Apple Vision": return "vision.pro"
        default: return "questionmark"
        }
    }

    func inflection(of string: String) -> String {
        if string.hasSuffix("h") {
            return string + "es"
        } else if string.hasSuffix("s") {
            return string
        } else if string.isEmpty {
            return string
        } else {
            return string + "s"
        }
    }

    init(addingDevice: Binding<Bool>, category: String, contains: String) {
        if contains.isEmpty {
            _devices = Query(
                filter: #Predicate<StoredDeviceModel> { device in device.category == category
                },
                sort: [
                    SortDescriptor(\.purchaseDate, order: .reverse),
                    SortDescriptor(\.model),
                    SortDescriptor(\.releaseDate),
                ]
            )
        } else {
            _devices = Query(
                filter: #Predicate<StoredDeviceModel> { device in
                    device.model.localizedStandardContains(contains)
                        || device.comments.localizedStandardContains(contains)
                },
                sort: [
                    SortDescriptor(\.purchaseDate, order: .reverse),
                    SortDescriptor(\.model),
                    SortDescriptor(\.releaseDate),
                ]
            )
        }

        _addingDevice = addingDevice
        self.category = category
        self.contains = contains
    }
}

#Preview {
    @Previewable @StateObject var navModel = NavigationModel()
    NavigationStack {
        DevicesView(addingDevice: .constant(true), category: "Mac", contains: "")
            .modelContainer(for: StoredDeviceModel.self)
            .environmentObject(navModel)
    }
}
