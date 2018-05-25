//
//  ViewController.swift
//  MessagingApp
//
//  Created by user137594 on 5/24/18.
//  Copyright © 2018 Chris Iaconis. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBAction func loginButtonPressed(_ sender: Any) {
        let messageList = self.storyboard?.instantiateViewController(withIdentifier: "MessageList")
        self.present(messageList!, animated: true)
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

