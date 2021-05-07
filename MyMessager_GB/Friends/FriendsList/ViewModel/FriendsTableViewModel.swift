//
//  FriendsTableViewModel.swift
//  MyMessager_GB
//
//  Created by Valentin Mironov on 04.05.2021.
//

import Foundation
import UIKit
protocol FriendsTableViewModel {
    var rows: Int { get }
    func getNameAndSurname(index: Int) throws -> String
    func getPhoto(index: Int) throws -> UIImage
    func getPersonVM(index: Int) throws -> PersoneCollectionViewModel
}

class FriendsTableViewModelImpl {
    private let friends: [Persone] = [Persone(firstname: "Иванов", surname: "Иван", age: 25, photoNames: ["11", "12"]),
                                      Persone(firstname: "Петров", surname: "Иван", age: 37, photoNames: ["21", "22", "23"]),
                                      Persone(firstname: "Сидоров", surname: "Иван", age: 45, photoNames: ["31","32","33"]),
                                      Persone(firstname: "Щербаков", surname: "Иван", age: 23, photoNames: ["41"]),
                                      Persone(firstname: "Миронов", surname: "Валентин", age: 20, photoNames: ["51","52","53","54"])]
      
    private func isCheckingThePersonExistence(index: Int) -> Bool{
        index < friends.count
    }
    
}

extension FriendsTableViewModelImpl: FriendsTableViewModel{
    func getPersonVM(index: Int) throws -> PersoneCollectionViewModel {
        guard isCheckingThePersonExistence(index: index) else{
            throw DefaultErrors.notFoundCell
        }
        return PersoneCollectionViewModelImpl(person: friends[index])
    }
    var rows: Int{
        friends.count
    }
    
    func getNameAndSurname(index: Int) throws -> String{
        guard isCheckingThePersonExistence(index: index) else{
            throw DefaultErrors.notFoundCell
        }
        let frend = friends[index]
        return frend.firstname + " " + frend.surname
    }
    
    //MARK: - HELP
    /*
     Нормально ли что тут я пользуюсь UIKit'ом? или стоило передавать имя? или как-то по другому?
     */
    func getPhoto(index: Int) throws -> UIImage{
        guard isCheckingThePersonExistence(index: index) else{
            throw DefaultErrors.notFoundCell
        }
        let frend = friends[index]
        
        guard let photoName = frend.photoNames.first, let photo = UIImage(named: photoName) else {
            throw DefaultErrors.notHavePhotos
        }
        return photo
    }
}
