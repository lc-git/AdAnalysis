//
//  LCWireFrame.swift
//  AdAnalysis
//
//  Created by Chao Li on 3/4/17.
//  Copyright © 2017 Chao. All rights reserved.
//

import UIKit

class LCWireFrame: NSObject {
    let defaultWireFramw = LCWireFrame()
    
    static func rootViewController() -> UIViewController {
        return UIApplication.shared.keyWindow!.rootViewController!
    }

}
