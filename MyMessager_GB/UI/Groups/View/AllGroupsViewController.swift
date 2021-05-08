//
//  AllGroupsViewController.swift
//  MyMessager_GB
//
//  Created by Valentin Mironov on 07.05.2021.
//

import Foundation
import UIKit

class AllGroupsViewController: UIViewController {

    var allGroupsViewModel: GroupsViewModel?
    
}

//MARK: - TableView
extension  AllGroupsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allGroupsViewModel?.numberOfRowsInSection(sections: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: GroupTableViewCell.idetifier, for: indexPath) as? GroupTableViewCell else{
            print("Not found cell", #function)
            return UITableViewCell()
        }
        cell.vm = allGroupsViewModel?.groupViewModel(sections: indexPath.section, row: indexPath.row)
        return cell
    }
    
}
