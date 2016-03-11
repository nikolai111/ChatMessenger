//
//  LGConversionListCellModel.swift
//  LGChatViewController
//
//  Created by Nikolai on 10/03/16.
//  Copyright © 2016 Nikolai. All rights reserved.
//

import Foundation


class LGConversionListCellModel {
    let iconName: Observable<String>
    let userName: Observable<String>
    let lastMessage: Observable<String>
    let timer: Observable<String>
    
    private let emptyString = ""
    
    init() {
        iconName = Observable(emptyString)
        userName = Observable(emptyString)
        lastMessage = Observable(emptyString)
        timer = Observable(emptyString)
    }
}