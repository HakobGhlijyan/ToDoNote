//
//  HeaderView.swift
//  ToDo Watch App
//
//  Created by Hakob Ghlijyan on 12/16/24.
//

import SwiftUI

struct HeaderView: View {
    var title: String = ""
    
    var body: some View {
        VStack {
            if title != "" {
                Text(title.uppercased())
                    .font(.title3)
                    .bold()
                    .foregroundStyle(.accent)
            }
            
            HStack {
                Capsule().frame(height: 1)
                Image(systemName: "note.text")
                Capsule().frame(height: 1)
            }
            .foregroundStyle(.accent)
        }
    }
}

#Preview {
    HeaderView(title: "Credits")
    HeaderView()
}
