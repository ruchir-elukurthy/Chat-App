//
//  ChatViewController.swift
//  Chat-App
//
//  Created by Ruchir on 2/22/21.
//

import UIKit
import Firebase

class ChatViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self;
        title = "Chat App"
        navigationItem.setHidesBackButton(true, animated: false)
        tableView.register(UINib(data: <#T##Data#>, bundle: <#T##Bundle?#>), 
    }
    
    var messages: [message] = [
        message(sender: "abcd@pqr.com",content: "hello world"),
        message(sender:"xyz@pqr.com",content:"bye world")
    ]
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var messageToSend: UITextField!
    
    @IBAction func goButton(_ sender: UIButton) {
        performSegue(withIdentifier: "goToChat", sender: self)
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

extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count;
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reusableCell", for: indexPath)
        cell.textLabel?.text = messages[indexPath.row].content
        return cell;
    }


}
