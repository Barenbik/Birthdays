//
//  Friend.swift
//  Birthdays
//
//  Created by Tony Sharples on 21/05/2024.
//

import Foundation
import SwiftData

@Model
class Friend {
    var name: String
    var birthday: Date
    var note: String
    
    init(name: String, birthday: Date, note: String) {
        self.name = name
        self.birthday = birthday
        self.note = note
    }
    
    var isBirthdayToday: Bool {
        Calendar.current.isDateInToday(birthday)
    }
}
