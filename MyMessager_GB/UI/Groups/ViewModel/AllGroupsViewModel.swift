//
//  AllGroupsViewModel.swift
//  MyMessager_GB
//
//  Created by Valentin Mironov on 07.05.2021.
//

import Foundation
class AllGroupsViewModel: MyGroupsViewModel{
    private let isSubscriber = false
    override init() {
        super.init()
        setGroups(isSubscriber: isSubscriber)
    }
    
    override func updateGroups() {
        setGroups(isSubscriber: isSubscriber)
    }
}
