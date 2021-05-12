//
//  CommentControl.swift
//  MyMessager_GB
//
//  Created by Valentin Mironov on 12.05.2021.
//

import UIKit
protocol CommentControl: Control {

}

@IBDesignable class CommetnsControlImpl: UIControl, CommentControl{
    func addTargetCommentConrol(_ target: Any?, action: Selector, for controlEvents: UIControl.Event) {
        self.addTarget(target, action: action, for: controlEvents)
    }
    
    var counter: Int = 0
    
    var color: UIColor = .blue
    
    var imageView: UIImageView = UIImageView()
    
    var countersLabel: UILabel = UILabel()
    
    private func setCountCommentsLabel(){
        addSubview(countersLabel)
        let countersLabelString: String?
        
        switch counter {
        case 0..<1000:
            countersLabelString = String(counter)
        case 1000..<1_000_000:
            countersLabelString = String(counter/1000) + "k"
        default:
            countersLabelString = "-"
        }
        countersLabel.textColor = color
        countersLabel.translatesAutoresizingMaskIntoConstraints = false
        countersLabel.text = countersLabelString
        
        countersLabel.trailingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: -8).isActive = true
        countersLabel.centerYAnchor.constraint(equalTo: imageView.centerYAnchor).isActive = true
    }
    
}
