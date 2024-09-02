//
//  SignUpViewController.swift
//  Food Ordering App
//
//  Created by SaiThaw- on 29/8/2567 BE.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signupBtnClicked(_ sender: UIButton) {
        guard let name = nameTF.text, !name.isEmpty else {
            showAlert(message: "Please enter your name.")
            return
        }
        guard let email = emailTF.text, !email.isEmpty else {
            showAlert(message: "Please enter your email.")
            return
        }
        guard let password = passwordTF.text, !password.isEmpty else {
            showAlert(message: "Please enter your password.")
            return
        }
        
        
        let alert = UIAlertController(title: "Create Account", message: "Would you like to create an account?", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: { _ in
            // Create the account only after the user confirms
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    self.showAlert(message: e.localizedDescription)
                } else if let authResult = authResult {
                    let db = Firestore.firestore()
                    db.collection("users").document(authResult.user.uid).setData([
                        "name": name,
                        "email": email
                    ]) { err in
                        if let err = err {
                            print("Error writing document: \(err)")
                        } else {
                            let homePage = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "tbcontroller") as! UITabBarController
                            homePage.modalPresentationStyle = .fullScreen
                            homePage.modalTransitionStyle = .coverVertical
                            self.present(homePage, animated: true, completion: nil)
                        }
                    }
                }
            }
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }


    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}
