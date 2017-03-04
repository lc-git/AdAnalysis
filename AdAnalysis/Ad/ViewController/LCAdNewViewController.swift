//
//  LCAdNewViewController.swift
//  AdAnalysis
//
//  Created by Chao on 3/2/17.
//  Copyright © 2017 Chao. All rights reserved.
//

import UIKit

class LCAdNewViewController: LCViewController {
    
    var urlTextField: UITextField = UITextField(frame: CGRect.zero)
    var buildURLBtn: UIButton = UIButton(frame: CGRect.zero)
    var newURLTextField: UITextField = UITextField(frame: CGRect.zero)
    var copyURLBtn: UIButton = UIButton(frame: CGRect.zero)
    var createAdBtn: UIButton = UIButton(frame: CGRect.zero)
    
    var titleTextField: UITextField = UITextField(frame: CGRect.zero)
    var sourceTextField: UITextField = UITextField(frame: CGRect.zero)
    var tagTitleTextField: UITextField = UITextField(frame: CGRect.zero)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(urlTextField)
        view.addSubview(newURLTextField)
        
        buildURLBtn.setTitle("生成链接", for: UIControlState.normal)
        view.addSubview(buildURLBtn)
        copyURLBtn.setTitle("复制", for: UIControlState.normal)
        view.addSubview(copyURLBtn)
        createAdBtn.setTitle("创建广告", for: UIControlState.normal)
        
        view.addSubview(titleTextField)
        view.addSubview(sourceTextField)
        view.addSubview(tagTitleTextField)
        bindViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        title = "新建广告"
        urlTextField.snp.makeConstraints { make in
            make.left.equalTo(view.snp.left).offset(40)
            make.width.equalTo(200)
            make.top.equalTo(view.snp.top).offset(100)
        }
        
        newURLTextField.snp.makeConstraints { make in
            make.top.equalTo(urlTextField.snp.bottom).offset(40)
            make.left.equalTo(view.snp.left).offset(40)
            make.width.equalTo(200)
        }
        
        buildURLBtn.snp.makeConstraints { make in
            make.left.equalTo(urlTextField.snp.right).offset(20)
            make.centerY.equalTo(urlTextField.snp.centerY)
        }
        
        copyURLBtn.snp.makeConstraints { make in
            make.left.equalTo(newURLTextField.snp.right).offset(20)
            make.centerY.equalTo(newURLTextField.snp.centerY)
        }
        
        createAdBtn.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.bottom.equalTo(view.snp.bottom).offset(-100)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func bindViewModel() {
        let vm: LCAdNewViewModel = viewModel as! LCAdNewViewModel
        
        urlTextField.rx.text.subscribe(onNext: { text in
            if text?.characters.count == 0 {
                self.buildURLBtn.isEnabled = false
            } else {
                self.buildURLBtn.isEnabled = true
            }
        }).addDisposableTo(self.disposeBag)
    }
}
