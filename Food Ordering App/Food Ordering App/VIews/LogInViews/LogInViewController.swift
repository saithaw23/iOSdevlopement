//
//  ViewController.swift
//  Food Ordering App
//
//  Created by SaiThaw- on 28/8/2567 BE.
//

import UIKit
import FirebaseAuth

class LogInViewController: UIViewController {
    @IBOutlet var uiview : UIView!
    
    
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        uiview.layer.cornerRadius = 20
//        let backButton = UIBarButtonItem()
//        backButton.title = ""
//        navigationItem.backBarButtonItem = backButton
        navigationController?.navigationBar.tintColor = UIColor.white
 
    }
    
    @IBAction func loginClicked(_ sender: Any) {
        guard let email = emailTF.text else { return }
        guard let password = passwordTF.text else { return }
        
        Auth.auth().signIn(withEmail: email, password: password) { firebaseResult, error in
            if let e = error {
                print("Error: \(e.localizedDescription)")
            } else {
                let homePage = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "tbcontroller") as! UITabBarController
                homePage.modalPresentationStyle = .fullScreen
                homePage.modalTransitionStyle = .crossDissolve
                self.present(homePage, animated: true, completion: nil)
            }
        }
    }
    
    
    @IBAction func signInBtnClicked(_ sender: UIButton) {
        let signupPage = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "signupPage")as! SignUpViewController
        navigationController?.pushViewController( signupPage, animated: true)
    }
    


}

