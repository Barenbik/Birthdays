//
//  ContentView.swift
//  Birthdays
//
//  Created by Tony Sharples on 21/05/2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var context
    
    @Query(sort: \Friend.name) private var friends: [Friend]
    
    @State private var newFriend: Friend?
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(friends) { friend in
                    NavigationLink {
                        FriendView(friend: friend)
                    } label: {
                        HStack {
                            if friend.isBirthdayToday {
                                Image(systemName: "birthday.cake")
                            }
                            
                            Text(friend.name)
                                .bold(friend.isBirthdayToday)
                            
                            Spacer()
                            
                            Text(friend.birthday, format: .dateTime.month(.wide).day().year())
                        }
                        
                    }
                }
            }
            .navigationTitle("Birthdays")
            .toolbar {
                ToolbarItem {
                    Button(action: addFriend) {
                        Label("Add Friend", systemImage: "plus")
                    }
                }
            }
            .sheet(item: $newFriend) { friend in
                NavigationStack {
                    FriendView(friend: friend, isNew: true)
                }
                .interactiveDismissDisabled()
            }
        }
    }
    
    private func addFriend() {
        let newItem = Friend(name: "", birthday: .now, note: "")
        
        context.insert(newItem)
        newFriend = newItem
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Friend.self, inMemory: true)
}
