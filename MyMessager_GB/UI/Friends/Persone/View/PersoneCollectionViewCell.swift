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
        self.presonePhoto.photo.image = picture.image
        presonePhoto.controlPanel.likeControl.counter = picture.likeCount
        presonePhoto.controlPanel.likeControl.isLiking = picture.isLiking
        presonePhoto.controlPanel.likeControl.addTarget(self, action: #selector(likeTarget), for: .valueChanged)
    }
    
    @objc private func likeTarget(){
        model?.likeCount = presonePhoto.controlPanel.likeControl.counter
        model?.isLiking = presonePhoto.controlPanel.likeControl.isLiking
    }
}
