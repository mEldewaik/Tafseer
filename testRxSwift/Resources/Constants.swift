//
//  Constants.swift
//  Tafseer
//
//  Created by Mohamed Eldewaik on 19/02/2021.
//

import Foundation

enum AppLangs: CaseIterable {
    case arabic, english
    
    var code: String {
        switch self {
        case .arabic: return "ar"
        case .english: return "en"
        }
    }
}

struct Constants{
    
    struct FontAra {
        static let Regular = "AraHamahKilania-Regular"
    }
    
    struct FontUthmanHafs {
        static let Regular = "KFGQPCHAFSUthmanicScript-Regula"
    }
    
    struct FontUthman {
        static let Regular = "AraHamahKilania-Regular"
        static let Bold = "AraHamahKilania-Regular"
    }
    
}
