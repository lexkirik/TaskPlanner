//
//  EKEventStore+AsyncFetch.swift
//  TaskPlanner
//
//  Created by Test on 25.01.24.
//

import Foundation
import EventKit

extension EKEventStore {
    func reminders(matching predicate: NSPredicate) async throws -> [EKReminder] {
        try await withCheckedThrowingContinuation { continuation in
            fetchReminders(matching: predicate) { reminders in
                if let reminders {
                    continuation.resume(returning: reminders)
                } else {
                    continuation.resume(throwing: TaskPlannerError.failedReadingReminders)
                }
            }
        }
    }
}
