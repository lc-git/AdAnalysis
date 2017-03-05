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
import LeanCloud

class LCAdDetailViewController: LCViewController {
    
    let reuseIdentifier = "adDetailCellReuseIdentifer"
    var addTagBtn: UIButton = UIButton(frame: CGRect.zero)
    var tableView: UITableView = UITableView(frame: CGRect.zero, style: UITableViewStyle.plain)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addTagBtn.setTitle("Add Tag", for: UIControlState.normal)
        addTagBtn.setTitleColor(UIColor.blue, for: UIControlState.normal)
        view.addSubview(addTagBtn)
        
        tableView.dataSource = self;
        tableView.delegate = self;
        view.addSubview(tableView)
        
        view.backgroundColor = UIColor.white
        bindViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        addTagBtn.snp.makeConstraints { make in
            make.width.height.equalTo(90)
            make.centerX.equalTo(view)
            make.bottom.equalTo(tableView.snp.top).offset(-40)
        }
        
        tableView.snp.makeConstraints { make in
            make.left.right.bottom.equalTo(view)
            make.height.equalTo(UIScreen.main.bounds.size.height / 2)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func bindViewModel() {
        let vm: LCAdDetailViewModel = viewModel as! LCAdDetailViewModel
        print(vm)
        addTagBtn.rx.action = vm.addTagBtnAction
        
        vm.dataArray.asObservable().subscribe { arr in
            print(arr)
            self.tableView.reloadData()
            }.addDisposableTo(disposeBag)
        
    }
}

extension LCAdDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let vm: LCAdDetailViewModel = viewModel as! LCAdDetailViewModel
        return vm.dataArray.value.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let vm: LCAdDetailViewModel = viewModel as! LCAdDetailViewModel
        var cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier)
        if (cell == nil) {
            cell = UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: reuseIdentifier)
            cell?.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        }
        
        let tag = vm.dataArray.value[indexPath.row]
        let title = tag.get("title") as! LCString
        let visitsNumber = tag.get("visitsNumber") as! LCNumber
        cell?.textLabel?.text = title.stringValue
        cell?.detailTextLabel?.text = String(visitsNumber.intValue!)
        return cell!
    }
}

extension LCAdDetailViewController: UITableViewDelegate {
    
}
