//
//  ViewController.swift
//  LoginPage
//
//  Created by apple user on 2017-02-05.
//  Copyright © 2017 apple user. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController, UITextFieldDelegate {
    
    
    let boxView: UIView = {
      let view = UIView()
      view.backgroundColor = UIColor.white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 15
        view.layer.masksToBounds = true
      return view
    }()
    
    let nameText: UITextField = {
       let name = UITextField()
        name.placeholder = "Name"
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    let nameSplit: UIView = {
        let splitView = UIView()
        splitView.backgroundColor = UIColor(r: 220, g: 220, b: 220)
        splitView.translatesAutoresizingMaskIntoConstraints = false
        return splitView
    }()
    
    let emailText: UITextField = {
        let email = UITextField()
        email.placeholder = "Email Address"
        email.keyboardType = .emailAddress
        email.translatesAutoresizingMaskIntoConstraints = false
        return email
    }()
    
    let emailSplit: UIView = {
        let splitView = UIView()
        splitView.backgroundColor = UIColor(r: 220, g: 220, b: 220)
        splitView.translatesAutoresizingMaskIntoConstraints = false
        return splitView
    }()
    
    let passText: UITextField = {
        let password = UITextField()
        password.placeholder = "Password"
        password.isSecureTextEntry = true
        password.translatesAutoresizingMaskIntoConstraints = false
        return password
    }()
    
    lazy var signUpLogin: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(r: 184, g: 99, b: 163)
        button.setTitle("Register", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 15
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(handleRegister), for: .touchUpInside)
        return button
    }()
    
    func handleRegister() {
        guard let email = emailText.text, let pass = passText.text, let name = nameText.text else {
            print("Invalid Form")
            return
        }
        
        FIRAuth.auth()?.createUser(withEmail: email, password: pass, completion: { (user: FIRUser?, error) in
            
            if error != nil {
                print(error!)
                return
            }
            
            guard let uid = user?.uid else {
                return
            }
            
            //Successfully authenticated user
            let ref = FIRDatabase.database().reference(fromURL: "https://firstapp-cdc72.firebaseio.com/")
            let userRef = ref.child("users").child(uid)
            let values = ["name": name, "email": email, "password": pass]
            userRef.updateChildValues(values, withCompletionBlock: { (err, ref) in
                
                if err != nil {
                    print(err!)
                    return
                }
                
                print("User successfuly savled into database")
                
            })
            
        })
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(r: 194, g: 109, b: 173)
        
        view.addSubview(boxView)
        view.addSubview(signUpLogin)
        
        setupContainer()
        setupButton()
        
    }
    
    func setupContainer() {
        
        boxView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        boxView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        boxView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -12).isActive = true
        boxView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        
        boxView.addSubview(nameText)
        boxView.addSubview(nameSplit)
        boxView.addSubview(emailText)
        boxView.addSubview(emailSplit)
        boxView.addSubview(passText)
        
        nameText.leftAnchor.constraint(equalTo: boxView.leftAnchor, constant: 12).isActive = true
        nameText.topAnchor.constraint(equalTo: boxView.topAnchor).isActive = true
        nameText.widthAnchor.constraint(equalTo: boxView.widthAnchor).isActive = true
        nameText.heightAnchor.constraint(equalTo: boxView.heightAnchor, multiplier: 1/3).isActive = true
        
        nameSplit.leftAnchor.constraint(equalTo: boxView.leftAnchor).isActive = true
        nameSplit.topAnchor.constraint(equalTo: nameText.bottomAnchor).isActive = true
        nameSplit.widthAnchor.constraint(equalTo: boxView.widthAnchor).isActive = true
        nameSplit.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        emailText.leftAnchor.constraint(equalTo: boxView.leftAnchor, constant: 12).isActive = true
        emailText.topAnchor.constraint(equalTo: nameText.bottomAnchor).isActive = true
        emailText.widthAnchor.constraint(equalTo: boxView.widthAnchor).isActive = true
        emailText.heightAnchor.constraint(equalTo: boxView.heightAnchor, multiplier: 1/3).isActive = true
        
        emailSplit.leftAnchor.constraint(equalTo: boxView.leftAnchor).isActive = true
        emailSplit.topAnchor.constraint(equalTo: emailText.bottomAnchor).isActive = true
        emailSplit.widthAnchor.constraint(equalTo: boxView.widthAnchor).isActive = true
        emailSplit.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        passText.leftAnchor.constraint(equalTo: boxView.leftAnchor, constant: 12).isActive = true
        passText.topAnchor.constraint(equalTo: emailText.bottomAnchor).isActive = true
        passText.widthAnchor.constraint(equalTo: boxView.widthAnchor).isActive = true
        passText.heightAnchor.constraint(equalTo: boxView.heightAnchor, multiplier: 1/3).isActive = true
        
        
        
    }
    
    func setupButton() {
        signUpLogin.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        signUpLogin.topAnchor.constraint(equalTo: boxView.bottomAnchor, constant: 10).isActive = true
        signUpLogin.widthAnchor.constraint(equalTo: boxView.widthAnchor).isActive = true
        signUpLogin.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }


}

extension UIColor {
    
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
    
}

