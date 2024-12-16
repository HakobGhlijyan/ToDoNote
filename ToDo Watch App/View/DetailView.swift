//
//  DetailView.swift
//  ToDo Watch App
//
//  Created by Hakob Ghlijyan on 12/14/24.
//

import SwiftUI

struct DetailView: View {
    @StateObject private var vm = DetailViewModel()
    let note: Note
    let count: Int
    let index: Int

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
                        vm.isSettingsPresented.toggle()
                    }
                    .sheet(isPresented: $vm.isSettingsPresented) {
                        SettingsView()
                    }
                
                Spacer()
                Text("\(index + 1) / \(count)")
                Spacer()
                
                Image(systemName: "info.circle")
                    .imageScale(.large)
                    .onTapGesture {
                        vm.isCreditsPresented.toggle()
                    }
                    .sheet(isPresented: $vm.isCreditsPresented) {
                        CreditsView()
                    }
            }
            .foregroundStyle(.secondary)
            
        }
    }
}

#Preview {
    DetailView(note: Note(id: UUID(), title: "Hello , Hakob"), count: 5, index: 1)
}
