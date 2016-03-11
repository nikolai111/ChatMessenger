//
//  PHRootViewModel.swift
//  LGChatViewController
//
//  Created by Nikolai on 11/03/16.
//  Copyright © 2016 Nikolai. All rights reserved.
//

import Foundation
import Photos

class PHRootViewModel {
    let collections: Observable<[PHRootModel]>
    
    init() {
        collections = Observable([])
    }
    
    
    func getCollectionList() {
    
        let albumOptions = PHFetchOptions()
        albumOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: true)]
        
        let userAlbum = PHAssetCollection.fetchAssetCollectionsWithType(.SmartAlbum, subtype: .AlbumRegular, options: nil)
        
        userAlbum.enumerateObjectsUsingBlock { (collection, index, stop) -> Void in
            let coll = collection as! PHAssetCollection
            let assert = PHAsset.fetchAssetsInAssetCollection(coll, options: nil)
            if assert.count > 0 {
                let model = PHRootModel(title: coll.localizedTitle!, count: assert.count, fetchResult: assert)
                self.collections.value.append(model)
            }
        }
        
        let userCollection = PHCollectionList.fetchTopLevelUserCollectionsWithOptions(nil)
        
        userCollection.enumerateObjectsUsingBlock { (list, index, stop) -> Void in
            let list = list as! PHAssetCollection
            let assert = PHAsset.fetchAssetsInAssetCollection(list, options: nil)
            if assert.count > 0 {
                let model = PHRootModel(title: list.localizedTitle!, count: assert.count, fetchResult: assert)
                self.collections.value.append(model)
            }
        }
        
    }
}
