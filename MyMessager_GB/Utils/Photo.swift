//
//  PersonePhoto.swift
//  MyMessager_GB
//
//  Created by Valentin Mironov on 08.05.2021.
//

import UIKit

@IBDesignable class Photo: UIView {
    
    // 1. Set up your enum
    enum Shape: String {
        case Square = "square" // lowercase to make it case-insensitive
        case Circle = "circle"
    }

    // 2. Then set up a stored property, which will be for use in code
    var shapeEnum = Shape.Square // default shape

    // 3. And another stored property which will only be accessible in IB (because the "unavailable" attribute prevents its use in code)
    @available(*, unavailable, message: "This property is reserved for Interface Builder. Use 'shape' instead.")
    @IBInspectable var shapeName: String? {
        willSet {
            // Ensure user enters a valid shape while making it lowercase.
            // Ignore input if not valid.
            if let newShape = Shape(rawValue: newValue?.lowercased() ?? "") {
                shapeEnum = newShape
            }
        }
    }
    
    @IBInspectable var shadowOpacity: CGFloat = 0.9{
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat = 5{
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var isNeededShadowGraient: Bool = false{
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var contentsGravity: CALayerContentsGravity = .resizeAspectFill{
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var image: UIImage? = nil {
        didSet {
            imageLayer.contents = image?.cgImage
            setNeedsDisplay()
        }
    }
    
    var imageLayer: CALayer = CALayer()
    var shadowLayer: CALayer = CALayer()
    var gradientLayer = CAGradientLayer()
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let mask = createMaskFromImage()
        if isNeededShadowGraient{
            addShadowLayer(mask: createMaskFromGradient())
            addGradientLayer()
        }else{
            addShadowLayer(mask: mask)
        }
        addImageLayer(mask: mask)
    }
    
    private func addGradientLayer(){
        gradientLayer.colors = getColors()
        gradientLayer.transform = CATransform3DMakeRotation(0, 0, 0, 0)
        gradientLayer.frame = bounds
        gradientLayer.opacity = 0.40
        gradientLayer.masksToBounds = true
        gradientLayer.mask = createMaskFromGradient()
        layer.addSublayer(gradientLayer)
    }
    
    private func addImageLayer(mask: CAShapeLayer){
        layer.addSublayer(imageLayer)
        imageLayer.mask = mask
        imageLayer.masksToBounds = true
        imageLayer.backgroundColor = UIColor.clear.cgColor
        imageLayer.frame = bounds
        imageLayer.contentsGravity = contentsGravity
    }
    
    private func addShadowLayer(mask: CAShapeLayer){
        guard let path = mask.path else {
            print("Path equal nil", #function)
            return
        }
        layer.addSublayer(shadowLayer)
        shadowLayer.backgroundColor = UIColor.clear.cgColor
        shadowLayer.shadowPath = path
        shadowLayer.shadowColor = UIColor.black.cgColor
        shadowLayer.shadowOpacity = Float(shadowOpacity)
        shadowLayer.shadowRadius = CGFloat(shadowRadius)
        shadowLayer.shadowOffset = .zero
    }
    
    
    /// This function returns the color taken from the four sides in the image middle.
    ///
    /// - Returns: [Top, left, right, bottom]
    /// - Warning: If I couldn't get the color back, it will return [UIcolor.clear.cgColor,...]
    private func getColors() -> [CGColor]{
        let point = CGRect(x: imageLayer.frame.minX, y: imageLayer.frame.minY, width: image?.size.width ?? 0, height: image?.size.height ?? 0)
        let defaultColor = UIColor.clear.cgColor
        let colorMinXmidY = image?.getPixelColor(pos: CGPoint(x: point.minX, y: point.midY)).cgColor ?? defaultColor
        let colorMaxXmidY = image?.getPixelColor(pos: CGPoint(x: point.maxX - 20, y: point.midY)).cgColor ?? defaultColor
        let colorMidXminY = image?.getPixelColor(pos: CGPoint(x: point.midX, y: point.minY)).cgColor ?? defaultColor
        let colorMidXmaxY = image?.getPixelColor(pos: CGPoint(x: point.midX, y: point.maxY - 20)).cgColor ?? defaultColor
        
        return [colorMidXminY,colorMinXmidY,colorMaxXmidY,colorMidXmaxY]
    }
    
    //MARK: - Image
    private func createMaskFromImage() -> CAShapeLayer{
        let maskLayer: CAShapeLayer
        switch shapeEnum {
        case .Circle:
            maskLayer = createMaskCircleForImage()
        case .Square:
            maskLayer = createMaskSquareForImage()
        }
        return maskLayer
    }
    
    private func createMaskSquareForImage() -> CAShapeLayer{
        let maskLayer = CAShapeLayer()
        if isNeededShadowGraient{
            let starPath = UIBezierPath(rect: CGRect(x: bounds.minX + CGFloat(shadowRadius/2), y: bounds.minY + CGFloat(shadowRadius/2), width: bounds.width - shadowRadius, height: bounds.height - shadowRadius))
            maskLayer.path = starPath.cgPath
        }else{
            let starPath = UIBezierPath(rect: CGRect(x: bounds.minX, y: bounds.minY, width: bounds.width, height: bounds.height))
            maskLayer.path = starPath.cgPath
        }
        return maskLayer
    }
    
    private func createMaskCircleForImage() -> CAShapeLayer{
        let maskLayer = CAShapeLayer()
        if isNeededShadowGraient{
            let starPath = UIBezierPath(ovalIn: CGRect(x: bounds.minX + CGFloat(shadowRadius/2), y: bounds.minY + CGFloat(shadowRadius/2), width: bounds.width - shadowRadius, height: bounds.height - shadowRadius))
            maskLayer.path = starPath.cgPath
        }else{
            let starPath = UIBezierPath(ovalIn: CGRect(x: bounds.minX, y: bounds.minY, width: bounds.width, height: bounds.height))
            maskLayer.path = starPath.cgPath
        }
        return maskLayer
    }
    
    //MARK: - Gradient
    private func createMaskFromGradient() -> CAShapeLayer{
        var maskLayer: CAShapeLayer
        switch shapeEnum {
        case .Circle:
            maskLayer = createMaskCircleFromGradient()
        case .Square:
            maskLayer = createMaskSquareFromGradient()
        }
        return maskLayer
    }
    
    private func createMaskCircleFromGradient() -> CAShapeLayer{
        let maskLayer = CAShapeLayer()
        let starPath = UIBezierPath(ovalIn: CGRect(x: bounds.minX, y: bounds.minY, width: bounds.width, height: bounds.height))
        maskLayer.path = starPath.cgPath
        return maskLayer
    }
    
    private func createMaskSquareFromGradient() -> CAShapeLayer{
        let maskLayer = CAShapeLayer()
        let starPath = UIBezierPath(rect: CGRect(x: bounds.minX, y: bounds.minY, width: bounds.width, height: bounds.height))
        maskLayer.path = starPath.cgPath
        return maskLayer
    }
    
}

