//
//  EditDeviceView.swift
//  Everlog
//
//  Created by Radoslav Bley on 13/09/2025.
//

import SwiftData
import SwiftUI

struct EditDeviceView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var navModel: NavigationModel

    let data = DevicesData()
    @Bindable var editedDevice: StoredDeviceModel

    /// Base Category Selector
    @State private var category: String = ""

    @State private var acquiredDate: Date = .now
    @State private var purchasedFrom: String = ""
    @State private var purchaseCondition: String = ""
    @State private var price: Double = 0.0
    @State private var tradedIn: Bool = false
    @State private var tradedInDevice: String = ""
    @State private var tradedInPrice: Double = 0.0
    @State private var extendedWarranty: Bool = false
    @State private var extendedWarrantyPeriod: Int = 2
    @State private var appleCare: Bool = false
    @State private var appleCarePeriod: Int = 1

    @State private var model: String = ""
    @State private var releaseDate: Date = .now
    @State private var osVersion: String = ""
    @State private var serialNumber: String = ""
    @State private var currentCondition: String = ""

    @State private var displaySize: String = ""
    @State private var color: String = ""
    @State private var chip: String = ""
    @State private var memory: String = ""
    @State private var storage: String = ""

    var body: some View {
        Form {
            if let device = data.deviceData(for: editedDevice.model) {
                Section(header: Text("Device Details")) {
                    DatePicker("Release Date", selection: $editedDevice.releaseDate, displayedComponents: .date)

                    TextField("\(determineOS()) version", text: $editedDevice.osVersion)
                        #if os(iOS)
                            .keyboardType(.numbersAndPunctuation)
                        #endif

                    TextField("Serial Number", text: $editedDevice.serialNumber)

                    Picker("Condition", selection: $editedDevice.currentCondition) {
                        ForEach(Device.currentCondition, id: \.self) { option in
                            Text(option)
                                .tag(option)
                        }
                    }
                    .tint(.secondary)

                    TextField("Comment", text: $editedDevice.comments, axis: .vertical)
                }

                Section(
                    header: HStack {
                        Text("Hardware Configuration")
                        Spacer()
                        Circle()
                            .fill(device.colors.first(where: { $0.name == editedDevice.color })?.color ?? Color.primary)
                            .frame(width: 20)
                            .overlay {
                                Circle().stroke(.secondary, lineWidth: 1)
                            }
                    }
                ) {
                    if let sizes = device.displaySizes {
                        Picker("Display Size", selection: $editedDevice.displaySize) {
                            ForEach(sizes, id: \.self) {
                                Text($0)
                            }
                        }
                    }

                    Picker("Color", selection: $editedDevice.color) {
                        ForEach(device.colors) {
                            Text($0.name)
                                .tag($0.name)
                        }
                    }

                    Picker("Chip", selection: $editedDevice.chip) {
                        ForEach(device.chipFamilies) { family in
                            Section(family.name) {
                                ForEach(family.chips, id: \.self) { chip in
                                    Text(chip)
                                }
                            }
                        }
                    }

                    if let options = device.memoryOptions {
                        Picker("Memory", selection: $editedDevice.memory) {
                            ForEach(options, id: \.self) { option in
                                Text(option)
                                    .tag(option)
                            }
                        }
                    }

                    HStack {
                        Text("Storage")
                        Spacer()
                        TextField("256GB", text: $editedDevice.storage)
                            .multilineTextAlignment(.trailing)
                    }
                }
                .tint(.secondary)

                Section(
                    header: Text("Purchase Details")
                ) {
                    DatePicker("Purchased", selection: $editedDevice.purchaseDate, displayedComponents: .date)

                    TextField("Store", text: $editedDevice.purchasedFrom)

                    Picker("Condition", selection: $editedDevice.purchasedCondition) {
                        ForEach(device.purchaseCondition, id: \.self) {
                            Text($0)
                        }
                    }
                    .tint(.secondary)

                    HStack {
                        Text("Price")
                        Spacer()
                        TextField(
                            "Price",
                            value: $editedDevice.purchasePrice,
                            format: .currency(code: Locale.current.currency?.identifier ?? "EUR")
                        )
                        .multilineTextAlignment(.trailing)
                    }
                }

                Section(
                    header: Text("AppleCare & Warranty"),
                    footer: Text(
                        "If you opted for Extended Warranty or AppleCare upon purchase, please complete this section. Should you decide to do so later, you will have the flexibility to modify this information accordingly."
                    )
                ) {
                    Toggle("Extended Warranty", isOn: $editedDevice.warrantyExtended)
                        .onChange(of: editedDevice.warrantyExtended) { oldValue, newValue in
                            if newValue {
                                editedDevice.appleCare = false
                            }
                        }
                    if editedDevice.warrantyExtended {
                        Stepper(
                            "Extended period: ^[\(editedDevice.warrantyExtendedPeriod) year](inflect: true)",
                            value: $editedDevice.warrantyExtendedPeriod,
                            in: 2...3
                        )
                    }

                    Toggle("AppleCare+", isOn: $editedDevice.appleCare)
                        .onChange(of: editedDevice.appleCare) { oldValue, newValue in
                            if newValue {
                                editedDevice.warrantyExtended = false
                            }
                        }
                    if editedDevice.appleCare {
                        Stepper(
                            "AppleCare period: ^[\(editedDevice.appleCarePeriod) year](inflect: true)",
                            value: $appleCarePeriod,
                            in: 1...5
                        )
                    }
                }

                Section(
                    header: Text("Trade In"),
                    footer: Text(
                        "If you have traded in a device when purchasing this one, please complete this section. The price of the new device will be automatically reduced by the price of the traded-in device upon saving."
                    )
                ) {
                    Toggle("Trade In", isOn: $editedDevice.tradedIn)

                    if editedDevice.tradedIn {
                        HStack {
                            Text("Device")
                            Spacer()
                            TextField("iPhone 13", text: $editedDevice.tradedInDevice)
                                .multilineTextAlignment(.trailing)
                        }

                        HStack {
                            Text("Price")
                            Spacer()
                            TextField(
                                "350",
                                value: $editedDevice.tradedInPrice,
                                format: .currency(code: Locale.current.currency?.identifier ?? "EUR")
                            )
                            .multilineTextAlignment(.trailing)
                        }

                    }
                }
            }
        }
        .scrollContentBackground(.hidden)
        .navigationTitle("Edit Device")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            category = editedDevice.category
        }
        .toolbar {
            Button("Save", action: saveDevice)
                .tint(.primary)
        }
    }

    func determineOS() -> String {
        switch editedDevice.category {
        case "Mac": return "macOS"
        case "iPhone": return "iOS"
        case "iPad": return "iPadOS"
        case "Apple Watch": return "watchOS"
        case "AirPods": return "AirPods Firmware"
        case "Apple TV": return "tvOS"
        case "iPod": return "iOS"
        case "HomePod": return "HomePodOS"
        case "Apple Vision": return "VisionOS"
        default: return "OS"
        }
    }

    func saveDevice() {
        try? modelContext.save()
        dismiss()
    }
}

#Preview {
    EditDeviceView(editedDevice: DevicesData.example)
        .modelContainer(for: StoredDeviceModel.self)
}
