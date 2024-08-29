//
//  ProfileViewController.swift
//  Food Ordering App
//
//  Created by SaiThaw- on 29/8/2567 BE.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func logoutBtnClicked(_ sender: UIButton) {
        
        let loginPage = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "loginNC")as! UINavigationController
        loginPage.modalPresentationStyle = .fullScreen
        loginPage.modalTransitionStyle = .crossDissolve
        present(loginPage,animated: true, completion: nil)
        
    }
    
}
