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

class LCViewController: UIViewController {
    
    var viewModel: LCViewModel
    
    var disposeBag = DisposeBag()
    
    init(viewModel: LCViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
