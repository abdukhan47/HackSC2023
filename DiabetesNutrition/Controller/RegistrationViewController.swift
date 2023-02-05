//
//  RegistrationViewController.swift
//  DiabetesNutrition
//
//  Created by Abdulah Khan on 2/3/23.
//

import UIKit
import Firebase
import FirebaseAuth

class RegistrationViewController: UIViewController {

    @IBOutlet weak var registerButton: UIButton!
    struct DefaultsKeys {
        static let weight = "140"
        static let gender = "male"
        static let age = "18"
    }
    
    @IBOutlet var userTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    @IBOutlet weak var ageField: UITextField!
    
    @IBOutlet weak var weightField: UITextField!
    
    @IBOutlet weak var genderField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerButton.layer.cornerRadius = 10
        // Do any additional setup after loading the view.
        let defaults = UserDefaults.standard
        defaults.set("Some String Value", forKey: DefaultsKeys.weight)
        defaults.set("Another String Value", forKey: DefaultsKeys.gender)
        
        //let defaults = UserDefaults.standard
        if let stringOne = defaults.string(forKey: DefaultsKeys.weight) {
            print(stringOne) // Some String Value
        }
        if let stringTwo = defaults.string(forKey: DefaultsKeys.gender) {
            print(stringTwo) // Another String Value
        }
    }
    
    @IBAction func closeKeyboards(_ sender: Any) {
        userTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        ageField.resignFirstResponder()
        genderField.resignFirstResponder()
        weightField.resignFirstResponder()
        
    }
    
    
    
    @IBAction func registerPress(_ sender: Any) {
        guard userTextField.text?.isEmpty == false, passwordTextField.text?.isEmpty == false else {
          print("Empty field!")
          return
        }

        Auth.auth().createUser(withEmail: userTextField.text!, password:
        passwordTextField.text!) { (authResult, error) in
          guard let user = authResult?.user, error == nil else {
            print("Error \(error?.localizedDescription)")
            return
          }
        }
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "barController")
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
