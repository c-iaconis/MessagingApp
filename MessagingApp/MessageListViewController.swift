//
//  ViewController.swift
//  MessagingApp
//
//  Created by user137594 on 5/24/18.
//  Copyright © 2018 Chris Iaconis. All rights reserved.
//

import UIKit
import Firebase

class MessageListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var ref: DatabaseReference!
    var messageList: [String] = []
    
    @IBOutlet weak var messageListTableView: UITableView!
    
    @IBAction func writeMessageButtonPressed(_ sender: Any) {
        let messageEditor = self.storyboard?.instantiateViewController(withIdentifier: "MessageEditor")
        self.present(messageEditor!, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MessageCell", for: indexPath)
        cell.textLabel?.text = messageList[indexPath.row]
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        ref = Database.database().reference()
        ref.child("messages").observe(DataEventType.value) { (snapshot) in
            self.messageList.removeAll()
            let dictionary = snapshot.value as? [String: Any]
            dictionary?.forEach({(arg) in
                let (_, value) = arg
                self.messageList.append(value as! String)
            })
            self.messageListTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.messageListTableView.delegate = self
        self.messageListTableView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

