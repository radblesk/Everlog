//
//  PurchaseDetailsView.swift
//  Everlog
//
//  Created by Radoslav Bley on 13/09/2025.
//

import SwiftUI

struct PurchaseDetailsView: View {
    @Bindable var device: StoredDeviceModel

    @FocusState private var priceFocused

    var body: some View {
        Form {
            Section {
                HStack(spacing: 12) {
                    Image(systemName: "bag.fill")
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(.white)
                        .padding(12)
                        .frame(width: 56, height: 56, alignment: .center)
                        .background(.teal.gradient)
                        .glassEffect(in: .rect(cornerRadius: 12))
                        .clipShape(.rect(cornerRadius: 12))
                        .contentTransition(
                            .symbolEffect(.replace.magic(fallback: .downUp.byLayer), options: .nonRepeating)
                        )

                    VStack(alignment: .leading) {
                        Text(device.purchasedFrom)
                            .font(.headline)

                        Text(
                            "\(device.purchaseDate.formatted(.dateTime.day().month().year())), \(device.purchasedCondition)"
                        )
                        .foregroundStyle(.secondary)
                    }
                }
            }

            Section("Purchase") {
                    HStack {
                        Text("Price")
                        Spacer()
                        Text(
                            device.totalCost,
                            format: .currency(code: Locale.current.currency?.identifier ?? "EUR")
                        )
                        .foregroundStyle(.secondary)
                    }

                HStack {
                    Text("Ownership")
                    Spacer()
                    Text("\(device.ownedFor.description.components(separatedBy: "day: ").last!) days")
                        .foregroundStyle(.secondary)
                }
            }

            Section {
                Toggle("Trade In", isOn: $device.tradedIn)

                if device.tradedIn {
                    HStack {
                        Text("Traded device")
                        Spacer()
                        TextField("MacBook Air", text: $device.tradedInDevice)
                            .multilineTextAlignment(.trailing)
                    }

                    HStack {
                        Text("Traded Price")
                        Spacer()
                        TextField(
                            "Amount",
                            value: $device.tradedInPrice,
                            format:
                                .currency(
                                    code: Locale.current.currency?.identifier ?? "EUR"
                                )
                        )
                        #if os(iOS)
                            .keyboardType(.decimalPad)
                        #endif
                        .multilineTextAlignment(.trailing)
                    }
                }
            } header: {
                Text("Trade In")
            } footer: {
                Text(
                    "If the trade in option is enabled, the purchase price of your new device will be automatically reduced by the value of the traded-in device."
                )
            }

            Section(
                header: Text("Sell"),
                footer: Text(
                    "If you have sold your device or traded it in for a new one, please indicate this in this section."
                )
            ) {
                Toggle("Sold", isOn: $device.sold)

                if device.sold {
                    DatePicker("Date", selection: $device.soldDate, displayedComponents: .date)

                    HStack {
                        Text("Price")
                        Spacer()
                        TextField(
                            "Price",
                            value: $device.soldPrice,
                            format: .currency(code: Locale.current.currency?.identifier ?? "EUR")
                        )
                        .multilineTextAlignment(.trailing)
                    }

                    HStack {
                        Text("Reason")
                        Spacer()
                        TextField("Reason", text: $device.soldReason)
                            .multilineTextAlignment(.trailing)
                    }
                }
            }
        }
        .navigationTitle("Purchase Details")
        .navigationBarTitleDisplayMode(.inline)
        .scrollDismissesKeyboard(.interactively)
    }
}

#Preview {
    PurchaseDetailsView(device: DevicesData.example)
}
