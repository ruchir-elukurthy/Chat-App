//
//  ChatViewController.swift
//  Chat-App
//
//  Created by Ruchir on 2/22/21.
//

import UIKit
import Firebase

class ChatViewController: UIViewController {
    
    let db = Firestore.firestore();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self;
        title = "Chat App"
        navigationItem.setHidesBackButton(true, animated: false)
        tableView.register(UINib(nibName:"MessageCell", bundle: nil), forCellReuseIdentifier: "reuseableCell")
        loadMessages();
    }
    
    var messages: [message] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var messageToSend: UITextField!
    
    @IBAction func goButton(_ sender: UIButton) {
        if let messageSend = messageToSend.text , let messageSenderEmail = Auth.auth().currentUser?.email {
            db.collection("messages").addDocument(data: [
                "sender": messageSenderEmail,
                "content": messageSend,
                "time": Date().timeIntervalSince1970
            ])
            { err in
                if let err = err {
                    print("Error adding document: \(err)")
                } else {
                    print("Document added")
                }
            }
        }
    }
    
    func loadMessages() {
        db.collection("messages").order(by: "time").addSnapshotListener{ (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                self.messages = []
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                    let data = document.data()
                    if let content = data["content"] as? String, let sender = data["sender"] as? String {
                        let newMessage = message(sender: sender, content: content)
                        self.messages.append(newMessage)
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                    }
                }
            }
        }
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
