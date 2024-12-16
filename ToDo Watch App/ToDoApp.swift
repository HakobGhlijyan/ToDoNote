//
//  ToDoApp.swift
//  ToDo Watch App
//
//  Created by Hakob Ghlijyan on 12/14/24.
//

import SwiftUI

@main
struct ToDo_Watch_AppApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
                .modelContainer(for: Note.self)
        }
    }
}
