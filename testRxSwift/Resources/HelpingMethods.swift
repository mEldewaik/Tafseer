//
//  HelpingMethods.swift
//  Tafseer
//
//  Created by Mohamed Eldewaik on 22/02/2021.
//

import UIKit

class HelpingMehods {
    static let instance = HelpingMehods()
    
    
    // MARK: - herlpers
    func heightForLabel(text:String, font:UIFont, width:CGFloat) -> CGFloat {
        
        let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height:  CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = font
        label.text = text
        
        label.sizeToFit()
        return label.frame.height
        
    }
}
