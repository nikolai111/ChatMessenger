//
//  LGMessageListController.swift
//  LGChatViewController
//
//  Created by Nikolai on 10/03/16.
//  Copyright © 2016 Nikolai. All rights reserved.
//

import UIKit

class LGConversationListController: UITableViewController, LGConversionListBaseCellDelegate {
    
    
    override func viewDidLoad() {
        self.tableView.rowHeight = 60.0
        self.title = "FEED"
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("messageListCell") as? LGConversionListCell
        if cell == nil {
            let leftButtons = [UIButton.createButton("Cancel", backGroundColor: UIColor.purpleColor())]
            let rightButtons = [UIButton.createButton("Mark", backGroundColor: UIColor.grayColor()),UIButton.createButton("Delete", backGroundColor: UIColor.redColor())]
            
            cell = LGConversionListCell(style: .Subtitle, reuseIdentifier: "messageListCell")
            cell?.delegate = self
            cell?.viewModel = updateCell()
            
            cell?.setLeftButtons(leftButtons)
            cell?.setRightButtons(rightButtons)
        }
        
        return cell!
    }
    
    // just for test message
    
    let image = ["icon1", "icon2", "icon3", "icon4", "icon0"]
    let name = ["Andrei", "Olav", "Daniel", "nikolai", "Medvedev"]
    let time = ["13:14", "23:45", "Today", "Fri", "15/10/19"]
    let message = ["Hello, How are you?", " Hi, please let me know your opinion.", "Good News", "Oh~ OKay", "You are a my good friend"]
    
    func updateCell() -> LGConversionListCellModel{
        
        let viewModel = LGConversionListCellModel()
        
        viewModel.iconName.value = image[random() % 5]
        viewModel.userName.value = name[random() % 5]
        viewModel.timer.value = time[random() % 5]
        viewModel.lastMessage.value = message[random() % 5]
        
        return viewModel
    }

    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        navigationController?.pushViewController(LGConversationViewController(), animated: true)
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60.0
    }
    
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    
    // MARK: - cell delegate
    
    func didSelectedLeftButton(index: Int) {
        let actionSheet = UIAlertController(title: "Warning", message: "Do you really want cancel?", preferredStyle: .ActionSheet)
        actionSheet.addAction(UIAlertAction(title: "CANCEL", style: .Cancel, handler: { (alertAction) -> Void in
            
        }))
        actionSheet.addAction(UIAlertAction(title: "OK", style: .Default, handler: { (alertAction) -> Void in
            
        }))
        
        self.presentViewController(actionSheet, animated: true, completion: nil)
    }
    
    func didSelectedRightButton(index: Int) {
        NSLog("click")
    }
    
}
