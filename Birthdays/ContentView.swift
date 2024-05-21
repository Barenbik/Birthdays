//
//  ContentView.swift
//  Birthdays
//
//  Created by Tony Sharples on 21/05/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var friends: [Friend] = [
        Friend(name: "Raimy", birthday: .now),
        Friend(name: "Tali", birthday: Date(timeIntervalSince1970: 0))
    ]
    
    var body: some View {
        NavigationStack {
            List(friends, id: \.name) { friend in
                HStack {
                    Text(friend.name)
                    Spacer()
                    Text(friend.birthday, format: .dateTime.month(.wide).day().year())
                }
            }
            .navigationTitle("Birthdays")
        }
    }
}

#Preview {
    ContentView()
}
