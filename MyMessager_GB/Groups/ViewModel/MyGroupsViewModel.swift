//
//  MyGroupsViewModel.swift
//  MyMessager_GB
//
//  Created by Valentin Mironov on 07.05.2021.
//

import Foundation
class MyGroupsViewModel: GroupsViewModel {
    private let isSubscriber = true
    //хотелось бы как-то скрыть сами группы от юзера, но для наследования не получается так сделать
     private(set) var groups: DefaultGroups.GroupsDictionary<Group> = DefaultGroups.getGroup(isSubscriber: true)
    
    var numberOfSections: Int = 0
    
    func numberOfRowsInSection(sections: Int = 0) -> Int {
        groups.count
    }
    
    func groupViewModel(sections: Int = 0, row: Int) -> GroupCellViewModel {
        let group = Array(groups)[row]
        return GroupCellViewModelImpl(group: group.value, idGroup: group.key)
    }
    
    func updateGroups() {
        setGroups(isSubscriber: isSubscriber)
    }
    
    func setGroups(isSubscriber: Bool){
        self.groups = DefaultGroups.getGroup(isSubscriber: isSubscriber)
    }
}
