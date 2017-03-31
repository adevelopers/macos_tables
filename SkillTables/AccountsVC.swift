//
//  AccountsVC.swift
//  SkillTables
//
//  Created by adeveloper on 30.03.17.
//  Copyright © 2017 adeveloper. All rights reserved.
//

import Cocoa

class AccountsVC: NSViewController, NSTableViewDelegate, NSTableViewDataSource{

    //MARK: UI
    fileprivate enum columnsIdentifiers {
        static let Name = "nameColumnId"
        static let Balance = "balanceColumnId"
        static let Comment = "commentColumnId"
        static let ID = "IDColumntId"
    }
    
    @IBOutlet weak var uiTable: NSTableView!
    
    
    
    //MARK: Models
    var accounts: Accounts = Accounts()
    
    
    //MARK: Init/Deinit
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        accounts.load()
        uiTable.delegate = self
        uiTable.dataSource = self
        // uiTable.reloadData()
        
    }
    
    //MARK: NSTableView
    func numberOfRows(in tableView: NSTableView) -> Int {
        return accounts.arAccounts.count
    }
    
    func detectColumn() -> String {
        return ""
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {

        
        let account = accounts.arAccounts.object(at: row) as! Account
       
        
       
        let columnID = tableColumn?.identifier
        
        if let cell = tableView.make(withIdentifier: columnID!, owner: nil) as? NSTableCellView {
            if  tableColumn?.identifier == columnsIdentifiers.Name {
                 print(account.description)
                cell.textField?.stringValue = account.name
            }
            
            if  tableColumn?.identifier == columnsIdentifiers.Balance {
                cell.textField?.stringValue = account.balance.stringValue
            }
            
            if tableColumn?.identifier == columnsIdentifiers.Comment {
                cell.textField?.stringValue = account.comment
            }
            
            if  tableColumn?.identifier == columnsIdentifiers.ID {
                cell.textField?.stringValue = account.id.stringValue
            }
            
            return cell
        }
        return nil
    }
    

    
    
    
    
    //MERK: Context Menu
    @IBAction func menuQuit(_ sender: Any) {
        exit(0)
    }
    
    
}
