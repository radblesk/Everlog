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
    @AppStorage("collectionsExpanded") var collectionsExpanded: Bool = true
    @State private var addingDevice: Bool = false
    @State private var searchText: String = ""

    var body: some View {
        NavigationStack(path: $navModel.path) {
            ZStack(alignment: .top) {

                RadialGradient(
                    colors: [.accentColor.opacity(0.15), Color(.systemGroupedBackground)],
                    center: .bottom,
                    startRadius: 100,
                    endRadius: 800
                )
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
                    .listRowBackground(
                        Rectangle()
                            .fill(.ultraThinMaterial)
                    )
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
                    DefaultToolbarItem(kind: .search, placement: .bottomBar)
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
        .searchable(text: $searchText) {
            let results = devices.filter { $0.macName.localizedStandardContains(searchText) }

            if results.isEmpty && !searchText.isEmpty {
                ContentUnavailableView(
                    "No results for \"\(searchText)\"",
                    systemImage: "magnifyingglass",
                    description: Text("Check your spelling or try aagain with a different search term")
                )
            } else {
                ForEach(results) { device in
                    NavigationLink(value: device) {
                        DeviceCard(device: device)
                    }
                    .buttonStyle(.plain)
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
        .environmentObject(NavigationModel())
        .modelContainer(for: StoredDeviceModel.self)
}
