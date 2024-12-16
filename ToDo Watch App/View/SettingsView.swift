//
//  SettingsView.swift
//  ToDo Watch App
//
//  Created by Hakob Ghlijyan on 12/16/24.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("linecount") private var lineCount: Int = 1
    @State private var value: Float = 1.0
    
    func update() {
        lineCount = Int(value)
    }
    
    var body: some View {
        VStack(spacing: 8.0) {
            HeaderView(title: "settings")
            
            Text("Lines: \(lineCount)".uppercased())
                .bold()
            
            Slider(value: Binding(get: {
                self.value
            }, set: { newValue in
                self.value = newValue
                self.update()
            }), in: 1...4, step: 1)
                .foregroundStyle(.accent)
        }
    }
}

#Preview {
    SettingsView()
}
