//
//  ProfileViewController.swift
//  Food Ordering App
//
//  Created by SaiThaw- on 29/8/2567 BE.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class ProfileViewController: UIViewController {
    
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        if let user = Auth.auth().currentUser {
                    let db = Firestore.firestore()
                    let userId = user.uid
                    
                    db.collection("users").document(userId).getDocument { (document, error) in
                        if let document = document, document.exists {
                            let data = document.data()
                            let name = data?["name"] as? String
                            self.usernameLabel.text = name
                        } else {
                            print("Document does not exist")
                        }
                    }
                }
    }
    
    @IBAction func logoutBtnClicked(_ sender: UIButton) {
        do{
            try FirebaseAuth.Auth.auth().signOut()
            let loginPage = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "loginNC")as! UINavigationController
            loginPage.modalPresentationStyle = .fullScreen
            loginPage.modalTransitionStyle = .coverVertical
            present(loginPage,animated: true, completion: nil)
            
        }catch {
            print("an error occured")
        }
    }
    
}
