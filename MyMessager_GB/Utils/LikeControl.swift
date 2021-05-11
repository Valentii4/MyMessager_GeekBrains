//
//  LikeControl.swift
//  MyMessager_GB
//
//  Created by Valentin Mironov on 09.05.2021.
//

import UIKit

protocol LikeControl {
    var countLikes: Int { get set }
    var isLiking: Bool { get set }
    var color: UIColor { get set }
    func addTarget(_ target: Any?, action: Selector, for controlEvents: UIControl.Event)
}

@IBDesignable class LikeControlImpl: UIControl, LikeControl {
    var isLiking: Bool = false {
        didSet{
            setImage()
        }
    }
    @IBInspectable var countLikes: Int = 0 {
        didSet{
            setCountLikesLabel()
        }
    }
    @IBInspectable var color: UIColor = .red {
        didSet{
            setCountLikesLabel()
            setImage()
        }
    }
    
    private let imageView: UIImageView = UIImageView()
    private let countLikesLabel: UILabel = UILabel()
    
    override func layoutSubviews() {
        imageView.frame = bounds
    }
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setView()
    }
    
    
    private func setView(){
        addSubview(imageView)
        addTarget(self, action: #selector(tapControl), for: .touchUpInside)
        imageView.tintColor = color
        setImage()
        setCountLikesLabel()
    }
    
    private func setCountLikesLabel(){
        addSubview(countLikesLabel)
        let likeString: String?
        
        switch countLikes {
        case 0..<1000:
            likeString = String(countLikes)
        case 1000..<1_000_000:
            likeString = String(countLikes/1000) + "k"
        default:
            likeString = "-"
        }
        countLikesLabel.textColor = color
        countLikesLabel.translatesAutoresizingMaskIntoConstraints = false
        countLikesLabel.text = likeString
        
        countLikesLabel.trailingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: -8).isActive = true
        countLikesLabel.centerYAnchor.constraint(equalTo: imageView.centerYAnchor).isActive = true
    }
    
    private func setImage(){
        if isLiking{
            imageView.image = UIImage(systemName: "heart.fill")
        }else{
            imageView.image = UIImage(systemName: "heart")
        }
    }
    
    @objc private func tapControl(){
        isLiking.toggle()
        if isLiking{
            countLikes += 1
        }else{
            countLikes -= 1
        }
        sendActions(for: .valueChanged)
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}