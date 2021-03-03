//
//  AppCoordinator.swift
//  Tafseer
//
//  Created by Mohamed Eldewaik on 19/02/2021.
//

import UIKit

class AppCoordinator {
    
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let viewController = MainVC.instantiate(viewModel: TafseerListViewModel())
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.isNavigationBarHidden = true
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
