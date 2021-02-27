//
//  LoginViewController.swift
//  Chat-App
//
//  Created by Ruchir on 2/22/21.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var loginOutlet: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Chat App"
        loginOutlet.layer.cornerRadius = 8
        loginOutlet.layer.borderWidth = 2
        loginOutlet.backgroundColor = UIColor(red: 0.4, green: 1.0, blue: 0.2, alpha: 0.5)
        userEmailAddress?.text = "abcd@pqr.com"
        userPassword?.text = "qwertyu"
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
