//
//  LettersControl.swift
//  MyMessager_GB
//
//  Created by Valentin Mironov on 11.05.2021.
//

import UIKit

class LettersControl: UIControl {
    typealias Letter = String
    var selectedLetter: String? = nil{
        didSet{
            self.updateSelectedLetters()
            self.sendActions(for: .valueChanged)
        }
    }
    
    var letters: [Letter] = []{
        didSet{
//            setupView()
        }
    }
    private var buttons: [UIButton] = []
    private var stackView: UIStackView!
    

    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setupView()
    }
    
    //MARK: - Setup
    func setupView(){
        setButtoms(letters: letters)
        setStackView(buttons)
    }
    
    private func setStackView(_ views: [UIView]){
        stackView = UIStackView(arrangedSubviews: views)
        stackView.frame = bounds
        addSubview(stackView)
        stackView.spacing = 0
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillEqually
    }
    
    private func setButtoms(letters: [Letter]){
        for letter in letters{
            let button = UIButton(type: .system)
            button.setTitle(letter, for: .normal)
            button.setTitleColor(.systemGray6, for: .selected)
            button.setTitleColor(.systemBlue, for: .normal)
            button.addTarget(self, action: #selector(selectLetter(_:)), for: .touchUpInside)
            self.buttons.append(button)
        }
    }
    //MARK: - Actions
    @objc private func selectLetter(_ sender: UIButton){
        guard let index = buttons.firstIndex(of:sender) else{
            return
        }
        let letter = letters[index]
        selectedLetter = letter
        
    }
    
    //MARK: - Functions
    private func updateSelectedLetters(){
        for (index, button) in buttons.enumerated(){
            let letter = letters[index]
            button.isSelected = letter == self.selectedLetter
        }
    }

    override func draw(_ rect: CGRect) {
        setupView()
    }
    

}
