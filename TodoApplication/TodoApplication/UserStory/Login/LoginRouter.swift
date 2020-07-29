//
//  LoginRouter.swift
//  TodoApplication
//
//  Created by Vladislav Nikolaychuck on 27.07.2020.
//  Copyright © 2020 Vladislav Nikolaychuck. All rights reserved.
//

import UIKit

class LoginRouter: LoginRouterProtocol {
    
    func navigateToMainApp() {
        DispatchQueue.main.async {
            AppRouter.runMainFlow()
        }
    }
    
    func navigateToSignUpViewController(from view: LoginViewProtocol) {
        guard let viewController = view as? UIViewController else {
            return
        }
        let signUpController = SignUpConfigurator.createSignUpRouterModule()
        viewController.navigationController?.pushViewController(signUpController,
                                                                animated: true)
    }
    
}
