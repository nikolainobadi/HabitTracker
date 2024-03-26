//
//  HabitListView.swift
//  HabitTracker
//
//  Created by Nikolai Nobadi on 3/14/24.
//

import SwiftUI

struct HabitListView<Habit: HabitRowData>: View {
    let habits: [Habit]
    let onEvent: (HabitListEvent<Habit>) -> Void
    
    var body: some View {
        List {
            ForEach(habits) { habit in
                HabitRow(habit: habit)
                    .onTapGesture {
                        onEvent(.onSelection(habit))
                    }
                    .swipeActions {
                        Button(action: {
                            onEvent(.onDelete(habit))
                        }) {
                            Image(systemName: "trash")
                                .tint(.red)
                        }
                    }
            }
        }
    }
}


// MARK: - Row
fileprivate struct HabitRow<Habit: HabitRowData>: View {
    let habit: Habit
    
    var body: some View {
        HStack {
            Text(habit.name)
            Spacer()
            Image(systemName: "chevron.right")
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .contentShape(Rectangle())
    }
}


// MARK: - Preview
#Preview {
    HabitListView<MockHabit>(habits: MockHabit.sampleList, onEvent: { _ in })
}


// MARK: - Dependencies
enum HabitListEvent<Habit: HabitRowData> {
    case onSelection(Habit)
    case onDelete(Habit)
}

protocol HabitRowData: Identifiable, Hashable {
    var id: String { get }
    var name: String { get }
}
