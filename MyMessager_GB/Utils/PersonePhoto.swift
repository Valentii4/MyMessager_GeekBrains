//
//  PersonePhoto.swift
//  MyMessager_GB
//
//  Created by Valentin Mironov on 10.05.2021.
//

import UIKit

@IBDesignable class PersonePhoto: UIView {

    @IBInspectable  let photo: PhotoImpl = PhotoImpl()
    @IBInspectable  let likeControl: LikeControlImpl = LikeControlImpl()
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
