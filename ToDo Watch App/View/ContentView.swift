//
//  ContentView.swift
//  ToDo Watch App
//
//  Created by Hakob Ghlijyan on 12/14/24.
//

import SwiftUI

struct ContentView: View {
    @State private var notes: [Note] = []
    @State private var text: String = ""
    let urlPath: String = "notes"
    
    @AppStorage("linecount") private var lineCount: Int = 1
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack(alignment: .center, spacing: 6) {
                    TextField("Add New Note", text: $text)
                    Button {
                        // 1. Запускайте действие кнопки только в том случае, если текстовое поле не пусто
                        // 1. Only run the button's action when the text field is not empty
                        guard text.isEmpty == false else { return }
                        // 2. Создайте новый элемент note и инициализируйте его значением text
                        // 2. Create a new note item and initialize it with the text value
                        let note = Note(id: UUID(), title: text)
                        // 3. Добавьте новый элемент note в массив notes (добавить)
                        // 3. Add the new note item to the notes array (append)
                        notes.append(note)
                        // 4. Сделайте текстовое поле пустым
                        // 4. Make text field empty
                        text = ""
                        // 5. Сохраните заметки (функция)
                        // 5. Save the notes (function)
                        save()
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
                    List {
                        ForEach(0 ..< notes.count, id: \.self) { i in
                            NavigationLink {
                                DetailView(note: notes[i], count: notes.count, index: i)
                            } label: {
                                HStack {
                                    Capsule()
                                        .frame(width: 4)
                                        .foregroundStyle(.accent)
                                    Text(notes[i].title)
//                                        .lineLimit(1)
                                        .lineLimit(lineCount)
                                        .padding(.leading, 5)
                                }
                            }

                        }
                        .onDelete(perform: delete)
                    }
                }
            }
            .navigationTitle("Notes")
            .onAppear {
                load()
            }
        }
    }
    
    func save() {
        do {
            // 1. Преобразуйте массив notes в данные с помощью JSONEncoder
            // 1. Convert the notes array to data using JSONEncoder
            let data = try JSONEncoder().encode(notes)
            // 2. Создайте новый URL для сохранения файла, используя getDocumentDirectory
            // 2. Create new URL to save the file using the getDocumentDirectory
            let url = getDocumentDirectory().appendingPathComponent(urlPath)
            // 3. Запишите данные на указанный URL
            // 3. Write the data to the given URL
            try data.write(to: url)
        } catch {
            print("Saving data has failed!!!")
            print(error.localizedDescription)
        }
    }
    
    func load() {
        DispatchQueue.main.async {
            do {
                //1. Получите URL-адрес notes
                //1. Get the notes URL path
                let url = getDocumentDirectory().appendingPathComponent(urlPath)
                //2. Создайте новое свойство для данных
                //2. Create a new property for the data
                let data = try Data(contentsOf: url)
                //3. Расшифруйте данные
                //3. Decode the data
                notes = try JSONDecoder().decode([Note].self, from: data)
            } catch {
                print("Loading data has failed!!!")
                print(error.localizedDescription)
            }
        }
    }
    
    func delete(offsets: IndexSet) {
        withAnimation(.snappy) {
            notes.remove(atOffsets: offsets)
            save()
        }
    }
    
    func getDocumentDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}

#Preview {
    ContentView()
}
