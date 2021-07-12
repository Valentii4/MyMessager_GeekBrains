//
//  PersonePhoto.swift
//  MyMessager_GB
//
//  Created by Valentin Mironov on 10.05.2021.
//

import UIKit

protocol PhotoWithControlPanel: UIView {
    var photo: Photo { get }
    var controlPanel: ControlPanel { get }
}

@IBDesignable
class PersonePhoto: UIView, PhotoWithControlPanel {
    var photo: Photo = PhotoImpl()
    var controlPanel: ControlPanel = ControlPanelImpl()
    
    
    @IBInspectable var image: UIImage?{
        get{
            photo.image
        }
        set{
            photo.image = newValue
        }
    }
    @IBInspectable var likeCount: Int {
        get {
            controlPanel.likeControl.counter
        }
        set{
            controlPanel.likeControl.counter = newValue
        }
    }
    @IBInspectable var commentCount: Int {
        get{
            controlPanel.commentControl.counter
        }
        set{
            controlPanel.commentControl.counter = newValue
        }
    }
    @IBInspectable var isLiking: Bool{
        get{
            controlPanel.likeControl.isLiking
        }
        set{
            controlPanel.likeControl.isLiking = newValue
        }
    }
    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        updateSize()
//    }
//
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//        updateSize()
//    }
    
    //MARK: - layoutSubviews
    var isSetingsConstraint = false
    override func layoutSubviews() {
        super.layoutSubviews()
        addSubview(photo)
        addSubview(controlPanel)
        controlPanel.commentControl.color  = .blue
        if !isSetingsConstraint{
            updateSize()
            isSetingsConstraint = true
        }
    }
    
    func setter(likeCount: Int, isLike: Bool, comentCount: Int, image: UIImage){
        self.controlPanel.likeControl.counter = likeCount
        self.controlPanel.likeControl.isLiking = isLike
        self.controlPanel.commentControl.counter = comentCount
        self.photo.image = image
    }
    
    func setter(publication: Publication){
        setter(likeCount: publication.likeCount, isLike: publication.isLikingPost, comentCount: publication.commentCount, image: publication.imagePost ?? UIImage(systemName: "scribble.variable")!)
    }
    
    private func updateSize(){
        photo.frame = CGRect(x: 0, y: 0, width: bounds.width, height: bounds.width)
        controlPanel.frame = CGRect(x: photo.frame.minX, y: photo.frame.maxY, width: photo.frame.width, height: PersonePhoto.heightLikeControl(wightView: photo.frame.width))
        photo.topAnchor.constraint(equalTo: topAnchor).isActive = true
        photo.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        photo.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        photo.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1.5).isActive = true
        photo.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 1.5).isActive = true
        controlPanel.topAnchor.constraint(equalTo: photo.bottomAnchor, constant: 0).isActive = true
        controlPanel.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.1).isActive = true
        controlPanel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1).isActive = true
        controlPanel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        controlPanel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        controlPanel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        controlPanel.translatesAutoresizingMaskIntoConstraints = true
        photo.translatesAutoresizingMaskIntoConstraints = true
    }
    
    private func setConstreint(){
//        photo.bottomAnchor.constraint(equalTo: controlPanel.topAnchor,constant: 0).isActive = true
    }

    
    //MARK: - Static
    static func getHight(with wight: CGFloat) -> CGFloat{
        wight + heightLikeControl(wightView: wight)
    }
    
    static private func heightLikeControl(wightView: CGFloat) -> CGFloat{
        likeControlHightMultiplier * wightView
    }
    static private let likeControlHightMultiplier: CGFloat = 0.1
    
}
