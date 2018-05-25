//
//  ViewController.swift
//  MessagingApp
//
//  Created by user137594 on 5/24/18.
//  Copyright © 2018 Chris Iaconis. All rights reserved.
//

import UIKit
import Firebase

class MessageEditorViewController: UIViewController {
    
    var ref: DatabaseReference!
    
    @IBOutlet weak var messageBox: UITextField!
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func postButtonPressed(_ sender: Any) {
        ref.child("messages").childByAutoId().setValue(messageBox.text)
        self.dismiss(animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        ref = Database.database().reference()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

