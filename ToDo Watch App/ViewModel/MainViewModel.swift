//
//  MainViewModel.swift
//  ToDo Watch App
//
//  Created by Hakob Ghlijyan on 12/16/24.
//

import SwiftUI

final class MainViewModel: ObservableObject {
    let appStorage = AppStorageConstants.shared
    @Published var notes: [Note] = []
    @Published var text: String = ""
    let urlPath: String = "notes"
    
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
                let url = self.getDocumentDirectory().appendingPathComponent(self.urlPath)
                //2. Создайте новое свойство для данных
                //2. Create a new property for the data
                let data = try Data(contentsOf: url)
                //3. Расшифруйте данные
                //3. Decode the data
                self.notes = try JSONDecoder().decode([Note].self, from: data)
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
