//
//  RootViewController.swift
//  MainApp
//
//  Created by Jon Olivet on 8/28/18.
//  Copyright © 2020 Jon Olivet. All rights reserved.
//

import BasicCommons
import CuotasModule

protocol RootDisplayLogic: AnyObject {
    func displaySetupUI(viewModel: Root.Basic.ViewModel)
}

class RootViewController: UIViewController, RootDisplayLogic {
    var interactor: RootBusinessLogic?
    var router: (NSObjectProtocol & RootRoutingLogic & RootDataPassing)?

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!

    // MARK: Object lifecycle

    override  init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    // MARK: Setup

    private func setup() {
        let viewController = self
        let interactor = RootInteractor()
        let presenter = RootPresenter()
        let router = RootRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }

    // MARK: View lifecycle

    override  func viewDidLoad() {
        super.viewDidLoad()
        interactor?.setupUI(request: Root.Basic.Request())
        #if DEBUG
        if Configuration.App.stubs {
            print("Here stubs enabled")
            CuotasModuleStubs().enableStubs()
        } else {
            print("Here stubs disabled")
        }
        #endif
    }

    // MARK: Methods
    func displaySetupUI(viewModel: Root.Basic.ViewModel) {
        view.addTapAction(target: self, action: #selector(goToCuotasModule))
        titleLabel.text = viewModel.title
        subtitleLabel.text = viewModel.subtitle
    }

    @objc
    func goToCuotasModule() {
        router?.routeToCuotasModule()
    }
}
