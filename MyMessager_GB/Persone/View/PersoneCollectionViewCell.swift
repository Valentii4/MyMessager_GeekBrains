//
//  PersoneCollectionViewCell.swift
//  MyMessager_GB
//
//  Created by Valentin Mironov on 04.05.2021.
//

import UIKit

class PersoneCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = "PersoneCollectionViewCell"
    @IBOutlet weak var picture: UIImageView!
    func configure(image: UIImage){
        picture.image = image
    }
}
