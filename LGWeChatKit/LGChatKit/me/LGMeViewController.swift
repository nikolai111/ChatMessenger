//
//  LGMeViewController.swift
//  LGChatViewController
//
//  Created by Nikolai on 11/03/16.
//  Copyright © 2016 Nikolai. All rights reserved.
//

import UIKit
import SafariServices

class LGMeViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Me"
        view.backgroundColor = UIColor.groupTableViewBackgroundColor()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension LGMeViewController {
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        if indexPath.section == 0 {
            let url = NSURL(string: "http://google.com")
            let safariCtrl = SFSafariViewController(URL: url!)
            safariCtrl.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(safariCtrl, animated: true)
        }
    }
}