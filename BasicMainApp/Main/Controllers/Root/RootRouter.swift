//
//  RootRouter.swift
//  MainApp
//
//  Created by Jon Olivet on 8/28/18.
//  Copyright © 2018 Jon Olivet. All rights reserved.
//

import BasicCommons
import Transbank
import UIKit

@objc
protocol RootRoutingLogic {
    func routeToTransbank()
}

protocol RootDataPassing {
    var dataStore: RootDataStore? { get }
}

class RootRouter: NSObject, RootRoutingLogic, RootDataPassing {
    weak var viewController: RootViewController?
    var dataStore: RootDataStore?

    // MARK: Routing

    func routeToTransbank() {
        let storyboard = UIStoryboard(
            name: "MoviesMain",
            bundle: Utils.bundle(forClass: MovieSummaryViewController.classForCoder())
            )
        let destinationNVC = storyboard.instantiateInitialViewController() as! UINavigationController
//        destinationNVC.modalPresentationStyle = .fullScreen
        navigateToTransbank(source: viewController!, destination: destinationNVC)
    }

    // MARK: Navigation
     func navigateToTransbank(source: RootViewController, destination: UINavigationController) {
        source.present(destination, animated: true, completion: nil)
    }
}
