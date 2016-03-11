//
//  FriendModel.swift
//  LGChatViewController
//
//  Created by Nikolai on 09/03/16.
//  Copyright © 2016 Nikolai. All rights reserved.
//

import Foundation


struct Friend {
    let name: String
    let phone: String
    let iconName: String
}


struct FriendSession {
    let key: String
    let friends: [Friend]
}
