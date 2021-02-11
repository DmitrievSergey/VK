//
//  ViewController.swift
//  VK
//
//  Created by Сергей Дмитриев on 11.02.2021.
//

import UIKit

class LogInViewController: UIViewController {

    @IBOutlet var passwordTextField: UITextField!
    
    @IBOutlet var logInTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        passwordTextField.isSecureTextEntry = true
    }

    @IBAction func closeButtonPressed(_ sender: Any) {
        print("closeButtonPressed")
        print(logInTextField.text!)
        print(passwordTextField.text!)
    }
    
    @IBAction func logInButtonPressed(_ sender: Any) {
        print("Закрываем......")
    }
}

