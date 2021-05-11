//
//  Persone.swift
//  MyMessager_GB
//
//  Created by Valentin Mironov on 04.05.2021.
//

import Foundation
import UIKit
struct Persone {
    let firstname: String
    let surname: String
    let age: Int
    //    let photoNames: [String]
    let photos: [Picture]
    
    static let frends: [Persone] = [
        Persone(firstname: "Андрей", surname: "Иванов", age: 25, photos: [Picture(image: UIImage(named: "11")), Picture(image: UIImage(named: "12"))]),
        
        Persone(firstname: "Данил", surname: "Петров", age: 37, photos: [Picture(image: UIImage(named: "21")),Picture(image: UIImage(named: "22")),Picture(image: UIImage(named: "23"))]),
        
        Persone(firstname: "Евгений", surname: "Звягинцев", age: 45, photos: [Picture(image: UIImage(named: "31")),Picture(image: UIImage(named: "32")),Picture(image: UIImage(named: "33"))]),
        
        Persone(firstname: "Алексей", surname: "Щербаков", age: 23, photos: [Picture(image: UIImage(named: "41"))]),
        
        Persone(firstname: "Валентин", surname: "Миронов", age: 20, photos: [Picture(image: UIImage(named: "51")),Picture(image: UIImage(named: "52")),Picture(image: UIImage(named: "53")),Picture(image: UIImage(named: "54"))]),
        
        Persone(firstname: "Илья", surname: "Иванов", age: 25, photos: [Picture(image: UIImage(named: "11")), Picture(image: UIImage(named: "12"))]),
        
        Persone(firstname: "Александр", surname: "Петров", age: 37, photos: [Picture(image: UIImage(named: "21")),Picture(image: UIImage(named: "22")),Picture(image: UIImage(named: "23"))]),
        
        Persone(firstname: "Евгений", surname: "Звягинцев", age: 45, photos: [Picture(image: UIImage(named: "31")),Picture(image: UIImage(named: "32")),Picture(image: UIImage(named: "33"))]),
        
        Persone(firstname: "Алексей", surname: "Щербаков", age: 23, photos: [Picture(image: UIImage(named: "41"))]),
        
        Persone(firstname: "Сергей", surname: "Миронов", age: 20, photos: [Picture(image: UIImage(named: "51")),Picture(image: UIImage(named: "52")),Picture(image: UIImage(named: "53")),Picture(image: UIImage(named: "54"))]),
        
        Persone(firstname: "Ольга", surname: "Обыкновенная", age: 20, photos: [Picture(image: UIImage(named: "61")),Picture(image: UIImage(named: "54"))]),
        
        Persone(firstname: "Человек", surname: "Необыкновенная", age: 20, photos: [Picture(image: UIImage(named: "71")),Picture(image: UIImage(named: "54"))])
    ]
    
}
