//
//  Picture.swift
//  MyMessager_GB
//
//  Created by Valentin Mironov on 09.05.2021.
//

import UIKit
class Picture{
    var image: UIImage?
    lazy var likeCount: Int = 0
    var isLiking:Bool = false
    
    init(image: UIImage?) {
        self.image = image
        likeCount = Int.random(in: 0...1200)
    }
    
}
