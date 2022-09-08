//
//  SceneDelegate.swift
//  NotBored
//
//  Created by Maria Estefania Sassone on 05/09/2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowsScene = (scene as? UIWindowScene) else { return
            
        }
        
        window = UIWindow(windowScene: windowsScene)
        let mainViewController = HomeViewController()
        let navController = UINavigationController(rootViewController: mainViewController)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
    }


}
