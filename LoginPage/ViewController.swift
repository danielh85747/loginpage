//
//  ViewController.swift
//  LoginPage
//
//  Created by apple user on 2017-02-05.
//  Copyright © 2017 apple user. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UITableViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*let ref = FIRDatabase.database().reference(fromURL: "https://firstapp-cdc72.firebaseio.com/")
         
         ref.updateChildValues(["someValue": 246135])
         
         */
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(handleLogout))
        
        if FIRAuth.auth()?.currentUser == nil {
            handleLogout()
        }
        
    }
    
    
    func handleLogout() {
        
        do {
            
            try FIRAuth.auth()?.signOut()
            
        } catch let logOutError {
            print(logOutError)
        }
        
        let loginController = LoginController()
        self.present(loginController, animated: true, completion: nil)
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
}



}
