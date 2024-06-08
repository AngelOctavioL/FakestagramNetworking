//
//  This file is for educational purposes only. It may contain code snippets, examples, images, and explanations
//  intended to help understand concepts and improve programming skills.
//

import UIKit

class MainRouter {
    private var mainNavigation = UINavigationController()
    
    func startNavigation() -> UIViewController {
        configureNavigation()
        if Settings.user == nil {
            mainNavigation.setViewControllers([getLoginViewController()], animated: false)
        } else {
            mainNavigation.setViewControllers([getDashboard()], animated: false)
        }
        return mainNavigation
    }
    
    func getLoginViewController() -> LoginViewController {
        LoginViewController(router: self)
    }
    
    private func getDashboard() -> UIViewController {
        let viewControllers = [
            UINavigationController(rootViewController: PhotosViewController(style: .insetGrouped)),
            UINavigationController(rootViewController: PostsViewController(style: .insetGrouped)),
            UINavigationController(rootViewController: SettingsViewController(router: self))
        ]
        let tabBarController = UITabBarController()
        tabBarController.setViewControllers(viewControllers, animated: false)
        tabBarController.modalPresentationStyle = .overFullScreen
        return tabBarController
    }
    
    func logOut(completion: (() -> Void)? = nil) {
        deleteData()
        if mainNavigation.viewControllers.first is LoginViewController {
            mainNavigation.dismiss(animated: true, completion: completion)
        } else {
            mainNavigation.setViewControllers([getLoginViewController()], animated: false)
        }
    }
    
    func logIn(completion: (() -> Void)? = nil) {
        mainNavigation.present(getDashboard(), animated: true, completion: completion)
    }
    
    private func deleteData() {
        if let bundleIdentifier = Bundle.main.bundleIdentifier {
            UserDefaults.standard.removePersistentDomain(forName: bundleIdentifier)
        }
    }
    
    private func configureNavigation() {
        mainNavigation.isNavigationBarHidden = true
    }
}
