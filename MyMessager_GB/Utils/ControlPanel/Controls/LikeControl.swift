//
//  LikeControl.swift
//  MyMessager_GB
//
//  Created by Valentin Mironov on 09.05.2021.
//

import UIKit

protocol LikeControl: Control{
    var isLiking: Bool { get set }
}

@IBDesignable class LikeControlImpl: ControlElement, LikeControl{

    //MARK: - likeControl
    var isLiking: Bool = false {
        didSet{
            setImage()
        }
    }
    
    override func setImage(){
        if isLiking{
            imageView.image = UIImage(systemName: "heart.fill")
        }else{
            imageView.image = UIImage(systemName: "heart")
        }
    }
    
    @objc override func tapControl(){
        isLiking.toggle()
        if isLiking{
            counter += 1
        }else{
            counter -= 1
        }
    }
    
}
