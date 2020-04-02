//
//  RootModels.swift
//  MainApp
//
//  Created by Jon Olivet on 8/28/18.
//  Copyright © 2018 Jon Olivet. All rights reserved.
//

enum Root {

    enum Basic {
        struct Request { }
        struct Response {
            let title: String
            let subtitle: String
        }
        struct ViewModel {
            let title: String
            let subtitle: String
        }
    }
}
