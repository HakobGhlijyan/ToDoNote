//
//  DetailViewModel.swift
//  ToDo Watch App
//
//  Created by Hakob Ghlijyan on 12/16/24.
//

import SwiftUI

final class DetailViewModel: ObservableObject {
    @Published var isCreditsPresented: Bool = false
    @Published var isSettingsPresented: Bool = false
}
