//
//  MainVC.swift
//  ezzattask
//
//  Created by eslam mohamed on 22/02/2021.
//

import UIKit
import RxSwift

class MainVC: UIViewController {
    

    // MARK:- Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segment: UISegmentedControl!
    
    
    private var textbooks = [textBooks]()
    private var verses = [Verse]()
    
    private var viewModel: TafseerListViewModel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.segment.selectedSegmentIndex = 1
        self.registerXibs()
        self.getData()
    }
    
    func getData() {
        self.textbooks = viewModel.fetchOnlyDownloadedTextBooksViewModels().filter({$0.textContents.count != 0})
        
        self.verses = viewModel.fetchVersesViewModels()
        
        self.tableView.reloadData()
    }
    
    @IBAction func plussBtnPressed(_ sender: UIButton) {
        let vc = TafseersVC.instantiate(viewModel: TextBooksListViewModel())
        vc.delegate = self
        self.present(vc, animated: true, completion: nil)
    }
    private func registerXibs() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerNibForTable(ofType: TafseerTableViewCell.self)
        tableView.registerHeaderForTable(ofType: TafseerTableViewHeader.self)
        
        tableView.sectionHeaderHeight = UITableView.automaticDimension
        tableView.estimatedSectionHeaderHeight = 36
    }
}

extension MainVC: updateData {
    func refresh() {
        self.getData()
    }
}

extension MainVC: UITableViewDelegate,UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        if self.textbooks.count == 0 {
            return 0
        }
        return self.verses.count
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueHeaderForTable(ofType: TafseerTableViewHeader.self)
        header.lbl_title.text = self.verses[section].cleanText
        header.lbl_title.numberOfLines = 0
        return header

    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.textbooks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCellForTable(ofType: TafseerTableViewCell.self)
        let text = self.textbooks[indexPath.row]
        cell.configureCell(content: text, verse: self.verses[indexPath.section])

        cell.optionTapped = { [weak self]  in
            guard let forceSelf = self else { return }
            let vc = OptionsVC.instantiate()
            vc.modalPresentationStyle = .overCurrentContext
            vc.modalTransitionStyle = .crossDissolve
            forceSelf.present(vc, animated: true, completion: nil)
        }
        
        cell.collapsedTapped = { [weak self]  in
            guard let forceSelf = self else { return }
            guard let realm = DatabaseManager.shared.realm else {return}
            let txt = text.textContents[indexPath.section]
            try! realm.write {
                
                txt.collapsed = !(txt.collapsed)
            }
            
            forceSelf.tableView.reloadData()
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if self.textbooks[indexPath.row].textContents[indexPath.section].collapsed == true {
            return 55
        }
        else{
            return UITableView.automaticDimension
        }
    }



    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let txt = self.verses[section].cleanText
        let font = UIFont.tafseerHeaderFont(size: 22)
        let width = self.tableView.frame.size.width - 46
        return HelpingMehods.instance.heightForLabel(text: txt, font: font, width: width)
    }
}

extension MainVC {
    static func instantiate(viewModel: TafseerListViewModel) -> MainVC {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateInitialViewController() as! MainVC
        vc.viewModel = viewModel
        return vc
    }
}
