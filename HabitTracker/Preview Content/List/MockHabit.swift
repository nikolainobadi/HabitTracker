//
//  MockHabit.swift
//  HabitTracker
//
//  Created by Nikolai Nobadi on 3/14/24.
//

struct MockHabit: HabitRowData {
    var id: String = ""
    var name: String = ""
}

extension MockHabit {
    static var sampleList: [MockHabit] {
        return ["0", "1", "2"].map({ .init(id: $0, name: $0) })
    }
}
