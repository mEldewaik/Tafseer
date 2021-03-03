//
//  AppDelegate.swift
//  Tafseers
//
//  Created by Mohamed Eldewaik on 02/03/2021.
//

import UIKit
import RealmSwift
import SMLocalize

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.openRealm()
        self.changeStyle()
        
        SMLocalize.defaultLanguage = "ar"
        SMLocalize.configure()
        
        return true
    }
    
    func openRealm() {
        let migrationBlock: MigrationBlock = { migration, oldSchemaVersion in
            //Leave the block empty
        }
        Realm.Configuration.defaultConfiguration = Realm.Configuration(schemaVersion: 4, migrationBlock: migrationBlock)
        
        let defaultRealmPath = Realm.Configuration.defaultConfiguration.fileURL!
        let bundleRealmPath = Bundle.main.url(forResource: "CompareTafaseer", withExtension: "realm")
        
        if !FileManager.default.fileExists(atPath: defaultRealmPath.absoluteString) {
            do {
                try FileManager.default.copyItem(at: bundleRealmPath!, to: defaultRealmPath)
            } catch let error {
                print("error copying seeds: \(error)")
            }
        }
        
    }
    
    private
    func changeStyle(){
        
        let segmentAppearance = UISegmentedControl.appearance()
        let attributes = [NSAttributedString.Key.font:  UIFont.SegmentFont(size: 18)]
        segmentAppearance.setTitleTextAttributes(attributes, for: .normal)
        if #available(iOS 13.0, *) {
            let attributes = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.9813898206, green: 0.9779796004, blue: 0.9687867761, alpha: 1)]
            segmentAppearance.selectedSegmentTintColor = #colorLiteral(red: 0.05882352941, green: 0.4196078431, blue: 0.2509803922, alpha: 1)
            segmentAppearance.setTitleTextAttributes(attributes, for: .selected)
            segmentAppearance.backgroundColor = .clear
        } else {
            let attributes = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.9813898206, green: 0.9779796004, blue: 0.9687867761, alpha: 1)]
            segmentAppearance.tintColor = #colorLiteral(red: 0.05882352941, green: 0.4196078431, blue: 0.2509803922, alpha: 1)
            segmentAppearance.setTitleTextAttributes(attributes, for: .selected)
            segmentAppearance.backgroundColor = .clear
        }
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

