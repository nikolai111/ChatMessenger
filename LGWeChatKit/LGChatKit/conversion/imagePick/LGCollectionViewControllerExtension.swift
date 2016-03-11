//
//  LGCollectionControllerExtension.swift
//  LGWeChatKit
//
//  Created by Nikolai on 10/03/16.
//  Copyright © 2016 Nikolai. All rights reserved.
//


import UIKit
import ObjectiveC


private var selectedIndexPathKey: UInt8 = 101
extension UICollectionViewController {
    var selectedIndexPath: NSIndexPath?{
        get {
            return objc_getAssociatedObject(self, &selectedIndexPathKey) as? NSIndexPath
        }
        
        set {
            objc_setAssociatedObject(self, &selectedIndexPathKey, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
    }
}