//
//  FrendTableViewCell.swift
//  MyMessager_GB
//
//  Created by Valentin Mironov on 04.05.2021.
//

import UIKit

class FrendTableViewCell: UITableViewCell {

    static let reuseIdentifier = "FrendTableViewCell"

    
    @IBOutlet weak var picture: PersonePhoto!
    @IBOutlet weak var nameAndSurnameLabel: UILabel!
    
    func configure(nameAndSurname: String, image: UIImage) {
        picture.image = image
        nameAndSurnameLabel.text = nameAndSurname
    }
}
