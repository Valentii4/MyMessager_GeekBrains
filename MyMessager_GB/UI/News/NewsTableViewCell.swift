//
//  NewsTableViewCell.swift
//  MyMessager_GB
//
//  Created by Valentin Mironov on 14.05.2021.
//

import UIKit
class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var postView: PersonePhoto!
    @IBOutlet weak var senderView: SenderView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    static let identifire = "NewsTableViewCell"
    
    func configure(publication: Publication){
        postView.setter(publication: publication)
        senderView.sender = publication.sender
        descriptionLabel.text = publication.subtitleText
    }

}
