//
//  SecondScenePresenter.swift
//  Viper Sample
//
//  Created by Rey Cerio on 2022-11-24.
//

import Foundation

protocol SecondScenePresentationLogic {
    func presentLoadScene(_ response: SecondSceneEntity.LoadScene.Response)
}

class SecondScenePresenter: SecondScenePresentationLogic {
    var vc: SecondSceneDisplayLogic?
    
    func generateDisplayText(userInput: String?) -> String {
        guard let userInput = userInput else {
            return "No text to display"
        }
        return userInput
    }
    
    func presentLoadScene(_ response: SecondSceneEntity.LoadScene.Response) {
        let displayText = generateDisplayText(userInput: response.userInput)
        let viewModel = SecondSceneEntity.LoadScene.ViewModel(displayText: displayText)
        DispatchQueue.main.async { [weak self] in
            self?.vc?.displayLoadScene(viewModel)
        }
    }
}
