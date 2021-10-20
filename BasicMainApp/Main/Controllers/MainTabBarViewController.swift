//
//  MainTabBarViewController.swift
//  MainApp
//
//  Created by Jon Olivet on 3/29/20.
//  Copyright © 2020 Jon Olivet. All rights reserved.
//

// TODO: - import additional modules
import CommonsPack
import CuotasPack
import UIKit

class MainTabBarViewController: UITabBarController, UITabBarControllerDelegate {

    var tabBarViewControllers: [UIViewController] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        self.delegate = self
        self.tabBar.accessibilityLabel = "tabbar"

        // MARK: - TabBar style

        UITabBarItem.appearance().titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -3)
        tabBar.layer.shadowOffset = CGSize(width: 0, height: -1)
        tabBar.layer.shadowRadius = 1
        tabBar.layer.shadowColor = UIColor.black.cgColor
        tabBar.layer.shadowOpacity = 0.04
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().backgroundImage = UIImage()
        UITabBar.appearance().backgroundColor = .white

        // MARK: - Add TabBar items
        setupHomeTab()
        self.viewControllers = tabBarViewControllers
    }
    
    func setupHomeTab() {
        #if DEBUG
        if Configuration.App.stubs {
            // TODO: - enabdidMoveleStubs for modules here
            CuotasModuleStubs().enableStubs()
        }
        #endif

        let tabContainerVC = CuotasModuleFactory().getRootViewController()

        addViewController(
            tabContainerVC,
            title: "Home",
            image: UIImage(named: "tab_home"),
            selectedImage: UIImage(named: "tab_home")
        )
    }

    // MARK: - Helpers
    func addViewController(
        _ viewController: UIViewController,
        title: String,
        image: UIImage?,
        selectedImage: UIImage?) {
        viewController.title = title

        viewController.tabBarItem = UITabBarItem(title: title, image: image, selectedImage: selectedImage)
        viewController.tabBarItem.setTitleTextAttributes(
            [
                NSAttributedString.Key.strokeColor: UIColor.blue,
                NSAttributedString.Key.font: UIFont(name: "Helvetica", size: 9)!
            ], for: .normal
        )
        tabBarViewControllers.append(viewController)
    }

}
