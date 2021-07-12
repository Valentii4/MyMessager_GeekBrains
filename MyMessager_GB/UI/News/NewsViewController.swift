//
//  NewsViewController.swift
//  MyMessager_GB
//
//  Created by Valentin Mironov on 14.05.2021.
//

import UIKit

class NewsViewController: UIViewController {


    lazy var news: [Publication] = NewsPublication.getExaplePost()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "NewsTableViewCell" , bundle: nil), forCellReuseIdentifier: NewsTableViewCell.identifire)
    }
    

}
extension NewsViewController: UITableViewDelegate, UITableViewDataSource{
    
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.identifire) as? NewsTableViewCell else{
            print("news cell equal nil")
            return UITableViewCell()
        }
        let new = news[indexPath.row]
        cell.configure(publication: new)
        return cell
    }
    
    
}
