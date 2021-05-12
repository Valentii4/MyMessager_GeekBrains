//
//  Control.swift
//  MyMessager_GB
//
//  Created by Valentin Mironov on 12.05.2021.
//


import UIKit

protocol Control: UIControl {
    var counter: Int { get set }
    var color: UIColor { get set }
    func addTarget(_ target: Any?, action: Selector, for controlEvents: UIControl.Event)
    var imageView: UIImageView { get }
    var countersLabel: UILabel { get }
    var constrainsSpasing: Int { get set}
    var position: Position { get }
    func addCountLabel()
    func setImage(named: String)
    func setImage()
    func tapControl()
    func getFullWight() -> CGFloat
}

enum Position{
    case left
    case right
}

extension Control{
     func addCountLabel(){
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
        
        switch position {
        case .left:
            countersLabel.trailingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: CGFloat(-constrainsSpasing)).isActive = true
        case .right:
            countersLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: CGFloat(constrainsSpasing)).isActive = true
        }
        countersLabel.centerYAnchor.constraint(equalTo: imageView.centerYAnchor).isActive = true
        sendActions(for: .valueChanged)
    }
}

@IBDesignable class ControlElement: UIControl, Control{
    //MARK: - control
    var constrainsSpasing: Int = 8
    var position: Position = .right
    
    @IBInspectable var counter: Int = 0 {
        didSet{
            addCountLabel()
        }
    }
    @IBInspectable var color: UIColor = .red {
        didSet{
            imageView.tintColor = color
            countersLabel.textColor = color
        }
    }
    
    var imageView: UIImageView = UIImageView()
    var countersLabel: UILabel = UILabel()
    
    override func layoutSubviews() {
        imageView.frame = bounds
        sendActions(for: .valueChanged)
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
    
    func setImage(named: String){
        imageView.image = UIImage(systemName: named)
    }
    func setImage(){
        imageView.image = UIImage(systemName: "heard")
    }
    
    @objc func tapControl(){
//        sendActions(for: .touchUpInside)
    }
    
    private func setView(){
        addSubview(imageView)
        addTarget(self, action: #selector(tapControl), for: .touchUpInside)
        imageView.tintColor = color
        setImage()
        addSubview(countersLabel)
        addCountLabel()
    }
    
    func getFullWight() -> CGFloat{
        frame.width + CGFloat(constrainsSpasing) + countersLabel.frame.width
    }
    
}
