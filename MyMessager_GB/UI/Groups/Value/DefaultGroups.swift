//
//  DefaultGroups.swift
//  MyMessager_GB
//
//  Created by Valentin Mironov on 07.05.2021.
//

import Foundation
import UIKit
struct DefaultGroups{
    typealias GroupsDictionary<Group> = Dictionary<Int, Group>
    static var groups: GroupsDictionary<Group> = [1: Group(title: "Группа1", subscription: "Это пример описания для группы 1", subscribers: [], isSubscriber: true, image: UIImage(named: "11")),
                                                  2: Group(title: "Группа2", subscription: "Это пример описания для группы 2", subscribers: [], isSubscriber: false, image: UIImage(named: "12")),
                                                  3: Group(title: "Группа3", subscription: "Это пример описания для группы 3", subscribers: [], isSubscriber: false, image: UIImage(named: "21")),
                                                  4: Group(title: "Группа4", subscription: "Это пример описания для группы 4", subscribers: [], isSubscriber: false, image: UIImage(named: "22")),
                                                  5: Group(title: "Группа5", subscription: "Это пример описания для группы 5", subscribers: [], isSubscriber: true, image: UIImage(named: "23")),
                                                  6: Group(title: "Группа6", subscription: "Это пример описания для группы 6", subscribers: [], isSubscriber: false, image: UIImage(named: "31")),
                                                  7: Group(title: "Группа7", subscription: "Это пример описания для группы 7", subscribers: [], isSubscriber: false, image: UIImage(named: "32")),
                                                  8: Group(title: "Группа8", subscription: "Это пример описания для группы 8", subscribers: [], isSubscriber: false, image: UIImage(named: "33")),
                                                  9: Group(title: "Группа9", subscription: "Это пример описания для группы 9", subscribers: [], isSubscriber: false, image: UIImage(named: "41")),
                                                  10: Group(title: "Группа10", subscription: "Это пример описания для группы 10", subscribers: [], isSubscriber: true, image: UIImage(named: "51"))]
    
    static func getGroup(isSubscriber: Bool) -> GroupsDictionary<Group> {
        groups.filter { group in
            group.value.isSubscriber == isSubscriber
        }
    }
    
    static func subscribeAndUnsubscribe(id: Int){
        guard let group = groups[id] else{
            return
        }
        groups[id]?.isSubscriber = !group.isSubscriber
    }
    
}
