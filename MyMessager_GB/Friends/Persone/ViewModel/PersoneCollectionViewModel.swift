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
    func getPhotoWithIndexPath(row: Int) -> UIImage
    
}

class PersoneCollectionViewModelImpl {
    let person: Persone
    
    init(person: Persone){
        self.person = person
    }

}
extension PersoneCollectionViewModelImpl: PersoneCollectionViewModel{
    var numberOfItemsInSection: Int{
        person.photoNames.count
    }
    var title: String {
        person.firstname
    }
    
    func getPhotoWithIndexPath(row: Int) -> UIImage {
        let imageName = person.photoNames[row]
        return UIImage(named: imageName) ?? UIImage(systemName: "person")!
    }
}
