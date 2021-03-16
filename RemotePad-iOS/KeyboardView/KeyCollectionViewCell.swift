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
        
        if button.titleLabel?.text == "0" {
            button.cornerRadius = 7
        } else {
            button.cornerRadius = 0.5 * button.bounds.size.width
        }
    }
    
    override init(frame: CGRect){
        super.init(frame: frame) //?
        
        self.backgroundColor = .black
        button.backgroundColor = .brown
        button.addTarget(self, action: #selector(process), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(button)
        
        button.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 5).isActive = true
        button.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -5).isActive = true
        button.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 5).isActive = true
        button.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -5).isActive = true
        
    }
    
    @IBAction func process() {
        UIView.animate(withDuration: 0.25, animations: {
            self.button.backgroundColor = .black
            self.button.backgroundColor = .brown
        })
        guard let buttonTitle = button.titleLabel?.text else {return}
        switch buttonTitle {
        case "space":
            delegate?.tapButton("49")
        case "enter":
            delegate?.tapButton("46")
        default:
            delegate?.tapButton("49")
        }
    }

    func assignButtonTitle(_ title: String) {
        button.setTitle(title, for: .normal)
    }
    
    func makeActive() {
        button.backgroundColor = .black
    }
    
    func disactive() {
        button.backgroundColor = .brown
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
