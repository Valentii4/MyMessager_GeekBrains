//
//  Publication.swift
//  MyMessager_GB
//
//  Created by Valentin Mironov on 14.05.2021.
//

import UIKit
protocol Publication {
    var sender: Sender { get }
    var isLikingPost: Bool { get set}
    var imagePost: UIImage? { get set}
    var likeCount: Int { get set }
    var commentCount: Int { get set }
    var subtitleText: String? { get }
    var date: Date { get }
}

struct NewsPublication: Publication{
    var likeCount: Int
    
    var commentCount: Int
    
    var imagePost: UIImage?
    
    var isLikingPost: Bool
    
    var sender: Sender
    
    var subtitleText: String?
    
    var date: Date
    
    init(sender: Sender, isLikingPost: Bool, imagePost: UIImage?, likeCount: Int, commentCount: Int, _ subtitleText: String? = nil, date: Date = Date()){
        self.sender = sender
        self.imagePost = imagePost
        self.likeCount = likeCount
        self.commentCount = commentCount
        self.isLikingPost = isLikingPost
        self.subtitleText = subtitleText
        self.date = date
    }
    
    init(sender: Sender, post: Picture
            ,_ subtitleText: String?, _ date: Date = Date()) {
        self.sender = sender
        self.imagePost = post.image
        self.likeCount = post.likeCount
        self.commentCount = post.commentCount
        self.isLikingPost = post.isLiking
        self.subtitleText = subtitleText
        self.date = date
    }
    
    
    static func getExaplePost() -> [Publication]{
        let senders = Persone.frends
        var result: [Publication] = []
        for (index, sender) in senders.enumerated(){
            result.append(NewsPublication(sender: sender, post: sender.photos.first!, "Описание текста \(index)"))
        }
        return result
    }
}
