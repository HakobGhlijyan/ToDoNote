//
//  CreditsView.swift
//  ToDo Watch App
//
//  Created by Hakob Ghlijyan on 12/16/24.
//

import SwiftUI

struct CreditsView: View {
    var body: some View {
        VStack(spacing: 3) {
            Image("profile")
                .resizable()
                .scaledToFit()
                .frame(height: 100)
                .clipShape(Circle())
                .layoutPriority(1)
            
            HeaderView(title: "credits")
            
            Text("Hakob Ghlijyan")
                .foregroundStyle(.primary).bold()
            
            Text("Developer")
                .font(.footnote)
                .foregroundStyle(.secondary)
                .fontWeight(.light)
            
        }
    }
}

#Preview {
    CreditsView()
}
