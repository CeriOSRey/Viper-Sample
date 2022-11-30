//
//  FirstSceneRouter.swift
//  Viper Sample
//
//  Created by Rey Cerio on 2022-11-24.
//

import Foundation

protocol FirstSceneRoutingProtocol {
    func navigateToNextScrene()
}

protocol FirstSceneDataPassing {
    var dataSource: FirstSceneDataSource? { get set }
}

class FirstSceneRouter: FirstSceneRoutingProtocol, FirstSceneDataPassing {
    var vc: FirstSceneViewController?
    var dataSource: FirstSceneDataSource?
    
    func navigateToNextScrene() {
        let secondScene = SecondSceneViewController()
        secondScene.router?.dataSource?.userInput = self.dataSource?.userInput
        vc?.navigationController?.pushViewController(secondScene, animated: true)
    }
}
