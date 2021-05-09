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
    private let friends: [Persone] = [Persone(firstname: "Иванов", surname: "Иван", age: 25, photos: [Picture(image: UIImage(named: "11")), Picture(image: UIImage(named: "12"))]),
                                      
                                      Persone(firstname: "Петров", surname: "Иван", age: 37, photos: [Picture(image: UIImage(named: "21")),Picture(image: UIImage(named: "22")),Picture(image: UIImage(named: "23"))]),
                                      
                                      Persone(firstname: "Сидоров", surname: "Иван", age: 45, photos: [Picture(image: UIImage(named: "31")),Picture(image: UIImage(named: "32")),Picture(image: UIImage(named: "33"))]),
                                      
                                      Persone(firstname: "Щербаков", surname: "Иван", age: 23, photos: [Picture(image: UIImage(named: "41"))]),
                                      
                                      Persone(firstname: "Миронов", surname: "Валентин", age: 20, photos: [Picture(image: UIImage(named: "51")),Picture(image: UIImage(named: "52")),Picture(image: UIImage(named: "53")),Picture(image: UIImage(named: "54"))]),
                                      
                                      Persone(firstname: "Ящерка", surname: "Обыкновенная", age: 20, photos: [Picture(image: UIImage(named: "61")),Picture(image: UIImage(named: "54"))]),
                                      
                                      Persone(firstname: "Ящерка", surname: "Необыкновенная", age: 20, photos: [Picture(image: UIImage(named: "71")),Picture(image: UIImage(named: "54"))])]
    
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
        
        guard let photo = frend.photos.first?.image  else {
            throw DefaultErrors.notHavePhotos
        }
        return photo
    }
}
