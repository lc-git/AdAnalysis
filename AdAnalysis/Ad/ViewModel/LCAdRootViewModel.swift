//
//  LCAdRootViewModel.swift
//  AdAnalysis
//
//  Created by Chao on 3/1/17.
//  Copyright © 2017 Chao. All rights reserved.
//

import UIKit
import LeanCloud
import RxSwift
import RxCocoa

class LCAdRootViewModel: LCViewModel {
    var dataArray: Variable<NSArray>!
    
    override init() {
        dataArray = Variable([])
        
        super.init()
        
        let query = LCQuery(className: "Visit")
        query.find { result in
            switch result {
            case .success(let objects):
                self.dataArray.value = objects as NSArray
                break
            case .failure(let error):
                print(error)
            }
        }
    }
}
