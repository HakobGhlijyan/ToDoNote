//
//  SettingsViewModel.swift
//  ToDo Watch App
//
//  Created by Hakob Ghlijyan on 12/16/24.
//

import SwiftUI

final class SettingsViewModel: ObservableObject {
    let appStorage = AppStorageConstants.shared
    @Published var value: Float = 1.0
    
    func update() {
        appStorage.lineCount = Int(value)
    }
}
