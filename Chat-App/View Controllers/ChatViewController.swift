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
        tableView.register(UINib(nibName:"MessageCell", bundle: nil), forCellReuseIdentifier: "reuseableCell")
    }
    
    var messages: [message] = [
        message(sender: "abcd@pqr.com",content: "hello world"),
        message(sender:"xyz@pqr.com",content:"bye world")
    ]
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var messageToSend: UITextField!
    
    @IBAction func goButton(_ sender: UIButton) {
    }
    
    @IBAction func logOutPress(_ sender: UIBarButtonItem) {
        do { try Auth.auth().signOut() }
            catch { print("already logged out") }
            
            navigationController?.popToRootViewController(animated: true)
    }
    
    
}

extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count;
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseableCell", for: indexPath) as! MessageCell
        cell.messageContent.text = messages[indexPath.row].content
        cell.senderName.text = messages[indexPath.row].sender
        return cell;
    }


}
