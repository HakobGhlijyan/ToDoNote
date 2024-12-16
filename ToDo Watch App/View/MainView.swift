//
//  ContentView.swift
//  ToDo Watch App
//
//  Created by Hakob Ghlijyan on 12/14/24.
//

import SwiftUI
import SwiftData

struct MainView: View {
    @Query(sort: \Note.date, order: .reverse) var notes: [Note]
    @Environment(\.modelContext) private var modelContext
    @AppStorage("linecount") var lineCount: Int = 1
    @State private var text: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack(alignment: .center, spacing: 6) {
                    TextField("Add New Note", text: $text)
                    Button {
                        guard text.isEmpty == false else { return }
                        let note = Note(title: text)
                        withAnimation(.bouncy) {
                            modelContext.insert(note)
                            text = ""
                        }
                    } label: {
                        Image(systemName: "plus.circle")
                            .font(.title)
                    }
                    .disabled(text.isEmpty)
                    .fixedSize()
                    .buttonStyle(.plain)
                    .foregroundStyle(.accent)
                }
                Spacer()
                
                if notes.isEmpty {
                    Image(systemName: "note")
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(.gray)
                        .opacity(0.25)
                        .padding(10)
                } else {
                    List(notes) { note in
                        NavigationLink {
                            DetailView(note: note, count: notes.count)
                        } label: {
                            HStack {
                                Capsule()
                                    .frame(width: 4)
                                    .foregroundStyle(.accent)
                                Text(note.title)
                                    .lineLimit(lineCount)
                                    .padding(.leading, 5)
                            }
                        }
                        .swipeActions {
                            Button("Delete", role: .destructive) {
                                modelContext.delete(note)
                            }
                        }
                    }
                    
                }
            }
            .navigationTitle("Notes")
        }
    }
    
}

#Preview {
    MainView()
        .modelContainer(for: Note.self, inMemory: true)
}
