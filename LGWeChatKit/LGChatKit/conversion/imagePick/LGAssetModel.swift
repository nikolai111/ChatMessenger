//
//  LGAssetModel.swift
//  LGChatViewController
//
//  Created by Nikolai on 09/03/16.
//  Copyright © 2016 Nikolai. All rights reserved.
//

import Foundation
import Photos

class LGAssetModel {
    var select: Bool
    var asset: PHAsset
    
    init(asset: PHAsset, select: Bool) {
        self.asset = asset
        self.select = select
    }
    
    func setSelect(isSelect: Bool) {
        self.select = isSelect
    }
}