//
//  Note.swift
//  ToDo Watch App
//
//  Created by Hakob Ghlijyan on 12/14/24.
//

import SwiftUI
import SwiftData

@Model
final class Note: Identifiable {
    var id: UUID
    var title: String
    var date: Date
    
    init(title: String, date: Date = .now) {
        self.id = UUID()
        self.title = title
        self.date = date
    }
}
