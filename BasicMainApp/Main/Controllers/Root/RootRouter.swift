//
//  RootRouter.swift
//  MainApp
//
//  Created by Jon Olivet on 8/28/18.
//  Copyright © 2018 Jon Olivet. All rights reserved.
//

import BasicCommons
import OPHelpCenter
import UIKit

@objc
protocol RootRoutingLogic {
    func routeToCuotasModule()
}

protocol RootDataPassing {
    var dataStore: RootDataStore? { get }
}

class RootRouter: NSObject, RootRoutingLogic, RootDataPassing {
    weak var viewController: RootViewController?
    var dataStore: RootDataStore?

    // MARK: Routing

    func routeToCuotasModule() {
        let preguntasFrecuentesVC = OPWebFactory().getInitVC(webUrl: "https://www.yahoo.com", title: "Preguntas Frequentes")
        viewController?.present(preguntasFrecuentesVC, animated: true, completion: nil)
//        let storyboard = UIStoryboard(
//            name: "CuotasMain",
//            bundle: Utils.bundle(forClass: EnterAmountCleanViewController.classForCoder())
//            )
//        let destinationNVC = storyboard.instantiateInitialViewController() as! UINavigationController
////        destinationNVC.modalPresentationStyle = .fullScreen
//        navigateToCuotasModule(source: viewController!, destination: destinationNVC)
    }

    // MARK: Navigation
//     func navigateToCuotasModule(source: RootViewController, destination: UINavigationController) {
//        source.present(destination, animated: true, completion: nil)
//    }
}
