//
//  AuthorizationViewModel.swift
//  MyMessager_GB
//
//  Created by Valentin Mironov on 24.04.2021.
//

import Foundation
import UIKit
protocol AuthorizationViewModel {
    var isEnabledButtonNext: Bool { get }
    var isEnabledButtonNextUpdate: () -> () { get set }
    //MARK: - На сколько нормальным считается решением кинуть сюда создание алерта для отображения? обычно же в VM даже не импортируют UIKit или за исключениями норм?
    func login(login: String?, password: String?, showErros: @escaping (_ view: UIAlertController) -> ()) -> Bool
    func input(login: String?, password: String?)
}

class AuthorizationViewModelImpl: AuthorizationViewModel {
    var isEnabledButtonNext: Bool = true
    var isEnabledButtonNextUpdate: () -> () = {}
    
    func input(login: String?, password: String?) {
        let isEnable = false
        if let login = login, let password = password, login.count != 0, password.count != 0{
            isEnabledButtonNext = isEnable
        }else{
            isEnabledButtonNext = !isEnable
        }
        isEnabledButtonNextUpdate()
    }
    
    func login(login: String?, password: String?, showErros: @escaping (_ view: UIAlertController) -> ()) -> Bool{
        guard let login = login, let password = password else {
            showErros(createAllertErrors(messageErrors: "Логин или пароль введен не введен"))
            return false
        }
            
        let model = AuthorizationModel(login: login, password: password)
        let isAuthorization = checkParams(model: model)
        if !isAuthorization{
            showErros(createAllertErrors(messageErrors: "Пользователя с данными параметрами не существует"))
            return false
        }else{
            print("Вы успешно авторизовались")
            return true
        }
    }

    private func createAllertErrors(messageErrors: String) -> UIAlertController{
        let allert = UIAlertController(title: "Ошибка входа", message: messageErrors, preferredStyle: .alert)
        let buttonCancel = UIAlertAction(title: "Ок", style: .default)
        allert.addAction(buttonCancel)
        return allert
    }
    
    private func checkParams(model: AuthorizationModel) -> Bool{
        checkLogin(login: model.login) && checkPassword(password: model.password)
    }
    
    private func checkLogin(login: String) -> Bool{
        login == "admin"
    }
    
    private func checkPassword(password: String) -> Bool{
        password == "123"
    }
}
