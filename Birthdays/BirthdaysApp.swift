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
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Friend.self)
        }
    }
}
