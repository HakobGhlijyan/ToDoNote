//
//  AppStorageConstatns.swift
//  ToDo Watch App
//
//  Created by Hakob Ghlijyan on 12/16/24.
//

import SwiftUI

final class AppStorageConstants {
    static let shared = AppStorageConstants()
    private init() {}
    @AppStorage("linecount") var lineCount: Int = 1
}
