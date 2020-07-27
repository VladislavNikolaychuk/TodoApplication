//
//  AppRouter.swift
//  TodoApplication
//
//  Created by Vladislav Nikolaychuck on 24.07.2020.
//  Copyright © 2020 Vladislav Nikolaychuck. All rights reserved.
//

import UIKit

final class AppRouter {
    
    static func runOnLoadFlow() {
        AppRouter.runAuthFlow()
    }
    
    static func runAuthFlow() {
        AuthManager.shared.logout()
        let mainController = LoginConfigurator.createLoginRouterModule()
        let navigation = UINavigationController(rootViewController: mainController)
        changeFlowTo(controller: navigation)
    }
    
    static func runMainFlow() {
        let mainController = UIViewController()
        mainController.view.backgroundColor = .green
        let navigation = UINavigationController(rootViewController: mainController)
        navigation.isNavigationBarHidden = true
        changeFlowTo(controller: navigation)
    }
    
    // MARK: Helpers
    static private func runFadeAnimationForWindow(_ window: UIWindow?) {
        guard let window = UIApplication.shared.keyWindow else {
            return
        }
        let options: UIView.AnimationOptions = .transitionCrossDissolve
        let duration: TimeInterval = 0.5
        UIView.transition(with: window, duration: duration,
                          options: options, animations: {},
                          completion: { _ in })
    }
    
    static func changeFlowTo(controller: UIViewController) {
        let window = UIApplication.shared.keyWindow
        window?.rootViewController = controller
        runFadeAnimationForWindow(window)
    }
}
