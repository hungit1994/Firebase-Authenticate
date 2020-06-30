//
//  SignupViewController.swift
//  SignupFirebase
//
//  Created by User on 6/26/20.
//  Copyright © 2020 hung. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class SignupViewController: UIViewController {
    @IBOutlet weak var FirstnameTextField: UITextField!
    
    @IBOutlet weak var LastnameTextField: UITextField!
    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    @IBOutlet weak var SignupButton: UIButton!
    @IBOutlet weak var ErrorLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setUpElements()

    }
    
    func setUpElements(){
        ErrorLabel.alpha = 0
        
        Utilities.styleTextField(FirstnameTextField)
        Utilities.styleTextField(LastnameTextField)
        Utilities.styleTextField(EmailTextField)
        Utilities.styleTextField(PasswordTextField)
        Utilities.styleFilledButton(SignupButton)
        
    }
    

    @IBAction func signUpTapped(_ sender: Any) {
        
        let email = EmailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = PasswordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        // create user
        
        Auth.auth().createUser(withEmail: email, password: password) { (userResult, error) in
            if let user = userResult?.user {
                print(user)
            }else {
                print(error?.localizedDescription)
            }
        }
        self.transitionToHome()
    }
    func showError(_ message: String){
        ErrorLabel.text = message
        ErrorLabel.alpha = 1
    }
    
    func transitionToHome(){
        
        let homeViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? HomeViewController
        
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
    }
    
}
