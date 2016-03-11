//
//  LGEmotionManager.swift
//  LGChatViewController
//
//  Created by Nikolai on 10/03/16.
//  Copyright © 2016 Nikolai. All rights reserved.
//

import UIKit

class LGEmotionManager: NSObject {
    
    var emotionArray: NSArray!
    
    var emotionDict: [String: NSArray]!
    
    /// dispatch_once
    static let shareInstance: LGEmotionManager = {
        return LGEmotionManager()
    }()
    
    
    override init() {
        super.init()
        if let fileName = NSBundle.mainBundle().pathForResource("emoji_config", ofType: "json") {
            emotionArray = try! NSJSONSerialization.JSONObjectWithData(NSData(contentsOfFile: fileName)!, options: NSJSONReadingOptions.AllowFragments) as! NSArray
            
            if emotionArray.count > 0 {
                emotionArray.enumerateObjectsUsingBlock({ (objc: AnyObject, index: Int, stop: UnsafeMutablePointer<ObjCBool>) -> Void in
                    let emotionData = objc as! NSArray
                    self.emotionDict = [(emotionData[1] as! String): [emotionData[0], emotionData[2]]]
                })
            }
        }
    }
}
