//
//  DeviceDetailView.swift
//  Everlog
//
//  Created by Radoslav Bley on 11/09/2025.
//

import SwiftData
import SwiftUI

struct DeviceDetailView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    @Bindable var device: StoredDeviceModel

    // States
    @FocusState private var priceFocused
    @State private var isEditing: Bool = false
    @State private var showingAlert: Bool = false

    private var macName: String {
        if !device.displaySize.isEmpty {
            return "\(device.model) \(device.displaySize)"
        }

        return device.model
    }

    var body: some View {
        Form {
            Section {
                DeviceCard(query: "", device: device)
            }

            Section {
                HStack {
                    Text("Release Date")
                    Spacer()
                    Text(device.releaseDate.formatted(.dateTime.day().month().year()))
                        .foregroundStyle(.secondary)
                }

                if !device.osVersion.isEmpty {
                    HStack {
                        Text(determineOS())
                        Spacer()
                        Text(device.osVersion)
                            .foregroundStyle(.secondary)
                    }
                }

                if !device.serialNumber.isEmpty {
                    HStack {
                        Text("Serial Number")
                        Spacer()
                        Text(device.serialNumber)
                            .textSelection(.enabled)
                            .foregroundStyle(.secondary)
                    }
                }

                if !device.currentCondition.isEmpty {
                    HStack {
                        Text("Condition")
                        Spacer()
                        Text(device.currentCondition.capitalized)
                            .foregroundStyle(.secondary)
                    }
                }
            }

            Section {
                NavigationLink {
                    PurchaseDetailsView(device: device)
                } label: {
                    Label(
                        title: {
                            Text("Purchase Details")
                        },
                        icon: {
                            Image(systemName: "bag.fill")
                                .resizable()
                                .scaledToFit()
                                .padding(6)
                                .frame(width: 28, height: 28)
                                .foregroundStyle(.white)
                                .background(.teal.gradient)
                                .clipShape(.rect(cornerRadius: 8))
                        }
                    )
                }

                NavigationLink {
                    WarrantyView(device: device)
                } label: {
                    Label(
                        title: { Text("AppleCare & Warranty") },
                        icon: {
                            Image(systemName: "heart.fill")
                                .resizable()
                                .scaledToFit()
                                .padding(6)
                                .frame(width: 28, height: 28)
                                .foregroundStyle(.red)
                                .background(.white.gradient)
                                .clipShape(.rect(cornerRadius: 8))
                        }
                    )
                }
            }
        }
        .navigationTitle(macName)
        .navigationSubtitle(device.color.capitalized)
        .scrollDismissesKeyboard(.immediately)
        .alert("Are you sure?", isPresented: $showingAlert) {
            Button("Delete", role: .destructive, action: deleteMac)
        } message: {
            Text("This will permanently delete this Mac from your collection.")
        }
        .toolbar {
            ToolbarSpacer(.flexible, placement: .bottomBar)
            ToolbarItem(placement: .bottomBar) {
                Button("Edit", systemImage: "pencil") {
                    isEditing.toggle()
                }
            }
            if priceFocused {
                ToolbarItem {
                    Button("Done", systemImage: "checkmark") {
                        priceFocused = false
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
        }
        .sheet(isPresented: $isEditing) {
            NavigationStack {
                EditDeviceView(editedDevice: device)
                    .toolbar {
                        ToolbarItemGroup(placement: .topBarLeading) {
                            Button("Delete", systemImage: "trash", role: .destructive) {
                                showingAlert.toggle()
                            }
                            .tint(.red)
                        }
                    }
            }
        }
    }

    func deleteMac() {
        modelContext.delete(device)
        dismiss()
    }

    func determineOS() -> String {
        switch device.category {
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
}

#Preview {
    NavigationStack {
        DeviceDetailView(device: DevicesData.example)
    }
}
