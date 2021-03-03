//
//  TextBooksListViewModel.swift
//  Tafseers
//
//  Created by Mohamed Eldewaik on 02/03/2021.
//

import Foundation
import RxSwift

struct TextBooksListViewModel {

    private let databaseService: DatabaseServiceProtocol
    
    init(databaseService: DatabaseServiceProtocol = DatabaseService()) {
        self.databaseService = databaseService
    }
    
    func fetchTextBooksViewModels() -> [textBooks] {
        databaseService.fetchTextBooks()
    }
    
}
