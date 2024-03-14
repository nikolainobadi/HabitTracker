//
//  HabitListView.swift
//  HabitTracker
//
//  Created by Nikolai Nobadi on 3/14/24.
//

import SwiftUI

struct HabitListView: View {
    let habits: [String] = ["1", "2", "3"]
    
    var body: some View {
        List {
            ForEach(habits, id: \.self) { habit in
                HabitRow(habit: habit)
            }
        }
    }
}


// MARK: - Row
fileprivate struct HabitRow: View {
    let habit: String
    
    var body: some View {
        Text(habit)
    }
}


// MARK: - Preview
#Preview {
    HabitListView()
}
