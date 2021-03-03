//
//  RealmModels.swift
//  Tafseers
//
//  Created by Mohamed Eldewaik on 02/03/2021.
//


import Foundation
import RealmSwift

class Surah: Object {
    let index = RealmOptional<Int>()
    @objc dynamic var searchText: String = ""
    @objc dynamic var isMakkiyah: Bool = false
    @objc dynamic var titleUthmani: String = ""

    
    override class func primaryKey() -> String? {
        return "index"
    }

}


class Verse: Object {
    let index = RealmOptional<Int>()
    @objc dynamic var surah: Surah? = nil
    @objc dynamic var rewaya: rewayat? = nil
    @objc dynamic var cleanText: String = ""
    @objc dynamic var searchText: String = ""
    @objc dynamic var textUthmani: String = ""
    let numberInSurah = RealmOptional<Int>()
    
    override class func primaryKey() -> String? {
        return "index"
    }
}

class rewayat: Object {
    let index = RealmOptional<Int>()
    @objc dynamic var shortName: String = ""
    override class func primaryKey() -> String? {
        return "index"
    }
}

class textBooks: Object {
    let index = RealmOptional<Int>()
    @objc dynamic var isDownloaded: Bool = false
    @objc dynamic var downloadingUrl: String = ""
    @objc dynamic var title: String = ""
    @objc dynamic var book_description: String = ""
    @objc dynamic var imageUrl: String = ""
    @objc dynamic var bibliography: String = ""
    @objc dynamic var author: textBooks_authors? = nil
    
    var textContents = List<textBooksContents>()
    
    override class func primaryKey() -> String? {
        return "index"
    }
}

class textBooksContents: Object {
    @objc dynamic var text: String = ""
    @objc dynamic var surah: Surah? = nil
    @objc dynamic var verseInHafs: Verse? = nil
    @objc dynamic var textBook: textBooks? = nil
    @objc dynamic var collapsed: Bool = false
    
}

class textBooks_authors: Object {
    @objc dynamic var name: String = ""
}

