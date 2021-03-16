//
//  LayoutViewController.swift
//  RemotePad-iOS
//
//  Created by Nikita Volkov on 08.03.2021.
//

import UIKit

extension KeyboardViewController {
    func layoutViews(){
        collectionView.translatesAutoresizingMaskIntoConstraints = false
       
        self.view.addSubview(collectionView)
      
        collectionView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        collectionView.heightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.65).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}

extension KeyboardViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return elements.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "custom", for: indexPath) as! KeyCollectionViewCell
        cell.assignButtonTitle(elements[indexPath.row])
        cell.delegate = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if elements[indexPath.row] == "0" {
            return CGSize(width: collectionView.frame.width / 2, height: collectionView.frame.height / 5)
        }
        return CGSize(width: collectionView.frame.width / 4, height: collectionView.frame.width / 4)
    }
}
