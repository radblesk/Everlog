//
//  DeviceCard.swift
//  Everlog
//
//  Created by Radoslav Bley on 13/09/2025.
//

import SwiftUI
import UIKit

struct DeviceCard: View {
    let device: StoredDeviceModel

    var body: some View {
        let deviceColor = DevicesData().categories.flatMap(\.deviceCategories).flatMap(\.devices).first(where: {
            $0.name == device.model
        })?.colors.first(where: { $0.name == device.color })?.color

        VStack(alignment: .leading) {
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Image(systemName: device.symbol)
                        .resizable()
                        .scaledToFit()
                        .symbolRenderingMode(.hierarchical)
                        .foregroundStyle(Color.accentColor)
                        .frame(width: 38, height: 38, alignment: .center)
                        .contentTransition(
                            .symbolEffect(
                                .replace.magic(fallback: .downUp.byLayer),
                                options: .nonRepeating
                            )
                        )

                    Spacer()

                    Circle()
                        .fill(.clear)
                        .frame(width: 18, height: 18)
                        .glassEffect(.regular.tint(deviceColor))
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text(device.macName)
                        .font(.headline)

                    if !device.sold {
                        Text(device.warranty)
                            .foregroundStyle(.secondary)
                            .font(.caption.bold())
                    } else {
                        Text("Sold")
                            .foregroundStyle(.secondary)
                            .font(.caption.bold())
                    }
                }
            }

            if !device.comments.isEmpty {
                Divider()

                VStack {
                    Text(device.comments)
                }
                .padding(.top, 4)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundStyle(.secondary)
                .font(.subheadline)
            }
        }
        .padding(.vertical)
    }
}

#Preview {
    List {
        DeviceCard(device: DevicesData.example)
    }
}
