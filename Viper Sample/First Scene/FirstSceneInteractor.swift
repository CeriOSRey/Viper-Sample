//
//  FirstSceneInteractor.swift
//  Viper Sample
//
//  Created by Rey Cerio on 2022-11-24.
//

import Foundation

protocol FirstSceneBusinessLogic {
    func loadScene()
    func userPushedButton(_ request: FirstSceneEntity.PushButton.Request)
}

protocol FirstSceneDataSource {
    var userInput: String? { get set }
}

class FirstSceneInteractor: FirstSceneBusinessLogic, FirstSceneDataSource {
    
    var presenter: FirstScenePresentationLogic?
    var userInput: String?
    
    func doSomeWork() {
        DispatchQueue.main.async {
            self.completeWorkWithResponse(responseCode: 200)
        }
    }
    
    func completeWorkWithResponse(responseCode: Int?) {
        let response = FirstSceneEntity.PushButton.Response(isWaiting: false, responseCode: responseCode)
        self.presenter?.presentUserPushedButton(response)
    }
    
    func captureEnteredText(enteredText: String?) {
        if enteredText?.isEmpty ?? true {
            self.userInput = nil
        } else {
            self.userInput = enteredText
        }
    }
    
    func loadScene() {
        presenter?.presentLoadScene()
    }
    
    func userPushedButton(_ request: FirstSceneEntity.PushButton.Request) {
        captureEnteredText(enteredText: request.enteredText)
        let response = FirstSceneEntity.PushButton.Response(isWaiting: true)
        presenter?.presentUserPushedButton(response)
        doSomeWork()
    }
}
