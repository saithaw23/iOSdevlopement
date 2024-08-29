//
//  SignUpViewController.swift
//  Food Ordering App
//
//  Created by SaiThaw- on 29/8/2567 BE.
//

import UIKit

class SignUpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signupBtnClicked(_ sender: UIButton) {
        let homePage = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "tbcontroller") as! UITabBarController
        homePage.modalPresentationStyle = .fullScreen
        homePage.modalTransitionStyle = .crossDissolve
        present(homePage, animated: true, completion: nil)
    }
    
}
