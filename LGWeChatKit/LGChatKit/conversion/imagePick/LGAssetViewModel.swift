//
//  LGAssetViewModel.swift
//  LGWeChatKit
//
//  Created by Nikolai on 09/03/16.
//  Copyright © 2016 Nikolai. All rights reserved.
//

import Foundation
import Photos

class LGAssetViewModel {
    let asset: Observable<PHAsset>
    let image: Observable<UIImage>
    let livePhoto: Observable<PHLivePhoto>
    
    init(assetMode: LGAssetModel) {
        asset = Observable(assetMode.asset)
        image = Observable(UIImage())
        livePhoto = Observable(PHLivePhoto())
    }
    
    func getTargetSize(size: CGSize) -> CGSize {
        let scale = UIScreen.mainScreen().scale
        let targetSize = CGSizeMake(size.width * scale, size.height * scale)
        
        return targetSize
    }
    
    
    func updateImage(size: CGSize) {
        let haveLivePhotoType = asset.value.mediaSubtypes.rawValue & PHAssetMediaSubtype.PhotoLive.rawValue
        if haveLivePhotoType == 1 {
            updateLivePhoto(size)
        } else {
            updateStaticImage(size)
        }
    }
    
    
    func updateLivePhoto(size: CGSize) {
        let option = PHLivePhotoRequestOptions()
        option.deliveryMode = .HighQualityFormat
        option.networkAccessAllowed = true
        
        PHImageManager.defaultManager().requestLivePhotoForAsset(asset.value, targetSize: getTargetSize(size), contentMode: .AspectFit, options: option) { (livephoto, _:[NSObject : AnyObject]?) -> Void in
            if let Livephoto = livephoto {
                self.livePhoto.value = Livephoto
            }
        }
    }
    
    func updateStaticImage(size: CGSize) {
        let option = PHImageRequestOptions()
        option.deliveryMode = .HighQualityFormat
        option.networkAccessAllowed = true
        
        PHImageManager.defaultManager().requestImageForAsset(asset.value, targetSize: getTargetSize(size), contentMode: .AspectFit, options: option) { (image, _: [NSObject : AnyObject]?) -> Void in
            if (image == nil) {
                return
            }
            
            self.image.value = image!
        }
    }
}