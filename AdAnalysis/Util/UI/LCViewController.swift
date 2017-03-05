//
//  LCViewController.swift
//  AdAnalysis
//
//  Created by Chao on 3/1/17.
//  Copyright © 2017 Chao. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit
import PKHUD

class LCViewController: UIViewController {
    
    var viewModel: LCViewModel
    var disposeBag = DisposeBag()
    
    let loading = Variable(false)
    
    init(viewModel: LCViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loading.asObservable().subscribe(onNext: { isLoading in
            if isLoading {
                HUD.show(.progress)
            } else {
                HUD.hide()
            }
        }).addDisposableTo(disposeBag)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
