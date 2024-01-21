//
//  ReminderListViewController+Actions.swift
//  TaskPlanner
//
//  Created by Test on 21.01.24.
//

import UIKit

extension ReminderListViewController {
    @objc func didPressDoneButton(_ sender: ReminderDoneButton) {
        guard let id = sender.id else {return}
        completeReminder(withId: id)
    }
}
