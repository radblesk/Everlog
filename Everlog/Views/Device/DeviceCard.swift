//
//  DeviceCard.swift
//  Everlog
//
//  Created by Radoslav Bley on 13/09/2025.
//

import SwiftUI
import UIKit

struct DeviceCard: View {
    //    let query: String
    let device: StoredDeviceModel

    var body: some View {
        let deviceColor = DevicesData().categories.flatMap(\.deviceCategories).flatMap(\.devices).first(where: {
            $0.name == device.model
        })?.colors.first(where: { $0.name == device.color })?.color

        VStack(alignment: .leading) {
            HStack(spacing: 12) {
                ZStack(alignment: .topTrailing) {
                    Image(systemName: device.symbol)
                        .resizable()
                        .scaledToFit()
                        .padding(12)
                        .symbolRenderingMode(.hierarchical)
                        .foregroundStyle(Color.accentColor)
                        .frame(width: 72, height: 72, alignment: .center)
                        .background(.ultraThinMaterial)
                        .clipShape(.rect(cornerRadius: 12))
                        .contentTransition(
                            .symbolEffect(
                                .replace.magic(fallback: .downUp.byLayer),
                                options: .nonRepeating
                            )
                        )

                    Circle()
                        .fill(.clear)
                        .frame(width: 18, height: 18)
                        .glassEffect(.regular.tint(deviceColor))
                        .offset(x: 6, y: -6)
                }

                VStack(alignment: .leading) {
                    Text(device.macName)
                        .font(.headline)

                    HStack(spacing: 0) {
                        Text(device.releaseDate.formatted(.dateTime.year()))
                        if !device.chip.isEmpty {
                            Text(", \(device.chip)")
                        }

                        if !device.memory.isEmpty {
                            Text(", \(device.memory)")
                        }

                        if !device.storage.isEmpty {
                            Text(", \(device.storage)")
                        }
                    }
                    .foregroundStyle(.secondary)
                    .font(.subheadline)

                    if !device.sold {
                        Text(device.warranty)
                            .foregroundStyle(.secondary)
                            .font(.subheadline.bold())
                    } else {
                        Text("Sold")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.bold())
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
    }

    //    func highlightedAttributedString(
    //        text: String,
    //        search: String,
    //        highlightColor: UIColor = .tintColor,
    //        baseFont: UIFont = UIFont.preferredFont(forTextStyle: .body)
    //    ) -> AttributedString {
    //        guard !search.isEmpty else { return AttributedString(text) }
    //
    //        let ns = text as NSString
    //        let mutable = NSMutableAttributedString(string: text)
    //        let fullRange = NSRange(location: 0, length: ns.length)
    //
    //        // base attributes (so non-highlighted text looks correct)
    //        mutable.addAttribute(.font, value: baseFont, range: fullRange)
    //        // optional: mutable.addAttribute(.foregroundColor, value: UIColor.label, range: fullRange)
    //
    //        let matches = text.nsRanges(of: search)
    //        for r in matches {
    //            // bold the match
    //            let currentFont = (mutable.attribute(.font, at: r.location, effectiveRange: nil) as? UIFont) ?? baseFont
    //            let boldDescriptor = currentFont.fontDescriptor.withSymbolicTraits(.traitBold) ?? currentFont.fontDescriptor
    //            let bold = UIFont(descriptor: boldDescriptor, size: currentFont.pointSize)
    //
    //            mutable.addAttributes([.foregroundColor: highlightColor, .font: bold], range: r)
    //        }
    //
    //        // convert to Swift's AttributedString
    //        if let attr = try? AttributedString(mutable) {
    //            return attr
    //        } else {
    //            return AttributedString(text)
    //        }
    //    }
}

extension String {
    func nsRanges(of search: String, options: String.CompareOptions = [.caseInsensitive, .diacriticInsensitive])
        -> [NSRange]
    {
        let ns = self as NSString
        var ranges: [NSRange] = []
        var searchRange = NSRange(location: 0, length: ns.length)

        while true {
            let found = ns.range(of: search, options: options, range: searchRange)
            if found.location == NSNotFound { break }
            ranges.append(found)
            let newLocation = found.location + found.length
            if newLocation >= ns.length { break }
            searchRange = NSRange(location: newLocation, length: ns.length - newLocation)
        }
        return ranges
    }
}

#Preview {
    List {
        DeviceCard(device: DevicesData.example)
    }
}
