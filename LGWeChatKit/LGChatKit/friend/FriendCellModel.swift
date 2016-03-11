//
//  FriendCellModel.swift
//  LGChatViewController
//
//  Created by Nikolai on 11/03/16.
//  Copyright © 2016 Nikolai. All rights reserved.
//

import Foundation


class contactCellModel {
    let name: Observable<String>
    let phone: Observable<String>
    let iconName: Observable<String>
    
    init(_ friend: Friend) {
        name = Observable(friend.name)
        phone = Observable(friend.phone)
        iconName = Observable(friend.iconName)
    }
}

class contactSessionModel {
    let key: Observable<String>
    let friends: Observable<[contactCellModel]>
    
    init() {
        key = Observable("")
        friends = Observable([])
    }
}