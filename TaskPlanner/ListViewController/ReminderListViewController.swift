//
//  ViewController.swift
//  TaskPlanner
//
//  Created by Test on 19.01.24.
//

import UIKit

class ReminderListViewController: UICollectionViewController {

    var dataSource: DataSource!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let listlayout = listlayout()
        collectionView.collectionViewLayout = listlayout
        
        let cellRegistration = UICollectionView.CellRegistration(handler: cellRegistrationHandler)
        
        dataSource = DataSource(collectionView: collectionView, cellProvider: { (collectionView: UICollectionView, indexPath: IndexPath, itemIdentifier: String) in
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
        })
        
        var snapshot = Snapshot()
        snapshot.appendSections([0])
        snapshot.appendItems(Reminder.sampleData.map {$0.title})
        dataSource.apply(snapshot)
        
        collectionView.dataSource = dataSource
    }

    private func listlayout() -> UICollectionViewCompositionalLayout {
        var listConfiguration = UICollectionLayoutListConfiguration(appearance: .grouped)
        listConfiguration.backgroundColor = .clear
        listConfiguration.showsSeparators = false
        
        return UICollectionViewCompositionalLayout.list(using: listConfiguration)
    }

}

