//
//  HabitListView.swift
//  HabitTracker
//
//  Created by Nikolai Nobadi on 3/14/24.
//

import SwiftUI

struct HabitListView<Habit: HabitRowData>: View {
    let habits: [Habit]
    
    var body: some View {
        List {
            ForEach(habits) { habit in
                HabitRow(habit: habit)
            }
        }
    }
}


// MARK: - Row
fileprivate struct HabitRow<Habit: HabitRowData>: View {
    let habit: Habit
    
    var body: some View {
        Text(habit.name)
    }
}


// MARK: - Preview
#Preview {
    HabitListView<MockHabit>(habits: [])
}


// MARK: - Dependencies
protocol HabitRowData: Identifiable {
    var id: String { get }
    var name: String { get }
}
