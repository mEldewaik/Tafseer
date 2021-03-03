//
//  TafseerSearchTableViewCell.swift
//  Tafseer
//
//  Created by Mohamed Eldewaik on 24/02/2021.
//

import UIKit

class TafseerSearchTableViewCell: UITableViewCell {

    @IBOutlet weak var lbl_title: UILabel!
    @IBOutlet weak var lbl_author: UILabel!
    @IBOutlet weak var btn_add: UIButton!
    
    var textbook: textBooks! {
        didSet{
            self.lbl_title.text = textbook.title
            self.lbl_author.text = textbook.author?.name
            
            if textbook.isDownloaded == false {
                btn_add.setImage(#imageLiteral(resourceName: "addCircule"), for: .normal)
            }else{
                btn_add.setImage(#imageLiteral(resourceName: "trueCircule"), for: .normal)
            }
            
        }
    }
    
    
    @IBAction func addBtnPressed(_ sender: UIButton) {
    }
    

}
