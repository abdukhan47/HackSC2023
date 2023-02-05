//
//  RegistrationViewController.swift
//  DiabetesNutrition
//
//  Created by Abdulah Khan on 2/3/23.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet var userTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    @IBAction func closeKeyboards(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func closeKeyboard(_ sender: Any) {
        
        userTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
    }
    
    @IBAction func loginPress(_ sender: Any) {
        guard userTextField.text?.isEmpty == false, passwordTextField.text?.isEmpty == false else {
          print("Empty field!")
          return
        }

        Auth.auth().signIn(withEmail: userTextField.text!, password:
        passwordTextField.text!) { [weak self] authResult, err in
          guard let strongSelf = self else {return}
          if let err = err {
            print(err.localizedDescription)
              return
          }
        }
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "barController")
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)

    }
    
    @IBAction func registerPress(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "signUp")
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
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
