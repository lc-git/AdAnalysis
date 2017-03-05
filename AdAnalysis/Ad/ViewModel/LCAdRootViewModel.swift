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
import Action

class LCAdRootViewModel: LCViewModel {
    var dataArray: Variable<[LCObject]>!
    var subtitleArray: Variable<[Int]>!
    var getListAction: CocoaAction!
    
    var disposeBag = DisposeBag()
    
    override init() {
        dataArray = Variable([])
        subtitleArray = Variable([])
        
        super.init()
        
        getListAction = CocoaAction {
            return Observable.create({ subscriber -> Disposable in
                let query = LCQuery(className: "Ad")
                query.find { result in
                    switch result {
                    case .success(let objects):
                        self.dataArray.value = objects as [LCObject]
                        subscriber.onNext()
                        subscriber.onCompleted()
                        break
                    case .failure(let error):
                        subscriber.onError(error)
                        print(error)
                    }
                }
                return Disposables.create()
            })
        }
        
        getListAction.execute()
        
        dataArray.asObservable().subscribe(onNext: { (arr) in
            print(arr)
        }).addDisposableTo(disposeBag)
    }
}
