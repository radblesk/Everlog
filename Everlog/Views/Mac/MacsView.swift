//
//  MacsView.swift
//  Everlog
//
//  Created by Radoslav Bley on 11/09/2025.
//

import SwiftData
import SwiftUI

struct MacsView: View {
    @Environment(\.modelContext) var modelContext
    @Query(sort: [
        SortDescriptor(\Mac.purchaseDate, order: .reverse)
    ]) private var macs: [Mac]
    @State private var path = [Mac]()

    var body: some View {
        NavigationStack(path: $path) {
            if !macs.isEmpty {
                List {
                    ForEach(macs) { mac in
                        NavigationLink(value: mac) {
                            Label("\(mac.model) (\(mac.processor))", systemImage: "macbook")
                        }
                    }
                    .onDelete(perform: deleteMac)
                }
                .toolbar {
                    ToolbarSpacer(.flexible, placement: .bottomBar)
                    ToolbarItem(placement: .bottomBar) {
                        Button("Add a Mac", systemImage: "plus") {
                            let newMac = Mac(model: "", comments: "", currentCondition: "", releaseDate: .distantPast, color: "", processor: "", memory: "", storage: "", displaySize: "", macOSVersion: "", serialNumber: "", purchaseDate: .distantPast, purchasePrice: 0.0, purchasedCondition: "", warranty: "", warrantyExtended: false, appleCare: false, sold: false)

                            modelContext.insert(newMac)

                            path.append(newMac)
                        }
                        .buttonStyle(.borderedProminent)
                    }
                }
                .navigationTitle("Mac")
                .navigationDestination(for: Mac.self) { mac in
                    MacEditView(mac: mac)
                }
            } else {
                ContentUnavailableView {
                    Label {
                        Text("No Macs owned")
                    } icon: {
                        Image(systemName: "macbook")
                            .foregroundStyle(.blue)
                    }

                } description: {
                    Text("Add a Mac to see it here.")
                } actions: {
                    Button("Add a Mac") {
                        let newMac = Mac(model: "", comments: "", currentCondition: "", releaseDate: .distantPast, color: "", processor: "", memory: "", storage: "", displaySize: "", macOSVersion: "", serialNumber: "", purchaseDate: .distantPast, purchasePrice: 0.0, purchasedCondition: "", warranty: "", warrantyExtended: false, appleCare: false, sold: false)

                        modelContext.insert(newMac)

                        path.append(newMac)
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
        }
    }

    func deleteMac(at offsets: IndexSet) {
        for offset in offsets {
            let mac = macs[offset]
            modelContext.delete(mac)
        }
    }
}

#Preview {
    NavigationStack {
        MacsView()
            .modelContainer(for: Mac.self)
    }
}
