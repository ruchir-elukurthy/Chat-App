//
//  RegisterViewController.swift
//  Chat-App
//
//  Created by Ruchir on 2/22/21.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {

    
    @IBOutlet weak var userEmailAddress: UITextField!
    
    @IBOutlet weak var userPassword: UITextField!
    
    @IBAction func registerButton(_ sender: UIButton) {
        if let email = userEmailAddress.text, let password = userPassword.text {
            
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    print(e)
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
