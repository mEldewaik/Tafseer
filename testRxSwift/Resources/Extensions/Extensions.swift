//
//  Extensions.swift
//  Tafseer
//
//  Created by Mohamed Eldewaik on 19/02/2021.
//

import Foundation
import RealmSwift
//import NVActivityIndicatorView

extension Results {
    func toArray<T>(ofType: T.Type) -> [T] {
        var array = [T]()
        for i in 0 ..< count {
            if let result = self[i] as? T {
                array.append(result)
            }
        }
        
        return array
    }
}


//extension UIViewController: NVActivityIndicatorViewable {
//    
//    func startAnimate(){
//        let size = CGSize(width: 60, height: 60)
//        self.startAnimating(size, message: "", type: .ballPulseSync, color: #colorLiteral(red: 0.009661746211, green: 0.4847509265, blue: 0.2365855277, alpha: 1), padding: 6)
//    }
//    
//    func stopAnimate(){
//        self.stopAnimating(nil)
//    }
//}

extension UIApplication {
    class func tryURL(urls: [String]) {
        let application = UIApplication.shared
        for url in urls {
            if application.canOpenURL(URL(string: url)!) {
                application.open(URL(string: url)!, options: [:], completionHandler: nil)
                return
            }
        }
    }
    
    class func topViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(controller: selected)
            }
        }
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        return controller
    }
}
