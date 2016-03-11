//
//  LGFindViewController.swift
//  LGChatViewController
//
//  Created by Nikolai on 10/03/16.
//  Copyright © 2016 Nikolai. All rights reserved.
//

import UIKit
import CoreSpotlight
import MobileCoreServices


let uniqueIdentifier = "com.nikolai.wechat"
let domainIdentifier = "Nikolai"

class LGFindViewController: UITableViewController {
    
    var activity: NSUserActivity!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Find"
        view.backgroundColor = UIColor.groupTableViewBackgroundColor()
        // Do any additional setup after loading the view.
        
        let activityType = String(format: "%@.%@", uniqueIdentifier, domainIdentifier)
        activity = NSUserActivity(activityType: activityType)
        activity.title = "nikolai-search"
        activity.keywords = Set<String>(arrayLiteral: "WeChat", "nikolai", "MJ")
        activity.eligibleForSearch = true
        activity.becomeCurrent()
        
        // core spotlight
        let attributeSet = CSSearchableItemAttributeSet(itemContentType: kUTTypeImage as String)
        attributeSet.title = "nikolai-spotlight search"
        attributeSet.contentDescription = "nikolai's Meeting，Thanks"
        attributeSet.keywords = ["WeChat", "nikolai", "MJ"]
        let image = UIImage(named: "icon")
        let data = UIImagePNGRepresentation(image!)
        attributeSet.thumbnailData = data
        
        let searchItem = CSSearchableItem(uniqueIdentifier: uniqueIdentifier, domainIdentifier: domainIdentifier, attributeSet: attributeSet)
        
        CSSearchableIndex.defaultSearchableIndex().indexSearchableItems([searchItem]) { (error) -> Void in
            if error != nil {
                NSLog("search fail")
            } else {
                NSLog("search success")
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        if indexPath.section == 1 && indexPath.row == 0 {
            if TARGET_OS_SIMULATOR == 1 {
                showAlterView()
                return
            } else {
                self.navigationController?.pushViewController(LGScanViewController(), animated: true)
            }
        }
    }
    
    func showAlterView() {
        let alter = UIAlertController(title: "Tip", message: "Simulator can't use this function!", preferredStyle: .Alert)
        alter.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: { (action) -> Void in
            self.dismissViewControllerAnimated(true, completion: nil)
        }))
        
        presentViewController(alter, animated: true, completion: nil)
    }
}
