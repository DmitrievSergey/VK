//
//  ViewController.swift
//  VK
//
//  Created by Сергей Дмитриев on 11.02.2021.
//

import UIKit

class LogInViewController: UIViewController {
    @IBOutlet var logInTextFIeld: UITextField!
    
    @IBOutlet var passwordTextField: UITextField!
    
    @IBOutlet var scrollView: UIScrollView!
    
 
    @IBOutlet weak var loaderView: LoaderView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTextField.isSecureTextEntry = true
        
        // Жест нажатия
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(tapView))
        // Присваиваем его UIScrollVIew
        scrollView?.addGestureRecognizer(hideKeyboardGesture)

    }
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            
            // Подписываемся на два уведомления: одно приходит при появлении клавиатуры
            NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
            // Второе — когда она пропадает
            NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        }
    
    override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            
            NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
            NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        loaderView.animateThreeDots(withDuration: 1, withDelay: 0.5, withAlpha: 0.5)
    }

    @IBAction func tapView(_ sender: UITapGestureRecognizer) {
        scrollView.endEditing(true)
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
    }
    
    @objc func keyboardWasShown(notification: Notification) {
            
            // Получаем размер клавиатуры
            let info = notification.userInfo! as NSDictionary
            let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
            let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
            
            // Добавляем отступ внизу UIScrollView, равный размеру клавиатуры
            self.scrollView?.contentInset = contentInsets
            scrollView?.scrollIndicatorInsets = contentInsets
        }
    
    //Когда клавиатура исчезает
        @objc func keyboardWillBeHidden(notification: Notification) {
            // Устанавливаем отступ внизу UIScrollView, равный 0
            let contentInsets = UIEdgeInsets.zero
            scrollView?.contentInset = contentInsets
        }
        
    /*@objc func hideKeyboard() {
            self.scrollView?.endEditing(true)
        }*/
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        let checkResult = checkUserData()
        
        if !checkResult {
            showLoginError()
        }
        
        return checkResult
    }
    
    func checkUserData() -> Bool {
        guard let login = logInTextFIeld.text,
              let password = passwordTextField.text else{return false}
        
        if login == "" && password == "" {
            return true
        } else {
            return false
        }
    }
    
    func showLoginError() {
        let alert = UIAlertController(
            title: "Некорректные данные",
            message: "Логин или пароль введены некорректно. Попробуйте еще раз!",
            preferredStyle: .alert)
        
        let action = UIAlertAction(
            title: "OK",
            style: .cancel,
            handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }

}

