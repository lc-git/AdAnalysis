//
//  LCTabBarController.swift
//  AdAnalysis
//
//  Created by Chao on 3/1/17.
//  Copyright © 2017 Chao. All rights reserved.
//

import UIKit

class LCTabBarController: UITabBarController {
    
    let adVC = LCAdRootViewController();
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        adVC.title = "广告"
        let nav1 = LCNavigationController(rootViewController: adVC)
        
        self.viewControllers = [nav1]
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
