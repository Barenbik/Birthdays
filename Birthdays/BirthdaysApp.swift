//
//  BirthdaysApp.swift
//  Birthdays
//
//  Created by Tony Sharples on 21/05/2024.
//

import SwiftUI
import SwiftData

@main
struct BirthdaysApp: App {
    var modelContainer: ModelContainer = {
        let schema = Schema([
            Friend.self,
        ])
        
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(modelContainer)
    }
}
