//
//  UICollectionView+Ext.swift
//  Tafseer
//
//  Created by Mohamed Eldewaik on 19/02/2021.
//  Copyright © 2020 Mohamed Eldewaik. All rights reserved.
//

import UIKit
import SMLocalize

extension UICollectionView {
    
    func registerNibForCollection<T: UICollectionViewCell>(ofType type: T.Type) {
        let cellName = String(describing: T.self)
        
        if Bundle.main.path(forResource: cellName, ofType: "nib") != nil {
            let nib = UINib(nibName: cellName, bundle: Bundle.main)
            
            register(nib, forCellWithReuseIdentifier: cellName)
        } else {
            register(T.self, forCellWithReuseIdentifier: cellName)
        }
    }
    public func dequeueCellForCollection<Cell: UICollectionViewCell>(ofType type: Cell.Type, withIndex indexPath: IndexPath) -> Cell {
        let identifier = String(describing: Cell.self)
        
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? Cell else {
            
            fatalError("Error in cell")
        }
        return cell
    }
    
}



