//
//  AddDeviceView.swift
//  Everlog
//
//  Created by Radoslav Bley on 13/09/2025.
//

import SwiftData
import SwiftUI

struct AddDeviceView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var navModel: NavigationModel
    let data = DevicesData()
    let currentCategory: String?

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
    @State private var comment: String = ""

    @State private var displaySize: String = ""
    @State private var color: String = ""
    @State private var chip: String = ""
    @State private var memory: String = ""
    @State private var storage: String = ""

    var body: some View {
        let operatingSystems = data.categories.first(where: { $0.name == category })?.operatingSystems.reversed() ?? []
        let releases = operatingSystems.flatMap(\.releases)
        NavigationStack {
            Form {
                Section {
                    Picker("Collection", selection: $category) {
                        ForEach(data.categories) { category in
                            Label(category.name, systemImage: category.symbol)
                                .tag(category.name)
                        }
                    }
                    .onChange(of: category) {
                        model = data.deviceCategories(in: category).flatMap(\.devices).last?.name ?? ""
                    }
                    
                    Picker("Model", selection: $model) {
                        ForEach(data.deviceCategories(in: category)) { category in
                            Section(category.name) {
                                ForEach(data.devices(in: category.name)) { device in
                                    Text(device.name)
                                        .tag(device.name)
                                }
                            }
                        }
                    }
                    .onChange(of: model) {
                        if let device = data.deviceData(for: model) {
                            /// Reset purchase details
                            acquiredDate = .now
                            purchasedFrom = ""
                            purchaseCondition = device.purchaseCondition[0]
                            price = 0.0
                            extendedWarranty = false
                            appleCare = false
                            
                            /// Reset device details
                            if let date = device.releaseDate {
                                releaseDate = date
                            } else {
                                releaseDate = .now
                            }
                            osVersion = !releases.isEmpty ? releases[0] : "Unknown"
                            serialNumber = ""
                            
                            /// Set default values for hardware config of selected device
                            displaySize = device.displaySizes?.first ?? ""
                            color = device.colors[0].name
                            chip = device.chipFamilies.flatMap(\.chips).last ?? ""
                            memory = device.memoryOptions?[0] ?? "N/A"
                        }
                        // set values
                    }
                }
                
                if let device = data.deviceData(for: model) {
                    Section(header: Text("Device Details")) {
                        DatePicker("Release Date", selection: $releaseDate, in: ...Date.now, displayedComponents: .date)
                        
                        //                    TextField("\(determineOS()) version", text: $osVersion)
                        Picker("\(determineOS()) version", selection: $osVersion) {
                            ForEach(operatingSystems) { system in
                                Section(system.name) {
                                    if !system.releases.isEmpty {
                                        ForEach(
                                            system.releases.sorted { $0 > $1 },
                                            id: \.self
                                        ) { system in
                                            Text(system)
                                        }
                                    } else {
                                        Text("No versions available")
                                    }
                                }
                            }
                        }
                        
                        TextField("Serial Number", text: $serialNumber)
                        
                        TextField("Comment (optional)", text: $comment, axis: .vertical)
                    }
                    
                    Section(
                        header: HStack {
                            Text("Hardware Configuration")
                            Spacer()
                            Circle()
                                .fill(device.colors.first(where: { $0.name == color })?.color ?? Color.primary)
                                .frame(width: 20)
                                .overlay {
                                    Circle().stroke(.secondary, lineWidth: 1)
                                }
                        }
                    ) {
                        if let sizes = device.displaySizes, !sizes.isEmpty {
                            Picker("Display Size", selection: $displaySize) {
                                ForEach(sizes, id: \.self) {
                                    Text($0)
                                }
                            }
                            .disabled(sizes.count < 2)
                        }
                        
                        Picker("Color", selection: $color) {
                            ForEach(device.colors) {
                                Text($0.name)
                                    .tag($0.name)
                            }
                        }
                        .disabled(device.colors.count < 2)
                        
                        Picker("Chip", selection: $chip) {
                            ForEach(device.chipFamilies) { family in
                                Section(family.name) {
                                    ForEach(family.chips, id: \.self) { chip in
                                        Text(chip)
                                    }
                                }
                            }
                        }
                        .disabled(device.chipFamilies.flatMap(\.chips).count < 2)
                        
                        if let options = device.memoryOptions, !options[0].isEmpty {
                            Picker("Memory", selection: $memory) {
                                ForEach(options, id: \.self) { option in
                                    Text(option)
                                        .tag(option)
                                }
                            }
                            .disabled(options.count < 2)
                        }
                        
                        if !device.name.contains("AirPods") {
                            HStack {
                                Text("Storage")
                                Spacer()
                                TextField("256GB", text: $storage)
                                    .multilineTextAlignment(.trailing)
                            }
                        }
                    }
                    
                    Section(
                        header: Text("Purchase Details")
                    ) {
                        DatePicker("Purchased", selection: $acquiredDate, in: ...Date.now, displayedComponents: .date)
                        TextField("Store", text: $purchasedFrom)
                        Picker("Condition", selection: $purchaseCondition) {
                            ForEach(device.purchaseCondition, id: \.self) {
                                Text($0)
                            }
                        }
                        HStack {
                            Text("Price")
                            Spacer()
                            TextField(
                                "Price",
                                value: $price,
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
                        Toggle("Extended Warranty", isOn: $extendedWarranty)
                            .onChange(of: extendedWarranty) { oldValue, newValue in
                                if newValue {
                                    appleCare = false
                                }
                            }
                        if extendedWarranty {
                            Stepper(
                                "Extended period: ^[\(extendedWarrantyPeriod) year](inflect: true)",
                                value: $extendedWarrantyPeriod,
                                in: 2...3
                            )
                        }
                        
                        Toggle("AppleCare+", isOn: $appleCare)
                            .onChange(of: appleCare) { oldValue, newValue in
                                if newValue {
                                    extendedWarranty = false
                                }
                            }
                        if appleCare {
                            Stepper(
                                "AppleCare period: ^[\(appleCarePeriod) year](inflect: true)",
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
                        Toggle("Trade In", isOn: $tradedIn)
                        
                        if tradedIn {
                            HStack {
                                Text("Device")
                                Spacer()
                                TextField("iPhone 13", text: $tradedInDevice)
                                    .multilineTextAlignment(.trailing)
                            }
                            
                            HStack {
                                Text("Price")
                                Spacer()
                                TextField(
                                    "350",
                                    value: $tradedInPrice,
                                    format: .currency(code: Locale.current.currency?.identifier ?? "EUR")
                                )
                                .multilineTextAlignment(.trailing)
                            }
                            
                        }
                    }
                }
            }
            .scrollDismissesKeyboard(.immediately)
            .navigationTitle("Add Device")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                if let currentCategory, !currentCategory.isEmpty {
                    category = currentCategory
                } else {
                    category = data.categories.first?.name ?? ""
                }
            }
            .toolbar {
                Button("Save", action: saveDevice)
            }
        }
    }

    func determineOS() -> String {
        switch category {
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
        let newDevice = StoredDeviceModel(
            category: category,
            model: model,
            releaseDate: releaseDate,
            osVersion: osVersion,
            serialNumber: serialNumber.uppercased().replacingOccurrences(of: " ", with: "").trimmingCharacters(
                in: .whitespacesAndNewlines
            ),
            currentCondition: "Perfect",
            comments: comment,
            lastModified: .now,
            color: color,
            chip: chip,
            memory: memory,
            storage: storage.uppercased().replacingOccurrences(of: " ", with: "").trimmingCharacters(
                in: .whitespacesAndNewlines
            ),
            displaySize: displaySize,
            purchasedCondition: purchaseCondition,
            purchasedFrom: purchasedFrom,
            purchaseDate: acquiredDate,
            purchasePrice: price,
            tradedIn: tradedIn,
            tradedInDevice: tradedInDevice,
            tradedInPrice: tradedInPrice,
            warrantyExtended: extendedWarranty,
            warrantyExtendedPeriod: extendedWarrantyPeriod,
            appleCare: appleCare,
            appleCarePeriod: appleCarePeriod,
            sold: false,
            soldDate: .now,
            soldPrice: 0.0,
            soldReason: ""
        )

        do {
            modelContext.insert(newDevice)
            try modelContext.save()
            Task {
                navModel.path.append(newDevice)
            }
            dismiss()
        } catch {
            print(error.localizedDescription)
        }
    }
}

#Preview {
    NavigationStack {
        AddDeviceView(currentCategory: "iPhone")
    }
}
