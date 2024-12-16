//
//  SettingsView.swift
//  ToDo Watch App
//
//  Created by Hakob Ghlijyan on 12/16/24.
//

import SwiftUI

struct SettingsView: View {
    @StateObject private var vm = SettingsViewModel()
    
    var body: some View {
        VStack(spacing: 8.0) {
            HeaderView(title: "settings")
            
            Text("Lines: \(vm.appStorage.lineCount)".uppercased())
                .bold()
            
            Slider(value: Binding(get: {
                self.vm.value
            }, set: { newValue in
                self.vm.value = newValue
                self.vm.update()
            }), in: 1...4, step: 1)
                .foregroundStyle(.accent)
        }
    }
}

#Preview {
    SettingsView()
}
