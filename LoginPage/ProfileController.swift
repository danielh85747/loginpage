//
//  ProfileController.swift
//  LoginPage
//
//  Created by apple user on 2017-02-11.
//  Copyright © 2017 apple user. All rights reserved.
//

import UIKit
import Firebase

class ProfileController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*let ref = FIRDatabase.database().reference(fromURL: "https://firstapp-cdc72.firebaseio.com/")
         
         ref.updateChildValues(["someValue": 246135])
         
         */

        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(handleLogout))
        
    }
    
    
    func handleLogout() {
        let loginController = ViewController()
        present(loginController, animated: true, completion: nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
