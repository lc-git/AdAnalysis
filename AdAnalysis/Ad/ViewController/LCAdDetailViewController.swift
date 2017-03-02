//
//  LCAdDetailViewController.swift
//  AdAnalysis
//
//  Created by Chao on 3/2/17.
//  Copyright © 2017 Chao. All rights reserved.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa
import Action

class LCAdDetailViewController: LCViewController {
    
    var addBtn: UIButton = UIButton(frame: CGRect.zero)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addBtn.setTitle("Add Tag", for: UIControlState.normal)
        addBtn.setTitleColor(UIColor.blue, for: UIControlState.normal)
        view.addSubview(addBtn)
        bindViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        addBtn.snp.makeConstraints { make in
            make.width.height.equalTo(40)
            make.centerX.centerY.equalTo(view)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func bindViewModel() {
        let vm: LCAdDetailViewModel = viewModel as! LCAdDetailViewModel
        print(vm)
    }
}
