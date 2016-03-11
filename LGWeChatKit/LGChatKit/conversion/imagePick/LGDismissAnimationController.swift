//
//  LGDismissAnimationController.swift
//  LGWeChatKit
//
//  Created by Nikolai on 10/03/16.
//  Copyright © 2016 Nikolai. All rights reserved.
//

import UIKit

class LGDismissAnimationController: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.2
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let toCtrl = (transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey) as! UINavigationController).topViewController as! UICollectionViewController
        let fromView = transitionContext.viewForKey(UITransitionContextFromViewKey)
        let toView = transitionContext.viewForKey(UITransitionContextToViewKey)
        let containertView = transitionContext.containerView()
   
        let layoutAttrubute = toCtrl.collectionView?.layoutAttributesForItemAtIndexPath((toCtrl.selectedIndexPath)!)
        let selectRect = toCtrl.collectionView?.convertRect((layoutAttrubute?.frame)!, toView: toCtrl.collectionView?.superview)
        
        toView?.alpha = 0.5
        containertView?.addSubview(toView!)
        containertView?.sendSubviewToBack(toView!)
        
        let snapshotView = fromView?.snapshotViewAfterScreenUpdates(false)
        snapshotView?.frame = (fromView?.frame)!
        containertView?.addSubview(snapshotView!)

        fromView?.removeFromSuperview()
        
        UIView.animateWithDuration(transitionDuration(transitionContext), animations: { () -> Void in
            snapshotView?.frame = selectRect!
            toView?.alpha = 1
            }) { (finish) -> Void in
                snapshotView?.removeFromSuperview()
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
        }
    }
}
