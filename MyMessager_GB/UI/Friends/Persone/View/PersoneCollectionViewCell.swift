//
//  PersoneCollectionViewCell.swift
//  MyMessager_GB
//
//  Created by Valentin Mironov on 04.05.2021.
//

import UIKit

class PersoneCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = "PersoneCollectionViewCell"
    private weak var model: Picture?
//    var tappedLike: ((_ model: Picture?) -> ())?
    
    @IBOutlet private weak var picture: UIImageView!
    @IBOutlet private weak var likeControll: LikeControlImpl!
    
    func configure(picture: Picture){
        self.model = picture
        self.picture.image = picture.image
        likeControll.countLikes = picture.likeCount
        likeControll.isLiking = picture.isLiking
        likeControll.addTarget(self, action: #selector(likeTarget), for: .valueChanged)
    }
    
    @objc private func likeTarget(){
        model?.likeCount = likeControll.countLikes
        model?.isLiking = likeControll.isLiking
    }
}
