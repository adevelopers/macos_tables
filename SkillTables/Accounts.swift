//
//  Accounts.swift
//  SkillTables
//
//  Created by adeveloper on 31.03.17.
//  Copyright © 2017 adeveloper. All rights reserved.
//

import Foundation



class Account: AccountItem {
    //MARK: Conform protocol Account Item
    var id:NSNumber = 0
    var name:String = ""
    var balance:NSNumber = 0
    var comment:String  = ""
    
    //MARK: Other
    var description: String {
        return " \(id) name:\(name) balance:\(balance) comment:\(comment)"
    }
    
    init(){}
    
    init (_ i:NSNumber, _ n:String, _ b:NSNumber){
        id = i
        name = n
        balance = b
    }
    

    
}


extension Account {
    
    func setup(_ id:NSNumber, _ name:String, _ bal:NSNumber){
        self.id = id
        self.name = name
        self.balance = bal
    }
    
    func copy(with zone: NSZone? = nil )-> Account {
        let copy = Account()
        copy.setup(id, name, balance)
        return copy
    }
}


public enum ColumnName:String{
    case Name = "Name"
    case ID = "Id"
    case Comment = "Comment"
    case Balance = "Balance"
}



class Accounts{
    
    
    var arAccounts:NSMutableArray = []
    
    init(){
        
    }
    
    func load(){
        let x1 = Account(1, "Рублёвый", 100)
        let x2 = Account(2, "Долларовый", 200)
        let x3 = Account(3, "Наличные в кошельке", 950)
        arAccounts.add(x1)
        arAccounts.add(x2)
        arAccounts.add(x3)

    }
    
    
}
