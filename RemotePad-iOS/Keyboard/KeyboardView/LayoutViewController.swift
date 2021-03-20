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
        collectionView.heightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.heightAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}

extension KeyboardViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mainButtons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "custom", for: indexPath) as! KeyCollectionViewCell
        cell.assignButtonTitle(mainButtons[indexPath.row])
        cell.delegate = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if mainButtons[indexPath.row] == " " || mainButtons[indexPath.row] == "command" {
            return CGSize(width: collectionView.frame.width / 3, height: collectionView.frame.height / 3)
        }
        if mainButtons[indexPath.row] == "control" ||
            mainButtons[indexPath.row] == "option" ||
            mainButtons[indexPath.row] == "↩︎" ||
            mainButtons[indexPath.row] == "fn"  {
            return CGSize(width: collectionView.frame.width / 4, height: collectionView.frame.height / 3)
        }
        return CGSize(width: collectionView.frame.width / 3, height: collectionView.frame.height / 3)
    }
}

