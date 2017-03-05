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
import PKHUD

class LCAdRootViewController: LCViewController {
    
    let reuseIdentifier = "adRootCellIndentifier"
    var tableView: UITableView = UITableView(frame: CGRect.zero, style: UITableViewStyle.plain)
    var tmpViewModel = LCAdRootViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 72
        view.addSubview(tableView)
        
        tmpViewModel.dataArray.asObservable().subscribe { arr in
            print(arr)
            self.tableView.reloadData()
        }.addDisposableTo(disposeBag)
        
        bindViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.add, target: self, action: #selector(add))
        
        tableView.snp.makeConstraints { make in
            make.left.right.top.equalTo(view)
            make.bottom.equalTo(view).offset(-49)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func bindViewModel() {
        tmpViewModel.getListAction.executing.subscribe(onNext: { isExecuting in
            self.loading.value = isExecuting
        }).addDisposableTo(disposeBag)
    }
    
    func add() {
        print("Add button pressed")
        //navigationController?.pushViewController(LCAdNewViewController(), animated: true);
    }
}

extension LCAdRootViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tmpViewModel.dataArray.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier)
        if (cell == nil) {
            cell = UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: reuseIdentifier)
            cell?.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        }
        let ad = tmpViewModel.dataArray.value[indexPath.row]
        let title    = ad.get("title") as! LCString
        cell?.textLabel?.text = title.stringValue
        //let count: String = String(tmpViewModel.subtitleArray.value[indexPath.row]) + "次点击"
        //cell?.detailTextLabel?.text = count;
        return cell!
    }
}

extension LCAdRootViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView .deselectRow(at: indexPath, animated: true)
        let detailViewModel = LCAdDetailViewModel(ad: tmpViewModel.dataArray.value[indexPath.row])
        let vc = LCAdDetailViewController(viewModel: detailViewModel)
        navigationController?.pushViewController(vc, animated: true)
    }
}









