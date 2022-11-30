//
//  SecondSceneInteractor.swift
//  Viper Sample
//
//  Created by Rey Cerio on 2022-11-24.
//

import Foundation

protocol SecondSceneBusinessLogic {
    func loadScene()
}

protocol SecondSceneDataSource {
    var userInput: String? { get set }
}

class SecondSceneInteractor: SecondSceneBusinessLogic, SecondSceneDataSource {
    var presenter: SecondScenePresentationLogic?
    var userInput: String?
    
    func loadScene() {
        let response = SecondSceneEntity.LoadScene.Response(userInput: userInput)
        presenter?.presentLoadScene(response)
    }
}
