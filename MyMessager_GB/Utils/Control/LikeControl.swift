//
//  LikeControl.swift
//  MyMessager_GB
//
//  Created by Valentin Mironov on 09.05.2021.
//

import UIKit

protocol Control: UIControl {
    var counter: Int { get set }
    var color: UIColor { get set }
    func addTarget(_ target: Any?, action: Selector, for controlEvents: UIControl.Event)
    var imageView: UIImageView { get }
    var countersLabel: UILabel { get }
}

protocol LikeControl: Control{
    var isLiking: Bool { get set }
}

@IBDesignable class LikeControlImpl: UIControl, LikeControl {
    var isLiking: Bool = false {
        didSet{
            setImage()
        }
    }
    @IBInspectable var counter: Int = 0 {
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
    
    var imageView: UIImageView = UIImageView()
    var countersLabel: UILabel = UILabel()
    
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
        addSubview(countersLabel)
        let likeString: String?
        
        switch counter {
        case 0..<1000:
            likeString = String(counter)
        case 1000..<1_000_000:
            likeString = String(counter/1000) + "k"
        default:
            likeString = "-"
        }
        countersLabel.textColor = color
        countersLabel.translatesAutoresizingMaskIntoConstraints = false
        countersLabel.text = likeString
        
        countersLabel.trailingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: -8).isActive = true
        countersLabel.centerYAnchor.constraint(equalTo: imageView.centerYAnchor).isActive = true
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
            counter += 1
        }else{
            counter -= 1
        }
        sendActions(for: .valueChanged)
    }
    
}
