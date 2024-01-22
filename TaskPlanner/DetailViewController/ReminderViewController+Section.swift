//
//  ReminderViewController+Section.swift
//  TaskPlanner
//
//  Created by Test on 22.01.24.
//

import Foundation

extension ReminderViewController {
    enum Section: Int, Hashable {
        case view
        case title
        case date
        case note
        
        var name: String {
            switch self {
            case .view: return ""
            case .title: return NSLocalizedString("Title", comment: "Title section name")
            case .date: return NSLocalizedString("Date", comment: "Date section name")
            case .note: return NSLocalizedString("Note", comment: "Note section name")
            }
        }
    }
}
