//
//  GorupsViewModel.swift
//  MyMessager_GB
//
//  Created by Valentin Mironov on 07.05.2021.
//

import Foundation
protocol GroupsViewModel {
    var numberOfSections: Int { get }
    func numberOfRowsInSection(sections: Int) -> Int
    func groupViewModel(sections: Int, row: Int) -> GroupCellViewModel
    func updateGroups()
}
