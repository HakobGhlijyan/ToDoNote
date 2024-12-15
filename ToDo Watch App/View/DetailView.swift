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
    let index: Int
    
    var body: some View {
        VStack(spacing: 3) {
            //Header
            HStack {
                Capsule().frame(height: 1)
                Image(systemName: "note.text")
                Capsule().frame(height: 1)
            }
            .foregroundStyle(.accent)
            
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
                Spacer()
                Text("\(index + 1) / \(count)")
                Spacer()
                Image(systemName: "info.circle")
                    .imageScale(.large)
            }
            .foregroundStyle(.secondary)
            
        }
    }
}

#Preview {
    DetailView(note: Note(id: UUID(), title: "Hello , Hakob"), count: 5, index: 1)
}
