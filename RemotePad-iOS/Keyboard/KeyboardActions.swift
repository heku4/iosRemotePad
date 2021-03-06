//
//  KeyActions.swift
//  RemotePad-iOS
//
//  Created by Nikita Volkov on 08.03.2021.
//

import UIKit

protocol KeyboardActions: class {
    func tapButton(_ value: String)//, cell: KeyCollectionViewCell)
}

extension KeyboardViewController: KeyboardActions
{
    func tapButton(_ keyCode: String) {
        let requestState = RemotePadRequests().tapKey(keyCode: keyCode)
        if requestState == false {
            var popUpWindow: PopUpWindow!
            popUpWindow = PopUpWindow(title: "Error", text: "Sorry!", buttontext: "OK")
            self.present(popUpWindow, animated: true, completion: nil)
        }
    }
}


