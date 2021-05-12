//
//  PersonePhoto.swift
//  MyMessager_GB
//
//  Created by Valentin Mironov on 10.05.2021.
//

import UIKit

protocol PhotoWithControlPanel: UIView {
    var photo: Photo { get }
    var likeControl: LikeControl { get }
//    var likeControl: LikeControl
}

@IBDesignable
class PersonePhoto: UIView, PhotoWithControlPanel {
    var photo: Photo = PhotoImpl()
    var likeControl: LikeControl = LikeControlImpl()
    
    //MARK: - layoutSubviews
    override func layoutSubviews() {
        super.layoutSubviews()
        addSubview(photo)
        addSubview(likeControl)
        
        updateSize()
    }
    
    func updateSize(){
        frame = CGRect(x: framePoint.x, y: framePoint.y, width: frameWight, height: frameHight)
        let photoShadowRadius = photo.shadowRadius
        photo.frame = CGRect(x: bounds.minX + photoShadowRadius, y: bounds.minY + photoShadowRadius, width: bounds.width - photoShadowRadius * 2.1, height: bounds.width - photoShadowRadius * 2.1)
        let likeControlWightAndHight = PersonePhoto.heightLikeControl(wightView: frameWight)
        likeControl.frame = CGRect(x: photo.bounds.maxX - likeControlWightAndHight, y: photo.bounds.maxY + photo.shadowRadius, width: likeControlWightAndHight, height: likeControlWightAndHight)
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
