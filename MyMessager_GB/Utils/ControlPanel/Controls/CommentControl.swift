//
//  CommentControl.swift
//  MyMessager_GB
//
//  Created by Valentin Mironov on 12.05.2021.
//

import UIKit
protocol CommentControl: Control {

}

class CommentControlImpl: ControlElement, CommentControl {
    override func setImage(){
        imageView.image = UIImage(systemName: "bubble.middle.bottom")
    }
}
