//
//  File.swift
//  MyMessager_GB
//
//  Created by Valentin Mironov on 04.05.2021.
//

import Foundation
import UIKit
protocol PersoneCollectionViewModel {
    var numberOfItemsInSection: Int { get }
    var title: String { get }
    func getPhotoWithIndexPath(row: Int) -> Picture
    
}

class PersoneCollectionViewModelImpl {
    let person: Persone
    
    init(person: Persone){
        self.person = person
    }

}
extension PersoneCollectionViewModelImpl: PersoneCollectionViewModel{
    var numberOfItemsInSection: Int{
        person.photos.count
    }
    var title: String {
        person.name
    }
    
    func getPhotoWithIndexPath(row: Int) -> Picture {
        let picture = person.photos[row]
        return picture
    }
}
