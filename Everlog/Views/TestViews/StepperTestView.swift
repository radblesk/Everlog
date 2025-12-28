//
//  StepperTestView.swift
//  Everlog
//
//  Created by Radoslav Bley on 15/09/2025.
//

import SwiftUI

struct StepperTestView: View {
    @State private var count: Double = 0
    var body: some View {
        let rating = String(format: "%02.0f", count)
        VStack(spacing: 20) {
            Gauge(value: count, in: 0...10) {
                Text("Rating")
            }
            HStack {
                Button("Decrease", systemImage: "minus.circle") {
                    withAnimation {
                        count -= 1
                    }
                }
                .disabled(count == 0)
                Spacer()
                Text(rating)
                    .font(.headline)
                    .contentTransition(.numericText(value: count))

                Spacer()

                Button("Increade", systemImage: "plus.circle") {
                    withAnimation {
                        count += 1
                    }
                }
                .disabled(count == 10)
            }
            .labelStyle(.iconOnly)
        }
        .tint(.white)
        .frame(maxWidth: 100)
        .padding()
        .background(.ultraThinMaterial)
        .clipShape(.rect(cornerRadius: 24))
//        .overlay {
//            RoundedRectangle(cornerRadius: 24)
//                .stroke(.gray.opacity(0.3), lineWidth: 4)
//        }
        .glassEffect(in: .rect(cornerRadius: 24))
//        .shadow(color: .black.opacity(0.1), radius: 14, x: 0, y: 10)
    }
}

#Preview {
    StepperTestView()
}
