//
//  CollectionsListView.swift
//  Everlog
//
//  Created by Radoslav Bley on 14/09/2025.
//

import SwiftData
import SwiftUI

struct CollectionsListView: View {
    @StateObject private var navModel = NavigationModel()
    @Environment(\.scenePhase) private var scenePhase

    @Query private var devices: [StoredDeviceModel]
    @State private var addingDevice: Bool = false

    var body: some View {
        NavigationStack(path: $navModel.path) {
            List {
                Section {
                    ForEach(NavigationOptions.mainPages) { page in
                        NavigationLink(value: page) {
                            Label {
                                Text(page.name)
                                    .font(.body)
                                    .foregroundColor(.primary)
                            } icon: {
                                Image(systemName: page.deviceSymbol)
                                    .foregroundStyle(.primary)
                            }
                            Spacer()
                            Text("\(deviceCount(for: page))")
                        }
                    }
                } header: {
                    Text("Collections")
                }
            }
            .sheet(isPresented: $addingDevice) {
                AddDeviceView(currentCategory: "")
            }
            .navigationDestination(
                for: NavigationOptions.self,
                destination: { page in
                    page.viewForPage()
                }
            )
            .navigationDestination(
                for: StoredDeviceModel.self,
                destination: { device in
                    DeviceDetailView(device: device)
                }
            )
            .containerBackground(Color.accentColor.gradient.opacity(0.4), for: .navigation)
            .headerProminence(.increased)
            .navigationTitle("Everlog")
            .toolbar {
                ToolbarItem(placement: .automatic) {
                    NavigationLink {
                        ContentUnavailableView(
                            "User Settings Page",
                            systemImage: "person",
                            description: Text("This view is not implemented yet.")
                        )
                    } label: {
                        Image(systemName: "person")
                    }
                }

                ToolbarItemGroup(placement: .bottomBar) {
                    Spacer()
                    Button("Add Device", systemImage: "plus") {
                        addingDevice.toggle()
                    }
                }
            }
        }
        .onChange(of: scenePhase) { _, phase in
            if phase == .background {
                navModel.save()
            }
        }
    }

    func deviceCount(for option: NavigationOptions) -> Int {
        devices.filter { $0.category == option.name }.count
    }
}

#Preview {
    CollectionsListView()
        .modelContainer(for: StoredDeviceModel.self)
}
