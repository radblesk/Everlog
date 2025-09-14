//
//  NavigationModel.swift
//  Everlog
//
//  Created by Radoslav Bley on 13/09/2025.
//

internal import Combine
import Observation
import SwiftUI

class NavigationModel: ObservableObject {
    @Published var path: NavigationPath

    static func readSerializedData() -> Data? {
        UserDefaults.standard.data(forKey: "navigationPath")
    }

    static func writeSerializedData(_ data: Data) {
        UserDefaults.standard.set(data, forKey: "navigationPath")
    }

    init() {
        if let data = Self.readSerializedData() {
            do {
                let representation = try JSONDecoder().decode(NavigationPath.CodableRepresentation.self, from: data)
                self.path = NavigationPath(representation)
            } catch {
                self.path = NavigationPath()
            }
        } else {
            self.path = NavigationPath()
        }
    }

    func save() {
        guard let representation = path.codable else { return }
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(representation)
            Self.writeSerializedData(data)
        } catch {
            print(error.localizedDescription)
        }
    }
}
