//
//  KeyBoardViewController.swift
//  RemotePad-iOS
//
//  Created by Nikita Volkov on 08.03.2021.
//

import UIKit

class KeyboardViewController: UIViewController {
    var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        return collectionView
    }()
    
   // var activeCell: KeyCollectionViewCell?
      
    let allButtons: [String] = ["Space", "command", "option", "control", "fn", "shift", "capsLock", "tab", "enter", "backspace"]
                    // tab-capslock-backspace / fn-control-option-enter / cmd-space-shit
    let mainButtons = ["⇥", "↥", "⬅︎", "fn", "control", "option", "↩︎", "command", " ", "⇧"]
 

 
    override func loadView() {
        super.loadView()        
        layoutViews()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.darkGray
        collectionView.delegate = self
        collectionView.dataSource = self        
        collectionView.register(KeyCollectionViewCell.self, forCellWithReuseIdentifier: "custom")
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionView.reloadData()
    }

}
