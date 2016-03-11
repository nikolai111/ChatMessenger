//
//  LGMoreView.swift
//  LGChatViewController
//
//  Created by Nikolai on 11/03/16.
//  Copyright © 2016 Nikolai. All rights reserved.
//

import UIKit


enum shareMoreType: Int {
    case picture = 1, video, location, record, timeSpeak, hongbao, personCard, store
    
    func imageForType() -> (UIImage, String) {
        var image = UIImage()
        var title = ""
        switch self {
        case .picture:
            image = UIImage(named: "sharemore_pic")!
            title = "Image"
        case .video:
            image = UIImage(named: "sharemore_videovoip")!
            title = "Video"
        case .location:
            image = UIImage(named: "sharemore_location")!
            title = "position"
        case .record:
            image = UIImage(named: "sharemore_sight")!
            title = "Sight"
        case .timeSpeak:
            image = UIImage(named: "sharemore_wxtalk")!
            title = "Voice"
        case .hongbao:
            image = UIImage(named: "sharemorePay")!
            title = "Bonus"
        case .personCard:
            image = UIImage(named: "sharemore_friendcard")!
            title = "Profile"
        case .store:
            image = UIImage(named: "sharemore_myfav")!
            title = "Save"
        }
        return (image, title)
    }
}


class LGShareMoreView: UIView {

    let shareCount = 8

    let marginW = 30
    let marginH = 20
    let buttonH: CGFloat = 59
    
    
    convenience init(frame: CGRect, selector: Selector, target: AnyObject) {
        self.init(frame: frame)
        backgroundColor = UIColor(hexString: "F4F4F6")
        
        let marginX = (bounds.width - CGFloat(2 * marginW) - CGFloat(4 * buttonH)) / 3
        for i in 0...shareCount - 1 {
            let row = i / 4
            let column = i % 4
            
            let button = UIButton(type: .Custom)
            button.tag = i + 1
            button.addTarget(target, action: selector, forControlEvents: .TouchUpInside)
            
            let image = shareMoreType(rawValue: i + 1)?.imageForType().0
            let title = shareMoreType(rawValue: i + 1)?.imageForType().1
            
            button.setImage(image, forState: .Normal)
            button.setTitleColor(UIColor.blackColor(), forState: .Normal)
            button.setTitle(title, forState: .Normal)
            
//            button.titleEdgeInsets = UIEdgeInsetsMake(53, -59, 0, 0)
//            button.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 21, 0)
            
            button.setBackgroundImage(UIImage(named: "sharemore_otherDown"), forState: .Normal)
            button.setBackgroundImage(UIImage(named: "sharemore_otherDownHL"), forState: .Highlighted)
            
            let buttonX = CGFloat(marginW) + (buttonH + marginX) * CGFloat(column)
            let buttonY = CGFloat(marginH) + (buttonH + CGFloat(marginH)) * CGFloat(row)
            button.frame = CGRectMake(buttonX, buttonY, buttonH, buttonH)
            addSubview(button)
        }

    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

