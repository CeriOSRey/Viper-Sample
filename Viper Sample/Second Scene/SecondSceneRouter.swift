//
//  SecondSceneRouter.swift
//  Viper Sample
//
//  Created by Rey Cerio on 2022-11-24.
//

import Foundation

protocol SecondSceneRoutingLogic {}
protocol SecondSceneDataPassing {
    var dataSource: SecondSceneDataSource? { get set }
}

class SecondSceneRouter: SecondSceneRoutingLogic, SecondSceneDataPassing {
    var vc: SecondSceneViewController?
    var dataSource: SecondSceneDataSource?
    
    var userInput: String?
}
