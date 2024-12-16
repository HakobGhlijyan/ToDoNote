//
//  ContentView.swift
//  ToDo Watch App
//
//  Created by Hakob Ghlijyan on 12/14/24.
//

import SwiftUI

struct MainView: View {
    @StateObject private var vm = MainViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack(alignment: .center, spacing: 6) {
                    TextField("Add New Note", text: $vm.text)
                    Button {
                        // 1. Запускайте действие кнопки только в том случае, если текстовое поле не пусто
                        // 1. Only run the button's action when the text field is not empty
                        guard vm.text.isEmpty == false else { return }
                        // 2. Создайте новый элемент note и инициализируйте его значением text
                        // 2. Create a new note item and initialize it with the text value
                        let note = Note(id: UUID(), title: vm.text)
                        // 3. Добавьте новый элемент note в массив notes (добавить)
                        // 3. Add the new note item to the notes array (append)
                        vm.notes.append(note)
                        // 4. Сделайте текстовое поле пустым
                        // 4. Make text field empty
                        vm.text = ""
                        // 5. Сохраните заметки (функция)
                        // 5. Save the notes (function)
                        vm.save()
                    } label: {
                        Image(systemName: "plus.circle")
                            .font(.title)
                    }
                    .disabled(vm.text.isEmpty)
                    .fixedSize()
                    .buttonStyle(.plain)
                    .foregroundStyle(.accent)
                }
                Spacer()
                
                if vm.notes.isEmpty {
                    Image(systemName: "note")
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(.gray)
                        .opacity(0.25)
                        .padding(10)
                } else {
                    List {
                        ForEach(0 ..< vm.notes.count, id: \.self) { i in
                            NavigationLink {
                                DetailView(note: vm.notes[i], count: vm.notes.count, index: i)
                            } label: {
                                HStack {
                                    Capsule()
                                        .frame(width: 4)
                                        .foregroundStyle(.accent)
                                    Text(vm.notes[i].title)
                                        .lineLimit(vm.appStorage.lineCount)
                                        .padding(.leading, 5)
                                }
                            }

                        }
                        .onDelete(perform: vm.delete)
                    }
                }
            }
            .navigationTitle("Notes")
            .onAppear {
                vm.load()
            }
        }
    }
}

#Preview {
    MainView()
}
