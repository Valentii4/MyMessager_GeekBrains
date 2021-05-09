//
//  Picture.swift
//  MyMessager_GB
//
//  Created by Valentin Mironov on 09.05.2021.
//

import UIKit
struct Picture{
    var image: UIImage?
    var likeCount: Int = 0
    var isLiking:Bool = false
    
    init(image: UIImage?) {
        self.image = image
    }
    
}
