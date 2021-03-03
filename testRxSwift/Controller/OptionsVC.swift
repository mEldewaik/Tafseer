//
//  OptionsVC.swift
//  Tafseer
//
//  Created by Mohamed Eldewaik on 24/02/2021.
//

import UIKit

class OptionsVC: UIViewController {
    
    @IBOutlet weak var view_dismiss: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        view_dismiss.isUserInteractionEnabled = true
        view_dismiss.addGestureRecognizer(tap)
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        // handling code
        
        self.dismiss(animated: true, completion: nil)
    }

}

extension OptionsVC {
    static func instantiate() -> OptionsVC {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "OptionsVC") as! OptionsVC
        return vc
    }
}
