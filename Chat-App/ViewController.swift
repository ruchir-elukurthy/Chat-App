//
//  ViewController.swift
//  Chat-App
//
//  Created by Ruchir on 2/22/21.
//

import UIKit
import CLTypingLabel

class ViewController: UIViewController {

    @IBOutlet weak var chatAppLabel: CLTypingLabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        chatAppLabel.text = "Chat App"
    }
    

    
    @IBAction func loginRedirect(_ sender: Any) {
    }
    
    @IBAction func registerRedirect(_ sender: Any) {
    }
    
}

