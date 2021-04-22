//
//  ViewController.swift
//  VK
//
//  Created by Сергей Дмитриев on 11.02.2021.
//

import UIKit
import WebKit

class LogInViewController: UIViewController {
    @IBOutlet var logInTextFIeld: UITextField!
    
    @IBOutlet var passwordTextField: UITextField!
    
    @IBOutlet var scrollView: UIScrollView!
    
    @IBOutlet weak var webview: WKWebView! {
        didSet{
            webview.navigationDelegate = self
        }
    }
    
 
    @IBOutlet weak var loaderView: LoaderView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTextField.isSecureTextEntry = true
        
        // Жест нажатия
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(tapView))
        // Присваиваем его UIScrollVIew
        scrollView?.addGestureRecognizer(hideKeyboardGesture)
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "oauth.vk.com"
        urlComponents.path = "/authorize"
        urlComponents.queryItems = [
            URLQueryItem(name: "client_id", value: "7833467"),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "scope", value: "262150"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "v", value: "5.68")
        ]
        
        let request = URLRequest(url: urlComponents.url!)
        
        webview.load(request)

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
            //loaderView.stopAnimation()
            NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
            NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        loaderView.animateThreeDots(withDuration: 1, withDelay: 0.5, withAlpha: 0.5)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
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
extension LogInViewController: WKNavigationDelegate {
    func webView (_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        guard let url = navigationResponse.response.url, url.path == "/blank.html", let fragment = url.fragment else {
            decisionHandler(.allow)
            return
        }
        
        let param = fragment
            .components(separatedBy: "&")
            .map { $0.components(separatedBy: "=") }
            .reduce([String: String] ()) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
            }
        
        let token = param["access_token"]
        let userId = param["user_id"]
        
        print("token = ")
        print(token as Any)
        
        Session.instance.token = token ?? ""
        Session.instance.userId = userId ?? ""
        
        NetworkService.loadGroups(userId: Session.instance.userId, token: Session.instance.token)
        NetworkService.loadGroupsBySearch(userId: Session.instance.userId, token: Session.instance.token, stringSearch: "IT")
        NetworkService.getAllUserPhotos(userId: Session.instance.userId, token: Session.instance.token)
        NetworkService.getUserFriends(userId: Session.instance.userId, token: Session.instance.token)
        
        
        performSegue(withIdentifier: "ToTabBarController", sender: nil)
        
        
        
        decisionHandler(.cancel)
    }
}

