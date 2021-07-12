//
//  FriendsViewController.swift
//  MyMessager_GB
//
//  Created by Valentin Mironov on 27.04.2021.
//

import UIKit

final class FriendsViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var lettersControl: LettersControl!
    
    var friendsVM: FriendsTableViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        let letters = friendsVM?.firstLetters ?? []
        lettersControl.letters = letters
        lettersControl.backgroundColor = .clear
        lettersControl.addTarget(self, action: #selector(selectedLettersControl), for: .valueChanged)
        
        friendsVM?.updateTableView = { [weak self] in
            self?.tableView.reloadData()
            let letters = self?.friendsVM?.firstLetters ?? []
            self?.lettersControl.letters = letters
        }
        searchBar.delegate = self
        tableView.tableFooterView = UIView()
    }
    
    @objc private func selectedLettersControl(){
        guard let letter = lettersControl.selectedLetter, let vm = friendsVM else{
            return
        }
        let indexPath = vm.getIndexPathSelectedLetter(letter: letter)
        tableView.scrollToRow(at: indexPath, at: .top, animated: true)        
    }
    @IBAction func tapView(_ sender: Any) {
        view.endEditing(true)
    }
    
}

//MARK: - TableView
extension FriendsViewController: UITableViewDelegate, UITableViewDataSource{
    // MARK: - Table view data source
    func numberOfSections(in tableView: UITableView) -> Int {
        return friendsVM?.sectionsCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendsVM?.getRowsInSection(section: section) ?? 0
    }

    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return friendsVM?.getSectionsHeaderTitle(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FrendTableViewCell.reuseIdentifier, for: indexPath) as? FrendTableViewCell else{
            print("Error" + #function + #file)
            return UITableViewCell()
        }
        let row = indexPath.row
        let section = indexPath.section
        if let vm = friendsVM, let nameAndSurname = try? vm.getNameAndSurname(row: row, section: section){
            guard let image: UIImage =  (try? vm.getPhoto(row: row, section: section)) ?? UIImage(systemName: "person") else{
                print("Карнтика не установленна")
                return UITableViewCell()
            }
            cell.configure(nameAndSurname: nameAndSurname , image: image)
        }
        return cell
    }
}

//MARK: - SearchBar
extension FriendsViewController: UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        friendsVM?.updateFrendWithName(name: searchBar.text)
        view.endEditing(true)
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        friendsVM?.updateFrendWithName(name: nil)
        view.endEditing(true)
    }
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        friendsVM?.updateFrendWithName(name: searchBar.text)
        view.endEditing(true)
    }
}

//MARK: - segue
extension FriendsViewController{
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        identifier == "openPerson"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vc = segue.destination as? PersoneCollectionViewController,
              let indexPath = tableView.indexPathForSelectedRow else{
            return
        }
        vc.personeVM = try? friendsVM?.getPersonVM(row: indexPath.row, section: indexPath.section)
    }
    
}
