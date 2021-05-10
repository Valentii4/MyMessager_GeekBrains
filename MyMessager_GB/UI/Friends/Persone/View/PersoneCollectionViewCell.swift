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
    
    @IBOutlet private weak var presonePhoto: PersonePhoto!
    
    func configure(picture: Picture){
        self.model = picture
        self.presonePhoto.image = picture.image
        presonePhoto.countLikes = picture.likeCount
        presonePhoto.isLiking = picture.isLiking
        presonePhoto.addTarget(self, action: #selector(likeTarget), for: .valueChanged)
    }
    
    @objc private func likeTarget(){
        model?.likeCount = presonePhoto.countLikes
        model?.isLiking = presonePhoto.isLiking
    }
}
