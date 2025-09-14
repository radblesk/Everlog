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

    @State private var addingDevice: Bool = false
    var currentView: String
    var currentSymbol: String

    var body: some View {
        Group {
            if !devices.isEmpty {
                List {
                    ForEach(Array(Set(devices.compactMap(\.model))).sorted(), id: \.self) { model in
                        Section(model) {
                            ForEach(devices.filter { $0.model == model }) { device in
                                NavigationLink(value: device) {
                                    DeviceCard(device: device)
                                }
                            }
                            .onDelete(perform: deleteMac)
                        }
                    }
                }
            } else {
                ContentUnavailableView {
                    Button {
                        addingDevice.toggle()
                    } label: {
                        ZStack {
                            Label("No \(currentView) devices", systemImage: currentSymbol)
                            Image(systemName: "plus")
                                .imageScale(.small)
                                .padding(6)
                                .background(.ultraThinMaterial)
                                .clipShape(.circle)
                                .offset(x: 20, y: 0)
                        }
                    }
                    #if os(watchOS)
                        .buttonStyle(.plain)
                    #endif
                } description: {
                    Text("Tap to add your first device")
                }
            }
        }
        .toolbar {
            #if os(iOS)
                ToolbarSpacer(.flexible, placement: .bottomBar)
            #endif
            ToolbarItemGroup(placement: .bottomBar) {
                #if os(watchOS)
                    Spacer()
                #endif
                Button("Add device", systemImage: "plus") {
                    addingDevice.toggle()
                }
                #if os(iOS)
                    .buttonStyle(.glassProminent)
                #endif
            }
        }
        .scrollDismissesKeyboard(.immediately)
        .navigationTitle("\(currentView) Collection")
        #if os(iOS)
            .navigationSubtitle(devices.count > 0 ? "^[\(devices.count) \(currentView)](inflect: true)" : "")
        #endif
        .sheet(isPresented: $addingDevice) {
            AddDeviceView(currentCategory: currentView)
        }
    }

    init(
        sortOrder: [SortDescriptor<StoredDeviceModel>],
        filter: Predicate<StoredDeviceModel>,
        currentView: String,
        currentSymbol: String
    ) {
        _devices = Query(
            filter: filter,
            sort: sortOrder
        )

        self.currentView = currentView
        self.currentSymbol = currentSymbol
    }

    func deleteMac(at offsets: IndexSet) {
        for offset in offsets {
            let mac = devices[offset]
            modelContext.delete(mac)
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
}

#Preview {
    NavigationStack {
        DevicesView(
            sortOrder: [SortDescriptor(\StoredDeviceModel.purchaseDate)],
            filter: Predicate<StoredDeviceModel>.true,
            currentView: "iPhone",
            currentSymbol: "appletv.fill"
        )
        .modelContainer(for: StoredDeviceModel.self, inMemory: true)
        .environmentObject(NavigationModel())
    }
}
