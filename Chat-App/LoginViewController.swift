//
//  LoginViewController.swift
//  Chat-App
//
//  Created by Ruchir on 2/22/21.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var userEmailAddress: UITextField!
    
    @IBOutlet weak var userPassword: UITextField!
    
    @IBAction func userlLogin(_ sender: UIButton) {
        if let email = userEmailAddress.text, let password = userPassword.text {
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    print(e.localizedDescription)
                }
                else {
                    self.performSegue(withIdentifier: "goToChat", sender: self)
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "goToChat") {
            let destVC = segue.destination as! ChatViewController
        }
    }
    
}
