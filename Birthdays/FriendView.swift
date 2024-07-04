//
//  BirthdayView.swift
//  Birthdays
//
//  Created by Tony Sharples on 04/07/2024.
//

import SwiftUI

struct FriendView: View {
    @Bindable var friend: Friend
    
    let isNew: Bool
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    
    init(friend: Friend, isNew: Bool = false) {
        self.friend = friend
        self.isNew = isNew
    }
    
    var body: some View {
        Form {
            TextField("Name", text: $friend.name)
            TextField("Note", text: $friend.note)
            DatePicker("Birthday", selection: $friend.birthday, in: Date.distantPast...Date.now, displayedComponents: .date)
        }
        .navigationTitle(isNew ? "Add Friend" : "Friend")
        .toolbar {
            if isNew {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        modelContext.delete(friend)
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    FriendView(friend: Friend(name: "Tony", birthday: .now, note: "Tony is the best"))
        .modelContainer(for: Friend.self, inMemory: true)
}
