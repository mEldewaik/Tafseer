//
//  TafseerListViewModel.swift
//  Tafseers
//
//  Created by Mohamed Eldewaik on 02/03/2021.
//

import Foundation
import RxSwift

struct TafseerListViewModel {

    private let databaseService: DatabaseServiceProtocol
    
    init(databaseService: DatabaseServiceProtocol = DatabaseService()) {
        self.databaseService = databaseService
    }
    
    func fetchOnlyDownloadedTextBooksViewModels() -> [textBooks] {
        databaseService.fetchOnlyDownloadedTextBooks()
    }
    
    func fetchVersesViewModels() -> [Verse] {
        databaseService.fetchVerses()
    }
    
}
