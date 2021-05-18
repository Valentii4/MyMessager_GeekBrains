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
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(picture: Picture){
        self.model = picture
        presonePhoto.setter(likeCount: picture.likeCount, isLike: picture.isLiking, comentCount: picture.commentCount, image: picture.image ?? UIImage(systemName: "persone")!)
        presonePhoto.translatesAutoresizingMaskIntoConstraints = false
    }
    
    @objc private func likeTarget(){
        model?.likeCount = presonePhoto.controlPanel.likeControl.counter
        model?.isLiking = presonePhoto.controlPanel.likeControl.isLiking
    }
}
