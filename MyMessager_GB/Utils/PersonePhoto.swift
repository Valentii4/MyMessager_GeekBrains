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
//    var likeControl: LikeControl = LikeControlImpl()
    var controlPanel: ControlPanel = ControlPanelImpl()
    
    //MARK: - layoutSubviews
    override func layoutSubviews() {
        super.layoutSubviews()
        addSubview(photo)
        addSubview(controlPanel)
        
        controlPanel.commentControl.color  = .blue
        updateSize()
        setConstreint()
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
