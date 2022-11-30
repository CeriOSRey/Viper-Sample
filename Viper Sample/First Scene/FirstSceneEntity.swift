//
//  FirstSceneEntity.swift
//  Viper Sample
//
//  Created by Rey Cerio on 2022-11-24.
//

import Foundation

struct FirstSceneEntity {
    enum LoadScene {
        struct ViewModel {
            var isActivityIndicatorActive: Bool
            var placeHolderText: String
        }
    }
    
    enum PushButton {
        struct Request {
            var enteredText: String?
        }
        struct Response {
            var isWaiting: Bool
            var responseCode: Int?
        }
        struct ViewModel {
            var isActivityIndicatorActive: Bool
            var shouldNavigateToNextScene: Bool
        }
    }
}
