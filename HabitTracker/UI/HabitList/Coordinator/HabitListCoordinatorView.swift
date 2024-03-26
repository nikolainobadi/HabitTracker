//
//  HabitListCoordinatorView.swift
//  HabitTracker
//
//  Created by Nikolai Nobadi on 3/14/24.
//

import SwiftUI

struct HabitListCoordinatorView: View {
    @State private var path: [Habit] = []
    @State private var list: [Habit] = Habit.sampleList
    
    var body: some View {
        NavigationStack(path: $path) {
            HabitListView(habits: list, onEvent: onHabitListEvent(_:))
                .navigationTitle("My LIst")
                .navigationDestination(for: Habit.self) { habitToShow in
                    Text(habitToShow.name)
                }
        }
    }
}


// MARK: - Private
private extension HabitListCoordinatorView {
    func onHabitListEvent(_ event: HabitListEvent<Habit>) {
        switch event {
        case .onSelection(let habit):
            path.append(habit)
        case .onDelete(let habit):
            print("delete", habit.name)
        }
    }
}

#Preview {
    HabitListCoordinatorView()
}

struct Habit {
    var id: String = ""
    var name: String = ""
}

extension Habit: HabitRowData { }

extension Habit {
    static var sampleList: [Habit] {
        return ["0", "1", "2"].map({ .init(id: $0, name: $0) })
    }
}
