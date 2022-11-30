//
//  FirstSceneViewController.swift
//  Viper Sample
//
//  Created by Rey Cerio on 2022-11-24.
//

import UIKit

protocol FirstSceneDisplayProtocol {
    func displayLoadScene(_ viewModel: FirstSceneEntity.LoadScene.ViewModel)
    func displayUserPushedButton(_ viewModel: FirstSceneEntity.PushButton.ViewModel)
}

class FirstSceneViewController: UIViewController {
    
    var router: ()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

