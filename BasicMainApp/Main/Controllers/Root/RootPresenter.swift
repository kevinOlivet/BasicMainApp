//
//  RootPresenter.swift
//  MainApp
//
//  Created by Jon Olivet on 8/28/18.
//  Copyright © 2018 Jon Olivet. All rights reserved.
//

import UIKit

protocol RootPresentationLogic {
    func presentSetupUI(response: Root.Basic.Response)
}

class RootPresenter: RootPresentationLogic {
    weak  var viewController: RootDisplayLogic?

    // MARK: Methods

    func presentSetupUI(response: Root.Basic.Response) {
        let viewModel = Root.Basic.ViewModel(
            title: response.title.localized(),
            subtitle: response.subtitle.localized()
        )
        viewController?.displaySetupUI(viewModel: viewModel)
    }
}
