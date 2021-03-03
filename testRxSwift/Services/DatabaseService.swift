//
//  DatabaseService.swift
//  Tafseers
//
//  Created by Mohamed Eldewaik on 02/03/2021.
//

import Foundation
import RxSwift
import RealmSwift
import RxRealm


protocol DatabaseServiceProtocol {
    func fetchTextBooks() -> [textBooks]
    func fetchOnlyDownloadedTextBooks() -> [textBooks]
    func fetchVerses() -> [Verse]
    func fetchTextContents() -> Observable<[textBooksContents]>
}


class DatabaseService: DatabaseServiceProtocol {
    
    var realm : Realm!
    
    func fetchTextBooks() -> [textBooks] {
        let texts = self.realm.objects(textBooks.self)
        
        return texts.toArray()
    }
    
    func fetchOnlyDownloadedTextBooks() -> [textBooks] {
        let texts = self.realm.objects(textBooks.self).filter("isDownloaded == \(true)")
        
        return texts.toArray()
    }
    
    func fetchTextContents() -> Observable<[textBooksContents]> {
        return Observable.create { observer in
            let contents = self.realm.objects(textBooksContents.self)
            
            observer.onNext(contents.toArray())
            
            return Disposables.create()
        }
    }
    
    
    
    func fetchVerses() -> [Verse] {
        let texts = self.realm.objects(Verse.self)
        
        return texts.toArray()
    }

    init() {
        realm = try! Realm()
    }
}
