//
//  LCAdRootViewController.swift
//  AdAnalysis
//
//  Created by Chao on 3/1/17.
//  Copyright © 2017 Chao. All rights reserved.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa
import LeanCloud

class LCAdRootViewController: LCViewController {
    
    let cellIdentifier = "adRootCellIndentifier"
    var tableView: UITableView = UITableView(frame: CGRect.zero, style: UITableViewStyle.plain)
    var viewModel = LCAdRootViewModel()
    
    var disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        tableView.dataSource = self
        view.addSubview(tableView)
        
        viewModel.dataArray.asObservable().subscribe { arr in
            print(arr)
            self.tableView.reloadData()
        }.addDisposableTo(disposeBag)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.snp.makeConstraints { make in
            make.left.right.top.equalTo(view)
            make.bottom.equalTo(view).offset(-49)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension LCAdRootViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.dataArray.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        let visit = viewModel.dataArray.value[indexPath.row] as! LCObject
        let source    = visit.get("source") as! LCString
        cell.textLabel?.text = source.stringValue
        return cell
    }
}









