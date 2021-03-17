//
//  ViewController.swift
//  RemotePad-iOS
//
//  Created by Nikita Volkov on 11.02.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var spaceButton: UIButton!
    
    @IBAction func tapSpaceButton(_ sender: UIButton) {
        RemotePadRequests().setupWebSocket()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

