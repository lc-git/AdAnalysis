//
//  LCVisit.swift
//  AdAnalysis
//
//  Created by Chao on 3/1/17.
//  Copyright © 2017 Chao. All rights reserved.
//

import LeanCloud

class LCVisit: LCObject {
    dynamic var title: LCString?
    
    override static func objectClassName() -> String {
        return "LCVisit"
    }
}
