//
//  Group.swift
//  MyMessager_GB
//
//  Created by Valentin Mironov on 07.05.2021.
//

import Foundation
import UIKit
struct Group {
    let title: String
    let subscription: String
    var subscribers: [Persone] = []
    var isSubscriber: Bool = false
    var image: UIImage? = nil
}
