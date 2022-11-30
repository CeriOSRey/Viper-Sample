//
//  FirstScenePresenter.swift
//  Viper Sample
//
//  Created by Rey Cerio on 2022-11-24.
//

import Foundation

protocol FirstScenePresentationLogic {
    func presentLoadScene()
    func presentUserPushedButton(_ response: FirstSceneEntity.PushButton.Response)
}

class FirstScenePresenter: FirstScenePresentationLogic {
    var vc: FirstSceneDisplayProtocol?
    
    func shouldNavigateToNextScene(_ responseCode: Int?) -> Bool {
        guard let responseCode = responseCode else {
            return false
        }
        
        if responseCode == 200 {
            return true
        }
        
        return false
    }
    
    func presentLoadScene() {
        let placeHolderText = "Enter text here"
        let viewModel = FirstSceneEntity.LoadScene.ViewModel (
            isActivityIndicatorActive: false,
            placeHolderText: placeHolderText
        )
        
        DispatchQueue.main.async {
            self.vc?.displayLoadScene(viewModel)
        }
    }
    
    func presentUserPushedButton(_ response: FirstSceneEntity.PushButton.Response) {
        let viewModel = FirstSceneEntity.PushButton.ViewModel(
            isActivityIndicatorActive: response.isWaiting,
            shouldNavigateToNextScene: self.shouldNavigateToNextScene(response.responseCode)
        )
        
        DispatchQueue.main.async {
            self.vc?.displayUserPushedButton(viewModel)
        }
    }
}
