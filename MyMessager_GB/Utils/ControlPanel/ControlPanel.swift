//
//  ControlPanel.swift
//  MyMessager_GB
//
//  Created by Valentin Mironov on 12.05.2021.
//

import UIKit
protocol ControlPanel: UIView {
    var position: Position { get set }
    var likeControl: LikeControl { get }
    var commentControl: CommentControl { get }
    func updateSize()
}
class ControlPanelImpl: UIView, ControlPanel {
    var likeControl: LikeControl
    var commentControl: CommentControl
    var position: Position = .right
    var constantConstrain: CGFloat = 8
    var constantConstrainSpasing: CGFloat = 148
    
    override init(frame: CGRect) {
        likeControl = LikeControlImpl()
        commentControl = CommentControlImpl()
        
        super.init(frame: frame)
//        sub()
    }
    
    required init?(coder: NSCoder) {
        likeControl = LikeControlImpl()
        commentControl = CommentControlImpl()
        
        super.init(coder: coder)
//        sub()
    }
    
    
    //MARK: - layoutSubviews
    override func layoutSubviews() {
        super.layoutSubviews()
        addSubview(likeControl)
        addSubview(commentControl)
        updateSize()
    }
    func sub(){
        likeControl.addTarget(self, action: #selector(updateSize), for: .valueChanged)
    }
    
    @objc func updateSize(){
        let likeControlFullWight = constantConstrain + constantConstrainSpasing + likeControl.getFullWight()
        likeControl.frame = CGRect(x: constantConstrain, y: 0, width: self.layer.bounds.height, height: self.layer.bounds.height)
        commentControl.frame = CGRect(x: likeControlFullWight, y: 0, width: self.layer.bounds.height, height: self.layer.bounds.height)
    }
    
    private func setConstraintLikeControl(){
        likeControl.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: constantConstrain).isActive = true
        likeControl.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    private func setConstraintCommentControl(){
        likeControl.leadingAnchor.constraint(equalTo: likeControl.countersLabel.trailingAnchor, constant: constantConstrainSpasing).isActive = true
        commentControl.centerYAnchor.constraint(equalTo: likeControl.centerYAnchor).isActive = true
        commentControl.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: constantConstrain).isActive = true
    }
    
    private func setAllConstarit(){
        setConstraintLikeControl()
        setConstraintCommentControl()
    }
    
}
