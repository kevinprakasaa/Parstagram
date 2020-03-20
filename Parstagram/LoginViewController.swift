//
//  LoginViewController.swift
//  Parstagram
//
//  Created by Kevin Prakasa on 3/18/20.
//  Copyright © 2020 codepath. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onSignIn(_ sender: Any) {
       if usernameField.text!.isEmpty || passwordField.text!.isEmpty
        {
          let alert = UIAlertController(
            title: "Invalid Login",
            message: "Please fill user and password",
            preferredStyle: UIAlertController.Style.alert)
          let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
             
          }
          alert.addAction(OKAction)
          present(alert, animated: true, completion: nil)
          return
        } else {
           let username = usernameField.text ?? ""
           let password = passwordField.text ?? ""

           PFUser.logInWithUsername(inBackground: username, password: password) { (user: PFUser?, error: Error?) in
                if let error = error {
                  print("User log in failed: \(error.localizedDescription)")
                } else {
                  print("User logged in successfully")
                  self.performSegue(withIdentifier: "loginSegue", sender: nil)
                  // display view controller that needs to shown after successful login
                }
             }
            
        }
    }
    
    @IBAction func onSignUp(_ sender: Any) {
        if usernameField.text!.isEmpty || passwordField.text!.isEmpty
        {
          let alert = UIAlertController(
            title: "Invalid Sign Up",
            message: "Please fill user and password",
            preferredStyle: UIAlertController.Style.alert)
          let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
             
          }
          alert.addAction(OKAction)
          present(alert, animated: true, completion: nil)
          return
        } else {
            let user = PFUser()
             user.username = usernameField.text
             user.password = passwordField.text
            
             user.signUpInBackground { (success: Bool, error: Error?) in
                 if let error = error {
                     print(error.localizedDescription)
                 } else {
                     print("User Registered successfully")
                     // manually segue to logged in view
                 }
             }
        }
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
