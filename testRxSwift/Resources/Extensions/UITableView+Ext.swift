//
//  UITableView+Ext.swift
//  Tafseer
//
//  Created by Mohamed Eldewaik on 19/02/2021.
//  Copyright © 2020 Mohamed Eldewaik. All rights reserved.
//

import UIKit

extension UITableView {
    func registerNibForTable<T: UITableViewCell>(ofType type: T.Type) {
        let cellName = String(describing: T.self)
        
        if Bundle.main.path(forResource: cellName, ofType: "nib") != nil {
            let nib = UINib(nibName: cellName, bundle: Bundle.main)
            
            register(nib, forCellReuseIdentifier: cellName)
        } else {
            register(T.self, forCellReuseIdentifier: cellName)
        }
    }
    public func dequeueCellForTable<Cell: UITableViewCell>(ofType type: Cell.Type) -> Cell {
        let identifier = String(describing: Cell.self)

        guard let cell = self.dequeueReusableCell(withIdentifier: identifier) as? Cell else {
            
            fatalError("Error in cell")
        }
        return cell
    }
    
    func registerHeaderForTable<T: UITableViewHeaderFooterView>(ofType type: T.Type) {
        let cellName = String(describing: T.self)
        
        if Bundle.main.path(forResource: cellName, ofType: "nib") != nil {
            let nib = UINib(nibName: cellName, bundle: Bundle.main)
            
            register(nib, forHeaderFooterViewReuseIdentifier: cellName)
        } else {
            register(T.self, forHeaderFooterViewReuseIdentifier: cellName)
        }
    }
    public func dequeueHeaderForTable<Cell: UITableViewHeaderFooterView>(ofType type: Cell.Type) -> Cell {
        let identifier = String(describing: Cell.self)
        
        guard let header = self.dequeueReusableHeaderFooterView(withIdentifier: identifier) as? Cell else {
            fatalError("Error in header")
        }
        return header
    }
    
    func configureTable(withSeparator: Bool) {
        self.separatorInset = .zero
        self.contentInset = .zero
        if withSeparator == true {
            self.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.size.width, height: 1))
            self.separatorStyle = .singleLine
        }else{
            self.separatorStyle = .none
        }
        
    }
}

