//
//  DatabaseManager.swift
//  Tafseer
//
//  Created by Mohamed Eldewaik on 19/02/2021.
//

import Foundation
import RealmSwift
import RxSwift
import RxCocoa

class DatabaseManager {
    
    static let shared = DatabaseManager()
    var realm : Realm!
    
    private init() {
        realm = try! Realm()
    }
    
}
