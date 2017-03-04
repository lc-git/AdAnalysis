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
    var addTagAction: CocoaAction!
    
    let dataArray: Variable<[LCObject]>
    
    var disposeBag = DisposeBag()
    
    init(ad: LCObject) {
        dataArray = Variable([])
        
        super.init()
        
        let query = ad.relationForKey("tags").query
        query.find { result in
            switch result {
            case .success(let tags):
                self.dataArray.value = tags;
                break;
            case .failure(let error):
                print(error)
            }
        }
        
        addTagAction = CocoaAction {
            let alert: UIAlertController = UIAlertController(title: "标签", message: "添加新的标签标题", preferredStyle: UIAlertControllerStyle.alert)
            let cancelAction = UIAlertAction.Action("取消", style: UIAlertActionStyle.cancel)
            var addTagAction = UIAlertAction.Action("添加", style: UIAlertActionStyle.default)
            addTagAction.rx.action = CocoaAction {
                ad.increase("tagsNumber", by: 1)
                _ = ad.save()
                
                let tag = LCObject(className: "Tag")
                tag.set("visitsNumber", value: 0)
                tag.set("title", value: alert.textFields?[0].text)
                //_ = tag.save()
                ad.insertRelation("tags", object: tag)
                _ = ad.save()
                return .empty()
            }
            alert.addAction(cancelAction)
            alert.addAction(addTagAction)
            alert.addTextField(configurationHandler: { textField in
                let action = alert.actions[1]
                textField.rx.text.subscribe(onNext: { text in
                    if text?.characters.count == 0 {
                        action.isEnabled = false
                    } else {
                        action.isEnabled = true
                    }
                }).addDisposableTo(self.disposeBag)
            })
        
            LCWireFrame.rootViewController().present(alert, animated: true, completion: nil)
            
            return .empty()
        }
    }
}
