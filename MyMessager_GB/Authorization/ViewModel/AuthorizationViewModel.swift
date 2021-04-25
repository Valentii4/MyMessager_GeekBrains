//
//  AuthorizationViewModel.swift
//  MyMessager_GB
//
//  Created by Valentin Mironov on 24.04.2021.
//

import Foundation
protocol AuthorizationViewModel {
    var isEnabledButtonNext: Bool { get }
    var isEnabledButtonNextUpdate: () -> () { get set }
    func login(login: String?, password: String?)
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
    
    func login(login: String?, password: String?) {
        guard let login = login, let password = password else {
            print("Логин или пароль введен не верно")
            return
        }
            
        let model = AuthorizationModel(login: login, password: password)
        let isAuthorization = checkParams(model: model)
        let result: String =  isAuthorization ? "Вы авторизовались" : "Вы не авторизовались"
        print(result)
    }
    
    private func checkParams(model: AuthorizationModel) -> Bool{
        checkLogin(login: model.login) && checkPassword(password: model.password)
    }
    
    //Подскажите где должны находится эти два медота в AuthorizationModel или тут?
    private func checkLogin(login: String) -> Bool{
        login == "admin"
    }
    
    private func checkPassword(password: String) -> Bool{
        password == "123"
    }
}
