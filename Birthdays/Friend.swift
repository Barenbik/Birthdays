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
    let name: String
    let birthday: Date
    let note: String
    
    init(name: String, birthday: Date, note: String) {
        self.name = name
        self.birthday = birthday
        self.note = note
    }
    
    var isBirthdayToday: Bool {
        Calendar.current.isDateInToday(birthday)
    }
}
