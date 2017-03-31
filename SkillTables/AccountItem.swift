//
//  AccountItem.swift
//  SkillTables
//
//  Created by adeveloper on 30.03.17.
//  Copyright © 2017 adeveloper. All rights reserved.
//

import Foundation


protocol AccountItem {
    var id:NSNumber {get}
    var name:String {get}
    var balance:NSNumber {get}
    var comment:String {get}
}
