//
//  ChatViewController.swift
//  Chat-App
//
//  Created by Ruchir on 2/22/21.
//

import UIKit
import Firebase
import CLTypingLabel

class ChatViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Chat App"
        navigationItem.setHidesBackButton(true, animated: false)
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var messageToSend: UITextField!
    
    @IBAction func goButton(_ sender: UIButton) {
        performSegue(withIdentifier: "goToChat", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC = segue.destination as! ChatViewController
    }
    
    
    @IBAction func logOutPress(_ sender: UIBarButtonItem) {
        let firebaseAuth = Auth.auth()
        navigationController?.popToRootViewController(animated: true)
        do {
          try firebaseAuth.signOut()
        } catch let signOutError as NSError {
          print ("Error signing out: %@", signOutError)
        }
    }
    
}
