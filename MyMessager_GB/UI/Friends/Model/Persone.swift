//
//  Persone.swift
//  MyMessager_GB
//
//  Created by Valentin Mironov on 04.05.2021.
//

import Foundation
import UIKit
struct Persone: Sender {
    
    var avatar: UIImage

    var name: String
    let surname: String
    let age: Int
    //    let photoNames: [String]
    let photos: [Picture]
    
    init(name: String, surname: String, age: Int, photos: [Picture]) {
        self.name = name
        self.surname = surname
        self.age = age
        self.photos = photos
        self.avatar = photos.first?.image ??  UIImage(systemName: "scribble.variable")!
    }
    
    static let frends: [Persone] = [
        Persone(name: "Андрей", surname: "Иванов", age: 25, photos: [Picture(image: UIImage(named: "11")), Picture(image: UIImage(named: "12"))]),
        
        Persone(name: "Данил", surname: "Петров", age: 37, photos: [Picture(image: UIImage(named: "21")),Picture(image: UIImage(named: "22")),Picture(image: UIImage(named: "23"))]),
        
        Persone(name: "Евгений", surname: "Звягинцев", age: 45, photos: [Picture(image: UIImage(named: "31")),Picture(image: UIImage(named: "32")),Picture(image: UIImage(named: "33"))]),
        
        Persone(name: "Алексей", surname: "Щербаков", age: 23, photos: [Picture(image: UIImage(named: "41"))]),
        
        Persone(name: "Валентин", surname: "Миронов", age: 20, photos: [Picture(image: UIImage(named: "51")),Picture(image: UIImage(named: "52")),Picture(image: UIImage(named: "53")),Picture(image: UIImage(named: "54"))]),
        
        Persone(name: "Илья", surname: "Иванов", age: 25, photos: [Picture(image: UIImage(named: "11")), Picture(image: UIImage(named: "12"))]),
        
        Persone(name: "Александр", surname: "Петров", age: 37, photos: [Picture(image: UIImage(named: "21")),Picture(image: UIImage(named: "22")),Picture(image: UIImage(named: "23"))]),
        
        Persone(name: "Евгений", surname: "Звягинцев", age: 45, photos: [Picture(image: UIImage(named: "31")),Picture(image: UIImage(named: "32")),Picture(image: UIImage(named: "33"))]),
        
        Persone(name: "Алексей", surname: "Щербаков", age: 23, photos: [Picture(image: UIImage(named: "41"))]),
        
        Persone(name: "Сергей", surname: "Миронов", age: 20, photos: [Picture(image: UIImage(named: "51")),Picture(image: UIImage(named: "52")),Picture(image: UIImage(named: "53")),Picture(image: UIImage(named: "54"))]),
        
        Persone(name: "Ольга", surname: "Обыкновенная", age: 20, photos: [Picture(image: UIImage(named: "61")),Picture(image: UIImage(named: "54"))]),
        
        Persone(name: "Человек", surname: "Необыкновенная", age: 20, photos: [Picture(image: UIImage(named: "71")),Picture(image: UIImage(named: "54"))])
    ]
    
}
