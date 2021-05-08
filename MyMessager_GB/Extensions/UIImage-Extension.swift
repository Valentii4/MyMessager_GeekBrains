//
//  UIImage-Extetions.swift
//  MyMessager_GB
//
//  Created by Valentin Mironov on 08.05.2021.
//

import UIKit

extension UIImage {
    /// This function returns color in point.
    ///
    ///
    /// - Warning: If point not found return UICollor.clear
    /// - Parameter pos: The position in which to take the color.
    func getPixelColor(pos: CGPoint) -> UIColor {
        guard let pixelData = self.cgImage?.dataProvider?.data else{
            return .clear
        }
        let data: UnsafePointer<UInt8> = CFDataGetBytePtr(pixelData)
        
        let pixelInfo: Int = ((Int(self.size.width) * Int(pos.y)) + Int(pos.x)) * 4
        
        let r = CGFloat(data[pixelInfo]) / CGFloat(255.0)
        let g = CGFloat(data[pixelInfo+1]) / CGFloat(255.0)
        let b = CGFloat(data[pixelInfo+2]) / CGFloat(255.0)
        let a = CGFloat(data[pixelInfo+3]) / CGFloat(255.0)
        
        return UIColor(red: r, green: g, blue: b, alpha: a)
    }
}
