//
//  SignUpViewController.swift
//  Food Ordering App
//
//  Created by SaiThaw- on 29/8/2567 BE.
//

import UIKit
import FirebaseAuth

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var retypepasswordTF: UITextField!


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signupBtnClicked(_ sender: UIButton) {
        
        guard let name = nameTF.text else { return }
        guard let email = emailTF.text else { return }
        guard let password = passwordTF.text else { return }
        
        Auth.auth().createUser(withEmail: email, password: password) { firebaseResult, error in
            if let e = error {
                print("Error: \(e.localizedDescription)")
            }else {
                let homePage = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "tbcontroller") as! UITabBarController
                homePage.modalPresentationStyle = .fullScreen
                homePage.modalTransitionStyle = .crossDissolve
                self.present(homePage, animated: true, completion: nil)
            }
            
        }
    }
    
}
