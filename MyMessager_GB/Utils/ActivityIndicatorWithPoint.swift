//
//  ActivityIndicatorWithPoint.swift
//  MyMessager_GB
//
//  Created by Valentin Mironov on 16.05.2021.
//

import UIKit
class ActivityIndicatorWithPoints: UIView{
    private var points: [Point] = []
    var spacing: CGFloat = 4 {
        didSet{
            removePoints()
            install()
        }
    }
    
    var pointCount: Int = 0{
        didSet{
            removePoints()
            install()
        }
    }
    
    var color: UIColor {
        set {
            for point in points{
                point.colorPoint = newValue
            }
        }
        get{
            points.first?.colorPoint ?? UIColor.black
        }
    }
    
    func startAnimation(){
        
        UIView.animateKeyframes(withDuration: TimeInterval(pointCount),
                                delay: 0,
                                options: [.repeat,.autoreverse],
                                animations: {
                                    for (index,point) in self.points.reversed().enumerated(){
                                        let relativeDuration = Double(index == 0 ? 1 : index)/Double(self.pointCount)
                                        UIView.addKeyframe(withRelativeStartTime: Double(1/self.pointCount),
                                                           relativeDuration: relativeDuration,
                                                           animations: {
                                                                point.layer.opacity = 0
                                                           })
                                        
                                        
                                        
                                    }
                                },
                                completion: nil)
    }
    
    func stopAnimation(){
        for point in points{
            point.layer.removeAllAnimations()
        }
    }
    
    
    private func removePoints(){
        for point in points{
            point.removeFromSuperview()
        }
        points = []
    }
    
    private func install(){
        createPoints()
        setFrame()
        setSizePoints()
        
    }
    
    private func createPoints(){
        for _ in 0..<pointCount{
            let newPoint = Point()
            points.append(newPoint)
//            newPoint.layer.opacity = 0.5
            newPoint.backgroundColor = backgroundColor
            addSubview(newPoint)
        }
    }
    
    private func setSizePoints(){
        let pointWight = bounds.height
        let pointHeight = bounds.height
        for (index, point) in points.enumerated() {
            switch index {
            case 0:
                point.frame = CGRect(x: bounds.minX, y: bounds.minY, width: pointWight, height: pointHeight)
            case 1...points.count-1:
                point.frame = CGRect(x: points[index-1].frame.maxX + spacing, y: points[index-1].frame.minY, width: pointWight, height: pointHeight)
            default:
                break
            }
        }
    }
    
    private func setFrame(){
        let wightSpasing: CGFloat = spacing * CGFloat((points.count - 1))
        let wightPoints = frame.height * CGFloat(points.count) + wightSpasing
        frame = CGRect(x: frame.minX, y: frame.minY, width: wightPoints, height: frame.height)
    }
    
    private class Point: UIView{
        var colorPoint: UIColor = .blue{
            didSet{
                setNeedsDisplay()
            }
        }
        
        var pointLayer: CALayer = CALayer()
        
        override func layoutSubviews() {
            super.layoutSubviews()
            let layerShape = createMaskCircle()
            pointLayer.mask = layerShape
            pointLayer.backgroundColor = UIColor.red.cgColor
            layer.addSublayer(pointLayer)
        }
        
        private func createMaskCircle() -> CAShapeLayer{
            let maskLayer = CAShapeLayer()
            let starPath = UIBezierPath(ovalIn: CGRect(x: bounds.minX, y: bounds.minY, width: bounds.width, height: bounds.height))
            maskLayer.path = starPath.cgPath
            return maskLayer
        }
        
        
        override func draw(_ rect: CGRect) {
            super.draw(rect)
            guard let context = UIGraphicsGetCurrentContext() else { return }
            context.setFillColor(colorPoint.cgColor)
            let path = UIBezierPath(ovalIn: bounds)
            path.fill()
            path.close()
        }
    }
}

