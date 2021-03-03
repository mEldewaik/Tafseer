//
//  TafseersVC.swift
//  Tafseer
//
//  Created by Mohamed Eldewaik on 24/02/2021.
//

import UIKit
import RxSwift
import RxCocoa

protocol updateData {
    func refresh()
}

class TafseersVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var view_tafseer: UIView!
    @IBOutlet weak var searchTxt: UITextField!
    
    var isEditingg = false
    
    private var textbooks = [textBooks]()
    private var filtered = [textBooks]()
    
    private var viewModel: TextBooksListViewModel!
    var delegate: updateData?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.configureTableView()
        self.getData()
    }
    
    private
    func configureTableView() {
        self.view_tafseer.isHidden = true
        self.tableView.sectionHeaderHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 36
        self.tableView.allowsMultipleSelection = true
        self.tableView.allowsMultipleSelectionDuringEditing = true
    }
    
    @IBAction func searchTextField(_ sender: UITextField) {
        if sender.text == "" {
            self.isEditingg = false
            self.searchTxt.resignFirstResponder()
            self.tableView.reloadData()
        }else{
            self.isEditingg = true
            
            filtered = (textbooks.filter { text in
                return (text.title.lowercased().contains(sender.text!.lowercased()))
            })
            self.tableView.reloadData()
        }
    }
    
    private func getData() {
        self.textbooks = viewModel.fetchTextBooksViewModels()
        self.tableView.reloadData()
    }
        
    
    @IBAction func dismissBtnPressed(_ sender: UIButton) {
        self.delegate?.refresh()
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func showViewBtnPressed(_ sender: UIButton) {
        self.view_tafseer.isHidden = false
    }
    
}

extension TafseersVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isEditingg == true {
            return self.filtered.count
        }else{
            return textbooks.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! TafseerSearchTableViewCell
        if isEditingg == true {
            cell.textbook = filtered[indexPath.row]
        }else{
            cell.textbook = textbooks[indexPath.row]
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        

        guard let realm = DatabaseManager.shared.realm else {return}
        
        if isEditingg == false {
            let txt = textbooks[indexPath.row]
            try! realm.write {
                
                txt.isDownloaded = !(txt.isDownloaded)
            }
            
        }else{
            let txt = filtered[indexPath.row]
            try! realm.write {
                txt.isDownloaded = !(txt.isDownloaded)
            }
        }
        
        
        self.tableView.reloadData()
    }
}

extension TafseersVC {
    static func instantiate(viewModel: TextBooksListViewModel) -> TafseersVC {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "TafseersVC") as! TafseersVC
        vc.viewModel = viewModel
        return vc
    }
}
