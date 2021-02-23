//
//  RegisterViewController.swift
//  Chat-App
//
//  Created by Ruchir on 2/22/21.
//

import UIKit

class RegisterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var userEmailAddress: UITextField!
    
    @IBOutlet weak var userPassword: UITextField!
    
    @IBAction func registerButton(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToChat", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "goToChat") {
            let destVC = segue.destination as! ChatViewController
        }
    }
}
