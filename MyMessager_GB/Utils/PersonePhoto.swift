//
//  PersonePhoto.swift
//  MyMessager_GB
//
//  Created by Valentin Mironov on 10.05.2021.
//

import UIKit

@IBDesignable
class PersonePhoto: UIView, Photo, LikeControl {
    private let photo: PhotoImpl = PhotoImpl()
    private let likeControl: LikeControlImpl = LikeControlImpl()
    
    //MARK: - Photo
    var shapeEnum: Shape {
        get {
            photo.shapeEnum
        }
        set {
            photo.shapeEnum = newValue
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var shadowOpacity: CGFloat {
        get {
            photo.shadowOpacity
        }
        set {
            photo.shadowOpacity = newValue
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat {
        get {
            photo.shadowRadius
        }
        set {
            photo.shadowRadius = newValue
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var isNeededShadowGraient: Bool {
        get {
            photo.isNeededShadowGraient
        }
        set {
            photo.isNeededShadowGraient = newValue
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var contentsGravity: CALayerContentsGravity {
        get {
            photo.contentsGravity
        }
        set {
            photo.contentsGravity = newValue
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var image: UIImage? {
        get {
            photo.image
        }
        set {
            photo.image = newValue
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var shapeName: String? = nil{
        willSet {
            // Ensure user enters a valid shape while making it lowercase.
            // Ignore input if not valid.
            if let newShape = Shape(rawValue: newValue?.lowercased() ?? "") {
                shapeEnum = newShape
            }
        }
    }
    
    
    //MARK: - LikeControl
    @IBInspectable var countLikes: Int {
        get {
            likeControl.countLikes
        }
        set {
            likeControl.countLikes = newValue
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var isLiking: Bool {
        get {
            likeControl.isLiking
        }
        set {
            likeControl.isLiking = newValue
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var color: UIColor {
        get {
            likeControl.color
        }
        set {
            likeControl.color = newValue
            setNeedsDisplay()
        }
    }
    
    func addTarget(_ target: Any?, action: Selector, for controlEvents: UIControl.Event){
        likeControl.addTarget(target, action: action, for: controlEvents)
    }
    
    //MARK: - layoutSubviews
    override func layoutSubviews() {
        super.layoutSubviews()
        addSubview(photo)
        addSubview(likeControl)
        
        frame = CGRect(x: framePoint.x, y: framePoint.y, width: frameWight, height: frameHight)
        photo.frame = CGRect(x: bounds.minX + shadowRadius, y: bounds.minY + shadowRadius, width: bounds.width - shadowRadius * 2.1, height: bounds.width - shadowRadius * 2.1)
        let likeControlWightAndHight = PersonePhoto.heightLikeControl(wightView: frameWight)
        likeControl.frame = CGRect(x: photo.bounds.maxX - likeControlWightAndHight, y: photo.bounds.maxY, width: likeControlWightAndHight, height: likeControlWightAndHight)
        
    }
//    override func draw(_ rect: CGRect) {
//        addSubview(photo)
//        addSubview(likeControl)
//        
//        frame = CGRect(x: framePoint.x, y: framePoint.y, width: frameWight, height: frameHight)
//        photo.frame = CGRect(x: bounds.minX + shadowRadius, y: bounds.minY + shadowRadius, width: bounds.width - shadowRadius * 2.1, height: bounds.width - shadowRadius * 2.1)
//        let likeControlWightAndHight = PersonePhoto.heightLikeControl(wightView: frameWight)
//        likeControl.frame = CGRect(x: photo.bounds.maxX - likeControlWightAndHight, y: photo.bounds.maxY, width: likeControlWightAndHight, height: likeControlWightAndHight)
//    }
    
    static func getHight(with wight: CGFloat) -> CGFloat{
        wight + heightLikeControl(wightView: wight)
    }
    
    static private func heightLikeControl(wightView: CGFloat) -> CGFloat{
        likeControlMultiplier * wightView
    }
    static private let likeControlMultiplier: CGFloat = 0.1
    
    private var frameWight: CGFloat = 0
    private var frameHight: CGFloat = 0
    private var framePoint: CGPoint = CGPoint(x: 0, y: 0)
    override var frame: CGRect {
        didSet{
            frameWight = frame.width
            frameHight = PersonePhoto.getHight(with: frameWight)
            framePoint = CGPoint(x: frame.minX, y: frame.minY)
            setNeedsDisplay()
        }
    }
    
}
