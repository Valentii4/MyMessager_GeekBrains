//
//  FriendsTableViewModel.swift
//  MyMessager_GB
//
//  Created by Valentin Mironov on 04.05.2021.
//

import Foundation
import UIKit
protocol FriendsTableViewModel {
    var sectionsCount: Int { get }
    var firstLetters: [String] { get }
    func getNameAndSurname(row: Int, section: Int) throws -> String
    func getPhoto(row: Int, section: Int) throws -> UIImage
    func getPersonVM(row: Int, section: Int) throws -> PersoneCollectionViewModel
    func getRowsInSection(section: Int) -> Int
    func getSectionsHeaderTitle(section: Int) -> String
    func getIndexPathSelectedLetter(letter: LettersControl.Letter) -> IndexPath
}

class FriendsTableViewModelImpl {
    private var friends: [LettersControl.Letter: Array<Persone>] = [:]
    private lazy var arrayFriends: [Dictionary<LettersControl.Letter, [Persone]>.Element] = {
        friends.sorted { $0.key < $1.key}
    }()
    
    private(set) var firstLetters: [LettersControl.Letter] = []
    
    init() {
        var allFriends = Persone.frends
        allFriends.sort{ $0.firstname < $1.firstname}
        firstLetters = Array(Set(allFriends.compactMap{String($0.firstname.first ?? "*")})).sorted()
        
        for firstLetter in firstLetters{
            let frendsWithFirstLetter = allFriends.filter { friend in
                String(friend.firstname.first ?? "*") == firstLetter
            }
            friends[firstLetter] = frendsWithFirstLetter
        }
    }
    
    private func isCheckingThePersonExistence(row: Int, section: Int) -> Bool{
        var result = arrayFriends.count > section
        if result{
            let arrayWithSections = arrayFriends[section]
            let rows = arrayWithSections.value.count
            result = rows > row
        }
        return result
    }
    
    func getFriend(row: Int, section: Int) throws -> Persone{
        guard isCheckingThePersonExistence(row: row, section: section) else{
            throw DefaultErrors.notFoundCell
        }
        return arrayFriends[section].value[row]
    }
    
}

extension FriendsTableViewModelImpl: FriendsTableViewModel{
    func getIndexPathSelectedLetter(letter: LettersControl.Letter) -> IndexPath{
        for (index,friend) in arrayFriends.enumerated(){
            if friend.key == letter{
                return IndexPath(row: 0, section: index)
            }
        }
        return IndexPath(row: 0, section: 0)
    }
    
    func getNameAndSurname(row: Int, section: Int) throws -> String {
        guard let friend = try? getFriend(row: row, section: section) else{
            throw DefaultErrors.notFoundCell
        }
        return friend.firstname + " " + friend.surname
    }
    
    func getPhoto(row: Int, section: Int) throws -> UIImage {
        guard let friend = try? getFriend(row: row, section: section) else{
            throw DefaultErrors.notFoundCell
        }
        guard let photo = friend.photos.first?.image  else {
            throw DefaultErrors.notHavePhotos
        }
        return photo
    }
    
    func getPersonVM(row: Int, section: Int) throws -> PersoneCollectionViewModel {
        guard let friend = try? getFriend(row: row, section: section) else{
            throw DefaultErrors.notFoundCell
        }
        return PersoneCollectionViewModelImpl(person: friend)
    }
    var sectionsCount: Int{
        friends.count
    }
    
    func getRowsInSection(section: Int) -> Int{
        return arrayFriends[section].value.count
    }
    
    func getSectionsHeaderTitle(section: Int) -> String{
        return arrayFriends[section].key
    }
}
