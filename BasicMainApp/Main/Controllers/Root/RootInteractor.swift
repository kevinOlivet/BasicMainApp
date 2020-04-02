//
//  RootInteractor.swift
//  MainApp
//
//  Created by Jon Olivet on 8/28/18.
//  Copyright © 2018 Jon Olivet. All rights reserved.
//

import Foundation

protocol RootBusinessLogic {
    func setupUI(request: Root.Basic.Request)
}

protocol RootDataStore {}

class RootInteractor: RootBusinessLogic, RootDataStore {
    var presenter: RootPresentationLogic?
    var worker: RootWorker = RootWorker()

    // MARK: Methods
    func setupUI(request: Root.Basic.Request) {
        let response = Root.Basic.Response(
            title: "Welcome to the BasicMainApp",
            subtitle: "Please tap anywhere to begin"
        )
        presenter?.presentSetupUI(response: response)
    }
}
