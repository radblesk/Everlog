//
//  UserSettingsView.swift
//  Everlog
//
//  Created by Radoslav Bley on 14/09/2025.
//

import SwiftData
import SwiftUI

struct UserSettingsView: View {
    @Environment(\.modelContext) private var modelContext
    @State private var deleteConfirmation: Bool = false
    @State private var isLoading: Bool = false
    @State private var isSuccess: Bool = false
    @State private var successTitle: String = ""
    @State private var successMessage: String = ""
    @State private var hasError: Bool = false
    @State private var errorTitle: String = ""
    @State private var errorMessage: String = ""
    @FocusState private var usernameFocused: Bool

    enum Theme: String, CaseIterable {
        case system, light, dark
    }

    let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "Unknown"

    let buildNumber = Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? "Unknown"

    @AppStorage("showWarrantyDevices") var showWarrantyDevices: Bool = true
    @AppStorage("preferredScheme") private var preferredScheme: String = "system"
    @AppStorage("username") private var username: String = ""
    @AppStorage("accentColorHex") private var accentColorHex: String = "007AFF"
    @State private var selectedColor: Color = Color(hex: "007AFF")!

    var body: some View {
        Form {
            Section {
                HStack {
                    Text("Collection Name:")
                    TextField("John Appleseed", text: $username)
                        .focused($usernameFocused)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.never)
                }
            } header: {
                HStack {
                    Image(systemName: "person")
                    Text(username.isEmpty ? "Collections" : "\(username)'s Collections")
                }
            } footer: {
                Text(
                    "If set, your name will serve as the name of your collection. This information is exclusively stored locally and will not be synchronized with iCloud."
                )
            }

            Section {
                Picker("Appearance", selection: $preferredScheme) {
                    ForEach(Theme.allCases, id: \.self) { theme in
                        Text(theme.rawValue.capitalized)
                            .tag(theme.rawValue)
                    }
                }
                .tint(.secondary)
                #if os(iOS)
                    ColorPicker("Accent Color", selection: $selectedColor)
                        .onChange(of: selectedColor) { _, newColor in
                            accentColorHex = newColor.hex
                        }

                    Button("Default accent") {
                        selectedColor = .accent
                    }
                    .buttonStyle(.plain)
                    .foregroundStyle(.primary)
                #endif
            } header: {
                HStack {
                    Image(systemName: "paintpalette")
                    Text("Appearance")
                }
            }

            Section {
                Toggle("Show 'In Warranty' section", isOn: $showWarrantyDevices)

                if isLoading {
                    ProgressView()
                } else {
                    Button("Erase all data", role: .destructive) {
                        deleteConfirmation.toggle()
                    }
                    .foregroundStyle(.red)
                }
            } header: {
                HStack {
                    Image(systemName: "list.bullet.rectangle.portrait")
                    Text("Content Preferences")
                }
            }

            Section {
                Link(destination: URL(string: "mailto:support@radobley.sk")!) {
                    HStack {
                        Image(systemName: "envelope")
                        Text("Send me an Email")
                    }
                }

                HStack {
                    Link(destination: URL(string: "https://www.radobley.sk")!) {
                        HStack {
                            Image(systemName: "globe")
                            Text("Visit my Website")
                        }
                    }
                }

                HStack {
                    Link(destination: URL(string: "https://github.com/radblesk/Everlog")!) {
                        HStack {
                            Image("GitHubLogo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 22, height: 22)

                            Text("Everlog on Github")
                        }
                    }
                }
            } header: {
                HStack {
                    Image(systemName: "lifepreserver")
                    Text("Support")
                }
            }

            Section {
                HStack {
                    Text("Version")
                    Spacer()
                    Text("\(appVersion) (\(buildNumber))")
                        .foregroundStyle(.secondary)
                }

                HStack {
                    Text("Developer")
                    Spacer()
                    Text("Radoslav Bley")
                        .foregroundStyle(.secondary)
                }
            } header: {
                HStack {
                    Image(systemName: "info.circle")
                    Text("About")
                }
            } footer: {
                VStack {
                    Text("Everlog © 2025 Veľmajster")
                    Text("Licensed under the MIT License")
                    Text("See https://opensource.org/licenses/MIT for details")
                }
                .frame(maxWidth: .infinity)
            }
        }
        .onAppear {
            selectedColor = Color(hex: accentColorHex) ?? .blue
        }
        .navigationTitle("User Settings")
        .alert("Erase all data", isPresented: $deleteConfirmation) {
            Button("Erase", role: .destructive) {
                do {
                    isLoading = true
                    let fetchDescriptor = FetchDescriptor<StoredDeviceModel>()
                    let devices = try modelContext.fetch(fetchDescriptor)

                    for device in devices {
                        modelContext.delete(device)
                    }

                    if modelContext.hasChanges {
                        try modelContext.save()
                    }
                    isLoading = false
                    isSuccess.toggle()
                    successTitle = "Data erased"
                    successMessage = "All your data has been erased."

                } catch {
                    errorTitle = "Failed to erase data"
                    errorMessage = "\(error.localizedDescription)"
                    hasError.toggle()
                }
            }
        }
        .alert(errorTitle, isPresented: $hasError) {

        } message: {
            Text(errorMessage)
        }
        .alert(successTitle, isPresented: $isSuccess) {

        } message: {
            Text(successMessage)
        }
        .toolbar {
            if usernameFocused {
                Button("Done", systemImage: "checkmark") {
                    withAnimation {
                        usernameFocused.toggle()
                    }
                }
                .buttonStyle(.borderedProminent)
            }
        }
        .scrollDismissesKeyboard(.interactively)
    }
}

#Preview {
    NavigationStack {
        UserSettingsView()
    }
}
