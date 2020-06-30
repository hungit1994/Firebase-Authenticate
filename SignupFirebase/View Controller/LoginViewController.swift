//
//  LoginViewController.swift
//  SignupFirebase
//
//  Created by User on 6/26/20.
//  Copyright © 2020 hung. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase


class LoginViewController: UIViewController {
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setUpElements()
        
    }
    
    
    func setUpElements(){
        
        errorLabel.alpha = 0
        
        Utilities.styleTextField(firstNameTextField)
        Utilities.styleTextField(lastNameTextField)
        Utilities.styleFilledButton(loginButton)
        
    }
    
    @IBAction func loginTapped(_ sender: Any) {
        print("tapped®")
        let email = firstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        print("email \(email)")
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] (authResult, error) in
            guard let strongSelf = self else { return }
            
            if let error = error {
                print("lỗi là \(error)")
            } else {
                
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let welcomeVC =  storyboard.instantiateViewController(withIdentifier: "HomeVC") as! HomeViewController
                welcomeVC.modalPresentationStyle = .fullScreen
                strongSelf.present(welcomeVC, animated: true)
                print("đăng nhập xong")
            }
            
            
            
        }
        
        
    }
    
    
}
