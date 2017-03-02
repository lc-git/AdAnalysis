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
    var dataArray: Variable<[LCObject]>!
    var subtitleArray: Variable<[Int]>!
    
    var disposeBag = DisposeBag()
    
    override init() {
        dataArray = Variable([])
        subtitleArray = Variable([])
        
        super.init()
        
        let query = LCQuery(className: "Ad")
        query.find { result in
            switch result {
            case .success(let objects):
                self.dataArray.value = objects as [LCObject]
                break
            case .failure(let error):
                print(error)
            }
        }
        
        dataArray.asObservable().subscribe(onNext: { (arr) in
            print(arr)
            self.subtitleArray.value = arr.map({ (obj) -> Int in
                let query = LCQuery(className: "Visit")
                query.whereKey("ad", .equalTo(obj))
                return query.count().intValue
            })
        }).addDisposableTo(disposeBag)
    }
}
