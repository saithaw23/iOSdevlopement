//
//  ViewController.swift
//  Food Ordering App
//
//  Created by SaiThaw- on 28/8/2567 BE.
//

import UIKit

class LogInViewController: UIViewController {
    @IBOutlet var uiview : UIView!


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
        let homePage = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "tbcontroller") as! UITabBarController
        homePage.modalPresentationStyle = .fullScreen
        homePage.modalTransitionStyle = .crossDissolve
        present(homePage, animated: true, completion: nil)
    }
    
    
    @IBAction func signInBtnClicked(_ sender: UIButton) {
        let signupPage = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "signupPage")as! SignUpViewController
        navigationController?.pushViewController( signupPage, animated: true)
    }
    


}

