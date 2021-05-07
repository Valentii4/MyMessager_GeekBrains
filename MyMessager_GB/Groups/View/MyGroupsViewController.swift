//
//  MyGroupsViewController.swift
//  MyMessager_GB
//
//  Created by Valentin Mironov on 07.05.2021.
//

import UIKit

class MyGroupsViewController: UIViewController {

    var myGroupsViewModel: GroupsViewModel? = MyGroupsViewModel()
    
    @IBOutlet weak var tableview: UITableView!
    //MARK: - segue
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vc = segue.destination as? AllGroupsViewController else{
            return
        }
        vc.allGroupsViewModel = AllGroupsViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        myGroupsViewModel?.updateGroups()
        tableview.reloadData()
    }
    
}
//MARK: - TableView
extension MyGroupsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myGroupsViewModel?.numberOfRowsInSection(sections: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: GroupTableViewCell.idetifier, for: indexPath) as? GroupTableViewCell else{
            print("Not found cell", #function)
            return UITableViewCell()
        }
        cell.vm = myGroupsViewModel?.groupViewModel(sections: indexPath.section, row: indexPath.row)
        return cell
    }
    
}
