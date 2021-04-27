//
//  AuthorizationViewController.swift
//  MyMessager_GB
//
//  Created by Valentin Mironov on 24.04.2021.
//

import UIKit


class AuthorizationViewController: UIViewController {
    
    var vm: AuthorizationViewModel?
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vm = AuthorizationViewModelImpl()
        settingOnStart()
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
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard identifier == "loginSegue",
              let isLogin = vm?.login(login: loginTextField?.text,
                                      password: passwordTextField?.text,
                                      showErros: { allert in
                                        self.present(allert, animated: true)
                                      })
        else{
            return false
        }
        
        return isLogin
    }
    
    //MARK: - Settings
    private func settingOnStart(){
        loginTextField.delegate = self
        passwordTextField.delegate = self
        loginButton.layer.cornerRadius = 10
        vm?.isEnabledButtonNextUpdate = { [weak self] in
            if self?.vm?.isEnabledButtonNext ?? true{
                self?.loginButton.isEnabled = false
                self?.loginButton.backgroundColor = .systemGray
            }else{
                self?.loginButton.isEnabled = true
                self?.loginButton.backgroundColor = .systemBlue
            }
        }
        vm?.isEnabledButtonNextUpdate()
    }
}
//MARK: - TextField delegate
extension AuthorizationViewController: UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        vm?.input(login: loginTextField.text, password: passwordTextField.text)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        vm?.input(login: loginTextField.text, password: passwordTextField.text)
    }
}


//MARK: - Keyboard
extension AuthorizationViewController{
    // Когда клавиатура появляется
    @objc func keyboardWasShown(notification: Notification) {
        // Получаем размер клавиатуры
        guard let info = notification.userInfo as NSDictionary?, let infoValue = info.value(forKey:  UIResponder.keyboardFrameEndUserInfoKey) as? NSValue else{
            print(#function)
            print(#file)
            print("Errors: notification.userInfo is not possible to bring NSDictionary")
            return
        }
        let kbSize = (infoValue).cgRectValue.size
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
}
