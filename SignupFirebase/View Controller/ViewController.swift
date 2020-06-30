//
//  ViewController.swift
//  SignupFirebase
//
//  Created by User on 6/26/20.
//  Copyright © 2020 hung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupElements()
    }
    
    func setupElements(){
        
        Utilities.styleFilledButton(signUpButton)
        Utilities.styleFilledButton(loginButton)
        
    }
    
    @IBAction func onSignup(_ sender: Any) {
//        let screen = HomeViewController()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let screen = storyboard.instantiateViewController(withIdentifier: "SignVC" ) as! SignupViewController
        screen.modalPresentationStyle = .fullScreen
        self.present(screen, animated: true, completion: nil)
    }
    
    @IBAction func onLogin(_ sender: Any) {
//        let screen = HomeViewController()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let screen = storyboard.instantiateViewController(withIdentifier: "LoginVC") as! LoginViewController
        screen.modalPresentationStyle = .fullScreen
        self.present(screen, animated: true, completion: nil)
    }
    
}

