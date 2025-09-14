//
//  CollectionsListView.swift
//  Everlog
//
//  Created by Radoslav Bley on 14/09/2025.
//

import SwiftData
import SwiftUI

struct CollectionsListView: View {
    @EnvironmentObject var navModel: NavigationModel
    @Query private var devices: [StoredDeviceModel]
    @AppStorage("collectionsExpanded") var collectionsExpanded: Bool = true
    @State private var addingDevice: Bool = false

    var body: some View {
        NavigationStack(path: $navModel.path) {
            ZStack(alignment: .top) {
                Color(.systemGroupedBackground)
                    .ignoresSafeArea()

                Circle()
                    .fill(Color.accent)
                    .offset(x: 100, y: -200)
                    .blur(radius: 120)
                    .opacity(0.2)
                    .ignoresSafeArea()

                Circle()
                    .fill(Color.purple)
                    .offset(x: -200, y: -100)
                    .blur(radius: 120)
                    .opacity(0.15)
                    .ignoresSafeArea()

                List {
                    Section(isExpanded: $collectionsExpanded.animation()) {
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
                                .badge(deviceCount(for: page))
                            }
                        }
                    } header: {
                        Image(systemName: "rectangle.stack")
                            .imageScale(.small)

                        Text("Collections")
                    }
                    .listRowBackground(Color(.secondarySystemGroupedBackground).opacity(0.7))
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
                .scrollContentBackground(.hidden)
                .listStyle(.sidebar)
                .headerProminence(.increased)
                .navigationTitle("Everlog")
                .toolbarTitleDisplayMode(.inlineLarge)
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

                    ToolbarSpacer(.flexible, placement: .bottomBar)
                    ToolbarItem(placement: .bottomBar) {
                        Button("Add Device", systemImage: "plus") {
                            addingDevice.toggle()
                        }
                        .buttonStyle(.glassProminent)
                    }
                }
            }
        }

    }

    func deviceCount(for option: NavigationOptions) -> Int {
        devices.filter { $0.category == option.name }.count
    }
}

#Preview {
    CollectionsListView()
        .environmentObject(NavigationModel())
        .modelContainer(for: StoredDeviceModel.self)
}
