//
//  FriendsViewController.swift
//  MyMessager_GB
//
//  Created by Valentin Mironov on 27.04.2021.
//

import UIKit

final class FriendsViewController: UITableViewController {

    var frendsVM: FriendsTableViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return frendsVM?.rows ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FrendTableViewCell.reuseIdentifier, for: indexPath) as? FrendTableViewCell else{
            print("Error" + #function + #file)
            return UITableViewCell()
        }
        if let vm = frendsVM, let nameAndSurname = try? vm.getNameAndSurname(index: indexPath.row){
            guard let image: UIImage =  (try? vm.getPhoto(index: indexPath.row)) ?? UIImage(systemName: "person") else{
                print("Карнтика не установленна")
                return UITableViewCell()
            }
            cell.configure(nameAndSurname: nameAndSurname , image: image)
        }
        return cell
    }
}

//MARK: - segue
extension FriendsViewController{
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        identifier == "openPerson"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vc = segue.destination as? PersoneCollectionViewController,
              let row = tableView.indexPathForSelectedRow?.row else{
            return
        }
        vc.personeVM = try? frendsVM?.getPersonVM(index: row)
    }
    
}
