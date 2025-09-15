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
    @Environment(\.colorScheme) private var colorScheme

    @Query private var devices: [StoredDeviceModel]
    @AppStorage("collectionsExpanded") var collectionsExpanded: Bool = true
    @State private var addingDevice: Bool = false
    @State private var searchText: String = ""

    @AppStorage("showWarrantyDevices") var showWarrantyDevices: Bool = true
    @AppStorage("username") private var username: String = ""
    @AppStorage("accentColorHex") private var accentColorHex: String = "007AFF"

    var body: some View {
        NavigationStack(path: $navModel.path) {
            ZStack(alignment: .top) {
                Color(.systemGroupedBackground)
                    .ignoresSafeArea()

                RadialGradient(
                    colors: [
                        (Color(hex: accentColorHex) ?? .pink).opacity(colorScheme == .dark ? 0.15 : 0.05), .clear,
                    ],
                    center: .bottom,
                    startRadius: 200,
                    endRadius: 1000
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

                        Text(!username.isEmpty ? "\(username)'s Collections" : "Collections")
                    }

                    let inWarranty = devices.filter { $0.warranty != "Expired" }
                    if showWarrantyDevices && !inWarranty.isEmpty {
                        Section {
                            ScrollView(.horizontal, showsIndicators: false) {
                                LazyHStack(spacing: -25) {
                                    ForEach(inWarranty) { device in
                                        NavigationLink(value: device) {
                                            DeviceCard(query: "", device: device)
                                                .padding(12)
                                                .containerRelativeFrame(.horizontal, alignment: .leading) {
                                                    width,
                                                    axis in
                                                    width * 0.9
                                                }
                                                .background(Rectangle().fill(Color(.secondarySystemGroupedBackground)))
                                                .clipShape(.rect(cornerRadius: 22))
                                                .overlay {
                                                    RoundedRectangle(cornerRadius: 22)
                                                        .stroke(Color(hex: accentColorHex) ?? .red, lineWidth: 0.5)
                                                }
                                        }
                                        .buttonStyle(.plain)
                                        .scrollTransition(axis: .horizontal) {
                                            content,
                                            phase in
                                            content
                                                .scaleEffect(
                                                    x: phase.isIdentity ? 1.0 : 0.7,
                                                    y: phase.isIdentity ? 1.0 : 0.7
                                                )
                                                .opacity(phase.isIdentity ? 1.0 : 0.5)
                                        }
                                    }
                                }
                                .scrollTargetLayout()
                            }
                            .scrollTargetBehavior(.viewAligned(limitBehavior: .automatic))
                        } header: {
                            HStack {
                                Image(systemName: "shield.lefthalf.filled.badge.checkmark")
                                    .imageScale(.small)
                                    .offset(x: 20)

                                Text("Active Warranty")
                                    .offset(x: 20)
                                Spacer()
                                Text("\(inWarranty.count)")
                                    .bold()
                                    .foregroundStyle(Color.accentColor)
                                    .offset(x: -20)
                            }
                        }
                        .listSectionMargins(.horizontal, 0)
                        .listRowInsets(.init(top: 12, leading: 20, bottom: 0, trailing: 20))
                        .listRowSeparator(.hidden)
                        .listRowBackground(Color.clear)
                        .scrollClipDisabled()
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
                .scrollContentBackground(.hidden)
                .listStyle(.sidebar)
                .headerProminence(.increased)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .title) {
                        Text("Title").foregroundStyle(.clear)
                    }
                    ToolbarItem(placement: .automatic) {
                        NavigationLink {
                            UserSettingsView()
                        } label: {
                            Image(systemName: "person")
                        }
                        .foregroundStyle(.primary)
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
            .overlay(
                HStack(spacing: 4) {
                    Image(.everlogLogo)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 28, maxHeight: 28)
                    Text("Everlog")
                        .font(.largeTitle.bold())
                    Spacer()
                }
                .padding(.horizontal)
                .frame(maxHeight: .infinity, alignment: .top)
                .offset(y: -50)
            )
        }
        .searchable(text: $searchText) {
            let results = devices.filter {
                $0.macName.localizedStandardContains(searchText) || $0.comments.localizedStandardContains(searchText)
            }

            if results.isEmpty && !searchText.isEmpty {
                ContentUnavailableView(
                    "No results for \"\(searchText)\"",
                    systemImage: "magnifyingglass",
                    description: Text("Check your spelling or try again with a different search term")
                )
                .ignoresSafeArea()
            } else {
                ForEach(results) { device in
                    NavigationLink(value: device) {
                        DeviceCard(query: searchText, device: device)
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
