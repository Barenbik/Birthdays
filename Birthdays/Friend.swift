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
    
    init(name: String, birthday: Date) {
        self.name = name
        self.birthday = birthday
    }
}
