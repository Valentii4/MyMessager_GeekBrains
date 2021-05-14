//
//  PersonePhoto.swift
//  MyMessager_GB
//
//  Created by Valentin Mironov on 10.05.2021.
//

import UIKit

protocol PhotoWithControlPanel: UIView {
    var photo: Photo { get }
//    var likeControl: LikeControl { get }
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
    
    
    //MARK: - layoutSubviews
    override func layoutSubviews() {
        super.layoutSubviews()
        addSubview(photo)
        addSubview(controlPanel)
        
        controlPanel.commentControl.color  = .blue
        updateSize()
        setConstreint()
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
        frame = CGRect(x: framePoint.x, y: framePoint.y, width: frameWight, height: frameHight)
        let photoShadowRadius = photo.shadowRadius
        photo.frame = CGRect(x: bounds.minX + photoShadowRadius, y: bounds.minY + photoShadowRadius, width: bounds.width - photoShadowRadius * 2.1, height: bounds.width - photoShadowRadius * 2.1)
        let likeControlWightAndHight = PersonePhoto.heightLikeControl(wightView: frameWight)
        controlPanel.frame = CGRect(x: photo.bounds.minX + photo.shadowRadius, y: photo.bounds.maxY + photo.shadowRadius, width: photo.bounds.width, height: likeControlWightAndHight)
    }
    
    private func setConstreint(){
        photo.bottomAnchor.constraint(equalTo: controlPanel.topAnchor,constant: 0).isActive = true
    }
    
    //MARK: - Frame
    private var frameWight: CGFloat = 0
    private var frameHight: CGFloat = 0
    private var framePoint: CGPoint = CGPoint(x: 0, y: 0)
    
    override var frame: CGRect {
        didSet{
            frameWight = frame.width
            frameHight = PersonePhoto.getHight(with: frameWight)
            framePoint = CGPoint(x: frame.minX, y: frame.minY)
        }
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
