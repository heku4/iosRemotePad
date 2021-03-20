//
//  KeyCollectionViewCell.swift
//  RemotePad-iOS
//
//  Created by Nikita Volkov on 08.03.2021.
//

import UIKit

class KeyCollectionViewCell: UICollectionViewCell {
    let button: UIButton = UIButton()
    
    weak var delegate: KeyboardActions?

    override func layoutSubviews() {
        super.layoutSubviews()
            button.cornerRadius = 5// * button.bounds.size.width
    }
    
    override init(frame: CGRect){
        super.init(frame: frame) //?
        
        self.backgroundColor = .darkGray
        button.backgroundColor = .black
        button.addTarget(self, action: #selector(tapKey), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(button)
        
        button.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 5).isActive = true
        button.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -5).isActive = true
        button.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 5).isActive = true
        button.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -5).isActive = true
        
    }
    
    @IBAction func tapKey() {
        UIView.animate(withDuration: 0.35, animations: {
            self.button.backgroundColor = .black
            self.button.backgroundColor = .darkGray
            self.button.backgroundColor = .black
        })
        guard let buttonTitle = button.titleLabel?.text else {return}
        switch buttonTitle {
        case " ": // space
            delegate?.tapButton("49")
        case "fn":
            delegate?.tapButton("63")
        default:
            break
        }
    }

    func assignButtonTitle(_ title: String) {
        button.setTitle(title, for: .normal)
    }
    
    func makeActive() {
        button.backgroundColor = .darkGray
    }
    
    func disactive() {
        button.backgroundColor = .black
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.masksToBounds = true
            layer.cornerRadius = newValue
        }
    }
    
}
