//
//  LCAdDetailViewModel.swift
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

class LCAdDetailViewModel: LCViewModel {
    let addTagAction = Action<String, Any> { input in
        return .just(input)
    }
    
    init(ad: LCObject) {
        super.init()
    }
}
