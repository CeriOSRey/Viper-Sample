//
//  SecondSceneEntitiy.swift
//  Viper Sample
//
//  Created by Rey Cerio on 2022-11-24.
//

import Foundation

enum SecondSceneEntity {
    enum LoadScene {
        struct Request {}
        struct Response {
            var userInput: String?
        }
        struct ViewModel {
            var displayText: String
        }
    }
}
