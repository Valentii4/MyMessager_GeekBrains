//
//  AuthorizationModel.swift
//  MyMessager_GB
//
//  Created by Valentin Mironov on 24.04.2021.
//

import Foundation
//подскажите как сделать так чтоб эта модель была видна только в файле Authorization
// чтоб я не мог обращатся к ней из других файлов
// если делаю fileprivate то не видно в viewmodel
struct AuthorizationModel {
    let login: String
    let password: String
}
