//
//  WarrantyView.swift
//  Everlog
//
//  Created by Radoslav Bley on 13/09/2025.
//

import SwiftUI

struct WarrantyView: View {
    @Bindable var device: StoredDeviceModel

    var body: some View {
        Form {
            Section {
                VStack(alignment: .leading, spacing: 20) {
                    HStack(spacing: 12) {
                        Image(
                            systemName: (device.warrantyPeriod < Date.now)
                                ? "xmark.shield"
                                : device.appleCare
                                    ? "checkmark.shield.fill"
                                    : device.warrantyExtended ? "shield.lefthalf.filled" : "shield"
                        )
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(device.appleCare ? .red : .gray)
                        .padding(12)
                        .frame(width: 56, height: 56, alignment: .center)
                        .background(Gradient(colors: [Color.gray.opacity(0.1), Color.black.opacity(0.1)]))
                        .glassEffect(in: .rect(cornerRadius: 12))
                        .clipShape(.rect(cornerRadius: 12))
                        .contentTransition(
                            .symbolEffect(.replace.magic(fallback: .downUp.byLayer), options: .nonRepeating)
                        )

                        VStack(alignment: .leading) {
                            Text(device.warranty)
                                .font(.headline)

                            if device.warrantyPeriod > .now {
                                Text(
                                    "Valid until \(device.warrantyPeriod.formatted(.dateTime.day().month().year()))"
                                )
                                .contentTransition(.numericText(countsDown: !device.warrantyExtended))
                                .foregroundStyle(.secondary)
                            }
                        }
                    }
                }
            } footer: {
                Text(
                    "Data are calculated based on the user’s inserted purchase date and warranty period. However, the actual warranty period may vary. The displayed information is for general informational purposes only and is not affiliated with Apple Inc."
                )
            }

            if device.warrantyPeriod > Date.now {
                Section {
                    Toggle("Extended Warranty", isOn: $device.warrantyExtended.animation())
                        .onChange(of: device.warrantyExtended) { oldValue, newValue in
                            if newValue {
                                device.appleCare = false
                            }
                        }

                    if device.warrantyExtended {
                        Picker("Extended Warranty Period", selection: $device.warrantyExtendedPeriod) {
                            ForEach(2...3, id: \.self) { period in
                                Text("\(period) years")
                            }
                        }
                    }

                    Toggle("AppleCare+", isOn: $device.appleCare.animation())
                        .onChange(of: device.appleCare) { oldValue, newValue in
                            if newValue {
                                device.warrantyExtended = false
                            }
                        }

                    if device.appleCare {
                        Picker("AppleCare+ Period", selection: $device.appleCarePeriod) {
                            ForEach(1...3, id: \.self) { period in
                                Text("\(period) years")
                            }
                        }
                    }

                } header: {
                    Text("Additional Options")
                } footer: {
                    Text(
                        "If the Extended warranty or AppleCare option is enabled, the warranty period will be extended by the selected extended period."
                    )
                }
            }
        }
        .navigationTitle("AppleCare & Warranty")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    WarrantyView(device: DevicesData.example)
}
