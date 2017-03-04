//
//  LCAdNewViewModel.swift
//  AdAnalysis
//
//  Created by Chao on 3/2/17.
//  Copyright © 2017 Chao. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Action
import LeanCloud

class LCAdNewViewModel: LCViewModel {
    var createAdAction: CocoaAction!
    var newURL: String
    var source: String
    var title: String
    
    override init() {
        newURL = ""
        source = ""
        title = ""
        
        super.init()
        
        createAdAction = CocoaAction {
            let ad = LCObject(className: "Ad")
            ad.set("tagsNumber", value: 0)
            ad.set("url", value: self.newURL)
            ad.set("source", value: self.source)
            ad.set("title", value: self.title)
            _ = ad.save()
            
            return .empty()
        }
    }
}
