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
        static let ID = "IDColumnId"
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
                tableColumn?.headerCell.title = ColumnName.Name.rawValue
                print(account.description)
                
                cell.textField?.stringValue = account.name
            }
            
            if  tableColumn?.identifier == columnsIdentifiers.Balance {
                 tableColumn?.headerCell.title = ColumnName.Balance.rawValue
                cell.textField?.stringValue = account.balance.stringValue
            }
            
            if tableColumn?.identifier == columnsIdentifiers.Comment {
                 tableColumn?.headerCell.title = ColumnName.Comment.rawValue
                cell.textField?.stringValue = account.comment
            }
            
            if  tableColumn?.identifier == columnsIdentifiers.ID {
                 tableColumn?.headerCell.title = ColumnName.ID.rawValue
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
    
    @IBAction func menuAdd(_ sender: Any) {
        let newAccount = Account()
        newAccount.setup(accounts.getLastID(), "Мастер", 324 )
        accounts.arAccounts.add(newAccount)
        uiTable.reloadData()
    }
    
}
