//
//  SecondSceneViewController.swift
//  Viper Sample
//
//  Created by Rey Cerio on 2022-11-24.
//

import UIKit

protocol SecondSceneDisplayLogic {
    func displayLoadScene(_ viewModel: SecondSceneEntity.LoadScene.ViewModel)
}

class SecondSceneViewController: UIViewController, SecondSceneDisplayLogic {
    
    var router: (SecondSceneRoutingLogic & SecondSceneDataPassing)?
    var interactor: SecondSceneBusinessLogic?
    
    @IBOutlet weak var textLabel: UILabel!
    
    func setup() {
        let viewcontroller = self
        let interactor = SecondSceneInteractor()
        let presenter = SecondScenePresenter()
        let router = SecondSceneRouter()
        viewcontroller.interactor = interactor
        viewcontroller.router = router
        interactor.presenter = presenter
        presenter.vc = viewcontroller
        router.vc = viewcontroller
        router.dataSource = interactor
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.loadScene()
    }
    
    func displayLoadScene(_ viewModel: SecondSceneEntity.LoadScene.ViewModel) {
        textLabel.text = viewModel.displayText
    }
}
