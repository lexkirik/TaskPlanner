//
//  ReminderStore.swift
//  TaskPlanner
//
//  Created by Test on 25.01.24.
//

import Foundation
import EventKit

final class ReminderStore{
    static let shared = ReminderStore()
    
    private let ekStore = EKEventStore()
    
    var isAvailable: Bool {
        EKEventStore.authorizationStatus(for: .reminder) == .fullAccess
    }
    
    func requestAccess() async throws {
        let status = EKEventStore.authorizationStatus(for: .reminder)
        switch status {
        case .notDetermined:
            let accessGranted = try await ekStore.requestFullAccessToReminders()
            guard accessGranted else {
                throw TaskPlannerError.accesDenied
            }
        case .restricted:
            throw TaskPlannerError.accessRestricted
        case .denied:
            throw TaskPlannerError.accesDenied
        case .fullAccess:
            return
        case .writeOnly:
            throw TaskPlannerError.accessRestricted
        case .authorized:
            return
        @unknown default:
            throw TaskPlannerError.unknown
        }
    }
    
    func readAll() async throws -> [Reminder] {
        guard isAvailable else {
            throw TaskPlannerError.accesDenied
        }
        
        let predicate = ekStore.predicateForReminders(in: nil)
        let ekReminders = try await ekStore.reminders(matching: predicate)
        let reminders: [Reminder] = try ekReminders.compactMap { ekReminder in
            do {
                return try Reminder(with: ekReminder)
            } catch TaskPlannerError.reminderHasNoDueDate {
                return nil
            }
        }
        return reminders
    }
}
