//
//  ViewController.swift
//  RemotePad-iOS
//
//  Created by Nikita Volkov on 11.02.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func tapSpaceButton(_ sender: UIButton) {
        RemotePadRequests().setupWebSocket()
        let keyboardViewController:KeyboardViewController = KeyboardViewController()
        self.present(keyboardViewController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        view.backgroundColor = .darkGray
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

