//
//  PersoneCollectionViewCell.swift
//  MyMessager_GB
//
//  Created by Valentin Mironov on 04.05.2021.
//

import UIKit

class PersoneCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = "PersoneCollectionViewCell"
    @IBOutlet private weak var picture: UIImageView!
    @IBOutlet private weak var likeControll: LikeControl!
    func configure(image: UIImage?, countLikes: Int?, isLiking: Bool?){
        picture.image = image
        likeControll.countLikes = countLikes ?? 0
        likeControll.isLiking = isLiking ?? false
    }
}
