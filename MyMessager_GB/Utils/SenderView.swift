//
//  SenderView.swift
//  MyMessager_GB
//
//  Created by Valentin Mironov on 14.05.2021.
//

import UIKit
class SenderView: UIView{
    private let image: Photo = PhotoImpl()
    private let title: UILabel = UILabel()
    private let subtitle: UILabel = UILabel()
    
    var sender: Sender?{
        didSet{
            guard  let sender = sender else {
                return
            }
            setImage(image: sender.avatar)
            setTitle(text: sender.name)
        }
    }
    
    func setImage(image: UIImage?){
        self.image.image = image
        updateAllSize()
    }
    
    func setTitle(text: String?){
        self.title.text = text
        updateSizeTitle()
        updateSizeSubtitle()
    }
    
    func setSubtitle(text: String?){
        self.subtitle.text = text
        updateSizeSubtitle()
    }
    
    
    func updateAllSize(){
        updateSizeImage()
        updateSizeTitle()
        updateSizeSubtitle()
    }
    private let spacing: CGFloat = 8
    private func updateSizeSubtitle(){
        subtitle.frame = CGRect(x: title.frame.minX, y: title.frame.maxY + spacing, width: title.frame.width, height: image.bounds.height/2 - spacing/2)
    }
    
    private func updateSizeImage(){
        let sizeImage = bounds.width * 0.25
        image.frame = CGRect(x: bounds.minX + spacing, y: bounds.midY - sizeImage/2, width: sizeImage, height: sizeImage)
        image.shapeEnum = .Circle
    }
    
    private func updateSizeTitle(){
        let countSpasing: CGFloat = 3
        let titleWight =  bounds.width - (image.frame.width + countSpasing * spacing)
        title.frame = CGRect(x: image.frame.maxX + spacing, y: image.frame.minY, width: titleWight, height: image.bounds.height/2 - spacing/2)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        title.font = title.font.withSize(21)
        subtitle.font = subtitle.font.withSize(12)
        subtitle.textColor = .secondaryLabel
        
        addSubview(image)
        addSubview(title)
        addSubview(subtitle)
    }
}
