//
//  SceneDelegate.swift
//  RickAndMortyApp
//
//  Created by Eva Gonzalez Ferreira on 9/10/23.
//

import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard (scene as? UIWindowScene) != nil else { return }

        if let windowScene = scene as? UIWindowScene {
            self.window = UIWindow(windowScene: windowScene)
            
            self.window?.rootViewController = setRootViewController()
            self.window?.makeKeyAndVisible()
        }
    }
    
    func setRootViewController() -> UIViewController {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(Color.contentPrimary)
        appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        let viewController = rickyMortyAssembly.characterListViewController()
        let navigationVC = UINavigationController(rootViewController: viewController)
        
        navigationVC.navigationBar.standardAppearance = appearance
        navigationVC.navigationBar.scrollEdgeAppearance = appearance
        navigationVC.navigationBar.tintColor = .white

        return navigationVC
    }
}

