//
//  TafseerTableViewCell.swift
//  ezzattask
//
//  Created by eslam mohamed on 22/02/2021.
//

import UIKit

class TafseerTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lbl_tafseer_title: UILabel!
    @IBOutlet weak var lbl_tafseer_details: UILabel!
    @IBOutlet weak var labelBottom: NSLayoutConstraint!
    @IBOutlet weak var labelHeader: NSLayoutConstraint!
    
    var optionTapped: (() -> Void)?
    var collapsedTapped: (() -> Void)?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(content: textBooks, verse: Verse) {
        let mycontent = content.textContents.filter({$0.verseInHafs?.searchText == verse.searchText})
        lbl_tafseer_details.text = mycontent.first?.text
        lbl_tafseer_title.text = content.title
    }
    @IBAction func optionBtnPressed(_ sender: Any) {
        self.optionTapped?()        
    }
    
    @IBAction func collapseBtnPressed(_ sender: Any) {
        self.collapsedTapped?()
    }
    
    
}
