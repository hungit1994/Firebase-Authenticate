//
//  HomeViewController.swift
//  SignupFirebase
//
//  Created by User on 6/26/20.
//  Copyright © 2020 hung. All rights reserved.
//

import UIKit
import Firebase

class HomeViewController: UIViewController {

    @IBOutlet weak var logoutButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func logoutButton(_ sender: Any) {
        
        
            let firebaseAuth = Auth.auth()
            do {
                try firebaseAuth.signOut()
                self.dismiss(animated: true, completion: nil)
            } catch let signOutErorr as NSError {
                print("Error signing out: %@", signOutErorr)
                
            }
            
        
        
        
    }
    
}
