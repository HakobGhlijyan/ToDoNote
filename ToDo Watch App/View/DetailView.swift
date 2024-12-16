//
//  DetailView.swift
//  ToDo Watch App
//
//  Created by Hakob Ghlijyan on 12/14/24.
//

import SwiftUI

struct DetailView: View {
    let note: Note
    let count: Int
    
    @State private var isCreditsPresented: Bool = false
    @State private var isSettingsPresented: Bool = false

    var body: some View {
        VStack(spacing: 3) {
            //Header
            HeaderView()
            
            //Content
            Spacer()
            ScrollView(.vertical, showsIndicators: false) {
                Text(note.title)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
            }
            Spacer()
            
            //Footer
            HStack(alignment: .center) {
                Image(systemName: "gear")
                    .imageScale(.large)
                    .onTapGesture {
                        isSettingsPresented.toggle()
                    }
                    .sheet(isPresented: $isSettingsPresented) {
                        SettingsView()
                    }
                
                Spacer()
                Text("\(note.date.formatted(date: .omitted, time: .omitted))")
                    .font(.footnote)
                Spacer()
                
                Image(systemName: "info.circle")
                    .imageScale(.large)
                    .onTapGesture {
                        isCreditsPresented.toggle()
                    }
                    .sheet(isPresented: $isCreditsPresented) {
                        CreditsView()
                    }
            }
            .foregroundStyle(.secondary)
            
        }
    }
}

#Preview {
    DetailView(note: Note(title: "Hello , Hakob"), count: 5)
}
