//
//  ViewController.swift
//  Food Ordering App
//
//  Created by SaiThaw- on 28/8/2567 BE.
//

import UIKit
import FirebaseAuth

class LogInViewController: UIViewController {
    
    
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.tintColor = UIColor.white
        
        if FirebaseAuth.Auth.auth().currentUser != nil {
            navigateToHomeScreen()
            
        }
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func loginClicked(_ sender: Any) {
        guard let email = emailTF.text else { return }
        guard let password = passwordTF.text else { return }
        
        Auth.auth().signIn(withEmail: email, password: password) { firebaseResult, error in
            if let e = error {
                self.showAlert(message: e.localizedDescription)
            } else {
                self.navigateToHomeScreen()
            }
        }
    }
    
    
    
    @IBAction func signInBtnClicked(_ sender: UIButton) {
        let signupPage = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "signupPage")as! SignUpViewController
        navigationController?.pushViewController( signupPage, animated: true)
    }
    
    func navigateToHomeScreen(){
        let homePage = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "tbcontroller") as! UITabBarController
        homePage.modalPresentationStyle = .fullScreen
        homePage.modalTransitionStyle = .coverVertical
        self.present(homePage, animated: true, completion: nil)
    }


}

