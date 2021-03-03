//
//  UIFont+Ext.swift
//  Tafseer
//
//  Created by Mohamed Eldewaik on 19/02/2021.
//

import UIKit

extension UIFont {

    class func tafseerHeaderFont(size: CGFloat) -> UIFont {
        return  UIFont(name: Constants.FontUthmanHafs.Regular, size: size)!
    }
    
    class func SegmentFont(size: CGFloat) -> UIFont {
        return  UIFont(name: Constants.FontAra.Regular, size: size)!
    }
    
    
}




