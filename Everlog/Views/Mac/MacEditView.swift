//
//  MacEditView.swift
//  Everlog
//
//  Created by Radoslav Bley on 11/09/2025.
//

import SwiftUI

struct MacEditView: View {
    @Bindable var mac: Mac

    // States
    @FocusState private var priceFocused
    @State private var isEditing: Bool = false

    // Enums
    enum CurrentCondition: String, CaseIterable {
        case perfect, good, fair, poor
    }

    enum Storage: String, CaseIterable {
        case _256GB = "256 GB"
        case _512GB = "512 GB"
        case _1TB = "1 TB"
        case _2TB = "2 TB"
        case _4TB = "4 TB"
        case _8TB = "8 TB"
    }

    /// Software
    enum Sierra: String, CaseIterable {
        case _10_12 = "10.12"
        case _10_12_1 = "10.12.1"
        case _10_12_2 = "10.12.2"
        case _10_12_3 = "10.12.3"
        case _10_12_4 = "10.12.4"
        case _10_12_5 = "10.12.5"
        case _10_12_6 = "10.12.6"
    }

    enum HighSierra: String, CaseIterable {
        case _10_13 = "10.13"
        case _10_13_1 = "10.13.1"
        case _10_13_2 = "10.13.2"
        case _10_13_3 = "10.13.3"
        case _10_13_4 = "10.13.4"
        case _10_13_5 = "10.13.5"
        case _10_13_6 = "10.13.6"
    }

    enum Mojave: String, CaseIterable {
        case _10_14 = "10.14"
        case _10_14_1 = "10.14.1"
        case _10_14_2 = "10.14.2"
        case _10_14_3 = "10.14.3"
        case _10_14_4 = "10.14.4"
        case _10_14_5 = "10.14.5"
        case _10_14_6 = "10.14.6"
    }

    enum Catalina: String, CaseIterable {
        case _10_15 = "10.15"
        case _10_15_1 = "10.15.1"
        case _10_15_2 = "10.15.2"
        case _10_15_3 = "10.15.3"
        case _10_15_4 = "10.15.4"
        case _10_15_5 = "10.15.5"
        case _10_15_6 = "10.15.6"
        case _10_15_7 = "10.15.7"
    }

    enum BigSur: String, CaseIterable {
        case _11_0 = "11.0"
        case _11_0_1 = "11.0.1"
        case _11_1 = "11.1"
        case _11_2 = "11.2"
        case _11_2_1 = "11.2.1"
        case _11_3 = "11.3"
        case _11_3_1 = "11.3.1"
        case _11_4 = "11.4"
        case _11_5 = "11.5"
        case _11_5_1 = "11.5.1"
        case _11_5_2 = "11.5.2"
        case _11_6 = "11.6"
        case _11_6_1 = "11.6.1"
        case _11_7 = "11.7"
        case _11_7_10 = "11.7.10"
    }

    enum Monterey: String, CaseIterable {
        case _12_0 = "12.0"
        case _12_0_1 = "12.0.1"
        case _12_1 = "12.1"
        case _12_2 = "12.2"
        case _12_2_1 = "12.2.1"
        case _12_3 = "12.3"
        case _12_3_1 = "12.3.1"
        case _12_4 = "12.4"
        case _12_5 = "12.5"
        case _12_5_1 = "12.5.1"
        case _12_6 = "12.6"
        case _12_6_1 = "12.6.1"
        case _12_7 = "12.7"
        case _12_7_6 = "12.7.6"
    }

    enum Ventura: String, CaseIterable {
        case _13_0 = "13.0"
        case _13_0_1 = "13.0.1"
        case _13_1 = "13.1"
        case _13_2 = "13.2"
        case _13_2_1 = "13.2.1"
        case _13_3 = "13.3"
        case _13_3_1 = "13.3.1"
        case _13_4 = "13.4"
        case _13_4_1 = "13.4.1"
        case _13_5 = "13.5"
        case _13_5_1 = "13.5.1"
        case _13_6 = "13.6"
        case _13_7 = "13.7"
        case _13_7_8 = "13.7.8"
    }

    enum Sonoma: String, CaseIterable {
        case _14_0 = "14.0"
        case _14_1 = "14.1"
        case _14_1_1 = "14.1.1"
        case _14_1_2 = "14.1.2"
        case _14_2 = "14.2"
        case _14_2_1 = "14.2.1"
        case _14_3 = "14.3"
        case _14_3_1 = "14.3.1"
        case _14_4 = "14.4"
        case _14_4_1 = "14.4.1"
        case _14_5 = "14.5"
        case _14_6 = "14.6"
        case _14_7 = "14.7"
        case _14_7_8 = "14.7.8"
    }

    enum Sequoia: String, CaseIterable {
        case _15_0 = "15.0"
        case _15_1 = "15.1"
        case _15_2 = "15.2"
        case _15_2_1 = "15.2.1"
        case _15_3 = "15.3"
        case _15_4 = "15.4"
        case _15_4_1 = "15.4.1"
        case _15_5 = "15.5"
        case _15_6 = "15.6"
        case _15_6_1 = "15.6.1"
    }

    enum Tahoe: String, CaseIterable {
        case _26_0 = "26.0"
    }

    private var macName: String {
        if !mac.displaySize.isEmpty {
            return "\(mac.model) \(mac.displaySize)"
        }

        return mac.model
    }

    var body: some View {
        Form {
            Section {
                VStack(spacing: 0) {
                    if let selectedModel = MacType(rawValue: mac.model) {
                        Image(selectedModel.macColors[mac.color] ?? "")
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: 150)
                            .animation(.spring, value: mac.color)
                    }

                    VStack {
                        Text(macName)
                            .font(.title3.bold())

                        Text("\(mac.processor), \(mac.color.capitalized)")
                            .font(.caption)
                    }
                }
                .frame(maxWidth: .infinity)
                .listRowBackground(Color.clear)
            }

            Section {
                NavigationLink {
                    Form {
                        Section("Purchase") {
                            if isEditing {
                                HStack {
                                    Text("Store")
                                    Spacer()
                                    TextField("Apple Store Rosenstraße", text: $mac.purchasedFrom)
                                        .multilineTextAlignment(.trailing)
                                }
                            } else if !mac.purchasedFrom.isEmpty {
                                HStack {
                                    Text("Store")
                                    Spacer()
                                    Text(mac.purchasedFrom)
                                        .foregroundStyle(.secondary)
                                }
                            }

                            if isEditing {
                                DatePicker(
                                    "Purchased Date",
                                    selection: $mac.purchaseDate,
                                    displayedComponents: .date
                                )
                            } else {
                                HStack {
                                    Text("Purchase Date")
                                    Spacer()
                                    Text(mac.purchaseDate.formatted(.dateTime.day().year().month()))
                                        .foregroundStyle(.secondary)
                                }
                            }

                            if isEditing {
                                HStack {
                                    Text("Price")
                                    Spacer()
                                    TextField(
                                        "Price",
                                        value: $mac.purchasePrice,
                                        format: .currency(code: Locale.current.currency?.identifier ?? "EUR")
                                    )
                                    .focused($priceFocused)
                                    .multilineTextAlignment(.trailing)
                                    #if os(iOS)
                                        .keyboardType(.decimalPad)
                                    #endif
                                }
                            } else {
                                HStack {
                                    Text("Price")
                                    Spacer()
                                    Text(
                                        mac.purchasePrice,
                                        format: .currency(code: Locale.current.currency?.identifier ?? "EUR")
                                    )
                                    .foregroundStyle(.secondary)
                                }
                            }

                            HStack {
                                Text("Owned")
                                Spacer()
                                Text("\(mac.ownedFor.description.components(separatedBy: "day: ").last!) days")
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                    .navigationTitle("Purchase Details")
                    .scrollDismissesKeyboard(.interactively)
                    .toolbar {
                        Button(isEditing ? "Done" : "Edit") {
                            withAnimation {
                                isEditing.toggle()
                            }
                        }
                        if priceFocused {
                            Button("Done", systemImage: "checkmark") {
                                priceFocused = false
                            }
                            .buttonStyle(.borderedProminent)
                        }
                    }
                } label: {
                    HStack(spacing: 14) {
                        Image(.appleStore)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 28, height: 28, alignment: .center)
                            .clipShape(.rect(cornerRadius: 8))
                        Text("Purchase Details")
                    }
                }

                NavigationLink {
                    Form {
                        Section {
                            VStack(alignment: .leading, spacing: 20) {
                                Image(.appleCare)
                                    .resizable()
                                    .scaledToFit()
                                    .grayscale(mac.appleCare ? 0.0 : 1.0)
                                    .frame(maxWidth: 56, maxHeight: 56)
                                    .clipShape(.rect(cornerRadius: 12))

                                VStack(alignment: .leading) {
                                    if mac.appleCare {
                                        Text("AppleCare+")
                                            .font(.headline)
                                    } else if mac.warrantyDate > Date.now {
                                        Text(mac.warrantyExtended ? "Extended Warranty" : "Limited Warranty")
                                            .font(.headline)
                                    } else {
                                        Text("Warranty Expired")
                                            .foregroundStyle(.red)
                                            .font(.headline)
                                    }

                                    if mac.warrantyDate > .now {
                                        Text(
                                            "Expires \(mac.warrantyDate.formatted(.dateTime.day().month().year()))"
                                        )
                                        .foregroundStyle(.secondary)
                                    }
                                }

                                VStack(alignment: .leading) {
                                    Text(macName)
                                        .foregroundStyle(.secondary)

                                    Text("Serial Number: \(mac.serialNumber)")
                                        .foregroundStyle(.secondary)
                                }

                                Divider()

                                if mac.warrantyDate > .now {
                                    VStack(alignment: .leading) {
                                        Text("Your hardware is covered for:")
                                            .foregroundStyle(.secondary)

                                        if mac.appleCare {
                                            HStack {
                                                Image(systemName: "checkmark")
                                                Text("Accidental Damage")
                                            }
                                            .foregroundStyle(.secondary)

                                            HStack {
                                                Image(systemName: "checkmark")
                                                Text("Hardware Service")
                                            }
                                            .foregroundStyle(.secondary)

                                            HStack {
                                                Image(systemName: "checkmark")
                                                Text("Express Replacement")
                                            }
                                            .foregroundStyle(.secondary)

                                            HStack {
                                                Image(systemName: "checkmark")
                                                Text("24/7 Priority Access")
                                            }
                                            .foregroundStyle(.secondary)
                                        } else {
                                            HStack {
                                                Image(systemName: "checkmark")
                                                Text("Hardware Service")
                                            }
                                            .foregroundStyle(.secondary)

                                            HStack {
                                                Image(systemName: "checkmark")
                                                Text("Chat & Phone Support")
                                            }
                                            .foregroundStyle(.secondary)
                                        }
                                    }
                                } else {
                                    Text("Your hardware is no longer covered under warranty.")
                                        .foregroundStyle(.secondary)
                                }
                            }
                        } footer: {
                            Text(
                                "Data are calculated based on user inserted purchase date and warranty period. Actual warranty period may vary."
                            )
                        }

                        if isEditing {
                            Toggle("Extended Warranty", isOn: $mac.warrantyExtended)
                        }

                        if isEditing {
                            Toggle(" Care", isOn: $mac.appleCare)
                                .foregroundStyle(.red)
                        }
                    }
                    .navigationTitle("AppleCare & Warranty")
                    .scrollDismissesKeyboard(.interactively)
                    .toolbar {
                        Button(isEditing ? "Done" : "Edit") {
                            withAnimation {
                                isEditing.toggle()
                            }
                        }
                        if priceFocused {
                            Button("Done", systemImage: "checkmark") {
                                priceFocused = false
                            }
                            .buttonStyle(.borderedProminent)
                        }
                    }
                } label: {
                    HStack(spacing: 14) {
                        Image(.appleCare)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 28, height: 28, alignment: .center)
                            .clipShape(.rect(cornerRadius: 8))
                        Text("AppleCare & Warranty")
                    }
                }
            }

            Section("Device Info") {
                if isEditing {
                    Picker("Model Name", selection: $mac.model) {
                        ForEach(MacType.allCases, id: \.rawValue) { mac in
                            Text(mac.rawValue)
                        }
                    }
                } else {
                    HStack {
                        Text("Model Name")
                        Spacer()
                        Text("\(mac.model) \(mac.displaySize.components(separatedBy: "″").first ?? "")″")
                            .foregroundStyle(.secondary)
                    }
                }

                if isEditing {
                    Picker("macOS Version", selection: $mac.macOSVersion) {
                        Section("Sierra") {
                            ForEach(Sierra.allCases, id: \.rawValue) { version in
                                Text(version.rawValue)
                            }
                        }

                        Section("High Sierra") {
                            ForEach(HighSierra.allCases, id: \.rawValue) { version in
                                Text(version.rawValue)
                            }
                        }

                        Section("Mojave") {
                            ForEach(Mojave.allCases, id: \.rawValue) { version in
                                Text(version.rawValue)
                            }
                        }

                        Section("Catalina") {
                            ForEach(Catalina.allCases, id: \.rawValue) { version in
                                Text(version.rawValue)
                            }
                        }

                        Section("Big Sur") {
                            ForEach(BigSur.allCases, id: \.rawValue) { version in
                                Text(version.rawValue)
                            }
                        }

                        Section("Monterey") {
                            ForEach(Monterey.allCases, id: \.rawValue) { version in
                                Text(version.rawValue)
                            }
                        }

                        Section("Ventura") {
                            ForEach(Ventura.allCases, id: \.rawValue) { version in
                                Text(version.rawValue)
                            }
                        }

                        Section("Sonoma") {
                            ForEach(Sonoma.allCases, id: \.rawValue) { version in
                                Text(version.rawValue)
                            }
                        }

                        Section("Sequoia") {
                            ForEach(Sequoia.allCases, id: \.rawValue) { version in
                                Text(version.rawValue)
                            }
                        }

                        Section("Tahoe") {
                            ForEach(Tahoe.allCases, id: \.rawValue) { version in
                                Text(version.rawValue)
                            }
                        }
                    }
                } else {
                    HStack {
                        Text("macOS Version")
                        Spacer()
                        Text(mac.macOSVersion)
                            .foregroundStyle(.secondary)
                    }
                }

                if isEditing {
                    HStack {
                        Text("Serial Number")
                        Spacer()
                        TextField("Serial Number", text: $mac.serialNumber)
                            .multilineTextAlignment(.trailing)
                    }
                } else if !mac.serialNumber.isEmpty {
                    HStack {
                        Text("Serial Number")
                        Spacer()
                        Text(mac.serialNumber)
                            .textSelection(.enabled)
                            .foregroundStyle(.secondary)
                    }
                }

                if isEditing {
                    Picker("Condition", selection: $mac.currentCondition) {
                        ForEach(CurrentCondition.allCases, id: \.rawValue) { condition in
                            Text(condition.rawValue.capitalized)
                        }
                    }
                } else if !mac.currentCondition.isEmpty {
                    HStack {
                        Text("Condition")
                        Spacer()
                        Text(mac.currentCondition.capitalized)
                            .foregroundStyle(.secondary)
                    }
                }

                if isEditing {
                    TextField("Comment", text: $mac.comments)
                } else if !mac.comments.isEmpty {
                    Text(mac.comments)
                        .foregroundStyle(.secondary)
                }
            }

            let selectedModel = MacType(rawValue: mac.model)

            Section("Configuration") {
                if mac.model == "MacBook Air" || mac.model == "MacBook Pro" || mac.model == "iMac" {
                    if isEditing {
                        if let selectedModel = MacType(rawValue: mac.model) {
                            Picker("Display Size", selection: $mac.displaySize) {
                                ForEach(selectedModel.displaySizes, id: \.self) { size in
                                    Text(size)
                                }
                            }
                        }
                    } else {
                        HStack {
                            Text("Display Size")
                            Spacer()
                            Text(mac.displaySize)
                                .foregroundStyle(.secondary)
                        }
                    }
                }

                if mac.model == "MacBook Air" || mac.model == "MacBook Pro" || mac.model == "iMac" {
                    if isEditing {
                        if let selectedType = MacType(rawValue: mac.model) {
                            Picker("Color", selection: $mac.color) {
                                ForEach(selectedType.macColors.keys.sorted(), id: \.self) { color in
                                    Text(color)
                                }
                            }
                        }
                    } else {
                        HStack {
                            Text("Color")
                            Spacer()
                            Text(mac.color.capitalized)
                                .foregroundStyle(.secondary)
                        }
                    }
                }

                if isEditing {
                    if let selectedModel = MacType(rawValue: mac.model) {
                        Picker("Chip", selection: $mac.processor) {
                            Section("Intel") {
                                ForEach(selectedModel.chips.keys.filter { $0.contains("Intel") }.sorted(), id: \.self) {
                                    chip in
                                    Text("\(chip)")
                                }
                            }
                            Section("Apple Silicon") {
                                ForEach(selectedModel.chips.keys.filter { $0.contains("Apple") }.sorted(), id: \.self) {
                                    chip in
                                    Text("\(chip)")
                                }
                            }
                        }
                    }
                } else {
                    HStack {
                        Text("Chip")
                        Spacer()
                        Text(mac.processor)
                            .foregroundStyle(.secondary)
                    }
                }

                if isEditing {
                    if let selectedModel = MacType(rawValue: mac.model) {
                        let ramOptions = selectedModel.chips[mac.processor] ?? []
                        Picker("Memory", selection: $mac.memory) {
                            ForEach(ramOptions, id: \.self) { memory in
                                Text(memory)
                            }
                        }
                    }
                } else {
                    HStack {
                        Text("Memory")
                        Spacer()
                        Text(mac.memory)
                            .foregroundStyle(.secondary)
                    }
                }

                if isEditing {
                    Picker("Storage", selection: $mac.storage) {
                        ForEach(Storage.allCases, id: \.rawValue) { storage in
                            Text("\(storage.rawValue)")
                        }
                    }
                } else {
                    HStack {
                        Text("Storage")
                        Spacer()
                        Text(mac.storage)
                            .foregroundStyle(.secondary)
                    }
                }
            }
            .onChange(of: selectedModel) {
                mac.processor = selectedModel?.chips.keys.filter { $0.contains("Apple") }.sorted().first ?? "Unknown"

                mac.color = selectedModel?.macColors.keys.sorted().first ?? "Unknown"

                mac.displaySize = selectedModel?.displaySizes.first ?? ""
            }
            .onChange(of: mac.processor) {
                mac.memory = selectedModel?.chips[mac.processor]?.first ?? "Unknown"
            }

        }
        .onAppear {
            if mac.model.isEmpty {
                isEditing = true
                mac.model = "MacBook Air"
            }
        }
        .padding(.top, 50)
        .ignoresSafeArea(edges: .top)
        .scrollDismissesKeyboard(.interactively)
        .toolbar {
            Button(isEditing ? "Done" : "Edit") {
                withAnimation {
                    isEditing.toggle()
                }
            }
            if priceFocused {
                Button("Done", systemImage: "checkmark") {
                    priceFocused = false
                }
                .buttonStyle(.borderedProminent)
            }
        }
    }
}

#Preview {
    NavigationStack {
        MacEditView(
            mac: Mac(
                model: "MacBook Pro",
                comments: "",
                currentCondition: "excelent",
                releaseDate: .now,
                color: "Space Black",
                processor: "Apple M4 Pro",
                memory: "24 GB",
                storage: "512 GB",
                displaySize: "14″",
                macOSVersion: "26.0",
                serialNumber: "",
                purchaseDate: Calendar.current.date(byAdding: .day, value: -60, to: .now)!,
                purchasePrice: 2499.00,
                purchasedCondition: "New",
                warranty: "Yes",
                warrantyExtended: false,
                appleCare: false,
                sold: false
            )
        )
    }
}
