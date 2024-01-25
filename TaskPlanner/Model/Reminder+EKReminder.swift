//
//  Reminder+EKReminder.swift
//  TaskPlanner
//
//  Created by Test on 25.01.24.
//

import Foundation
import EventKit

extension Reminder {
    init(with ekReminder: EKReminder) throws {
        guard let dueDate = ekReminder.alarms?.first?.absoluteDate else {
            throw TaskPlannerError.reminderHasNoDueDate
        }
        id = ekReminder.calendarItemIdentifier
        title = ekReminder.title
        self.dueDate = dueDate
        note = ekReminder.notes
        isCompleted = ekReminder.isCompleted
    }
}
