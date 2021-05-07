//
//  GroupsViewModel.swift
//  MyMessager_GB
//
//  Created by Valentin Mironov on 07.05.2021.
//

import Foundation
import UIKit
protocol GroupCellViewModel {
    var title: String { get }
    var subscription: String { get }
    var isSubscriber: Bool { get }
    var image: UIImage? { get }
    var subscribersCount: Int { get }
    var imageOnButtonSubscribe: UIImage? { get }
    var updateInformation: () -> () { get set }
    func subscribeAndUnsubscribe()
}

class GroupCellViewModelImpl {
    var updateInformation: () -> () = {}
    private var group: Group
    private var idGroup: Int
    init(group: Group, idGroup: Int) {
        self.group = group
        self.idGroup = idGroup
    }
}
//MARK: - GroupViewModel
extension GroupCellViewModelImpl: GroupCellViewModel{
    var imageOnButtonSubscribe: UIImage? {
        var image: UIImage?
        if isSubscriber{
            image =  UIImage(systemName: "checkmark.circle.fill")
        }else{
            image = UIImage(systemName: "checkmark.circle")
        }
        return image
    }
    
    var title: String { group.title }
    
    var subscription: String { group.subscription}
    
    var isSubscriber: Bool  { group.isSubscriber }
    
    var image: UIImage? { group.image }
    
    var subscribersCount: Int { group.subscribers.count }
    
    func subscribeAndUnsubscribe() {
        group.isSubscriber = !isSubscriber
        DefaultGroups.subscribeAndUnsubscribe(id: idGroup)
        updateInformation()
    }
}
