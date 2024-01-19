//
//  Reminder.swift
//  TaskPlanner
//
//  Created by Test on 19.01.24.
//

import Foundation

struct Reminder {
    var title: String
    var dueDate: Date
    var note: String? = nil
    var isCompleted: Bool = false
}


#if DEBUG
extension Reminder {
    static var sampleData = [
            Reminder(
                title: "Submit reimbursement report", dueDate: Date().addingTimeInterval(800.0),
                note: "Don't forget about taxi receipts"),
            Reminder(
                title: "Code review", dueDate: Date().addingTimeInterval(14000.0),
                note: "Check tech specs in shared folder", isCompleted: true),
            Reminder(
                title: "Pick up new contacts", dueDate: Date().addingTimeInterval(24000.0),
                note: "Optometrist closes at 6:00PM"),
            Reminder(
                title: "Add notes to retrospective", dueDate: Date().addingTimeInterval(3200.0),
                note: "Collaborate with project manager", isCompleted: true),
            Reminder(
                title: "Interview new project manager candidate",
                dueDate: Date().addingTimeInterval(60000.0), note: "Review portfolio"),
            Reminder(
                title: "Mock up onboarding experience", dueDate: Date().addingTimeInterval(72000.0),
                note: "Think different"),
            Reminder(
                title: "Review usage analytics", dueDate: Date().addingTimeInterval(83000.0),
                note: "Discuss trends with management"),
            Reminder(
                title: "Confirm group reservation", dueDate: Date().addingTimeInterval(92500.0),
                note: "Ask about space heaters"),
            Reminder(
                title: "Add beta testers to TestFlight", dueDate: Date().addingTimeInterval(101000.0),
                note: "v0.9 out on Friday")
        ]
}
#endif
