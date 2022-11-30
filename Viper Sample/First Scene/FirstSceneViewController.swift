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

class FirstSceneViewController: UIViewController, FirstSceneDisplayProtocol {
        
    var router: (FirstSceneRoutingProtocol & FirstSceneDataPassing)?
    var interactor: FirstSceneBusinessLogic?
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var textField: UITextField!
    
    func setup() {
        let viewcontroller = self
        let interactor = FirstSceneInteractor()
        let presenter = FirstScenePresenter()
        let router = FirstSceneRouter()
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

    @IBAction func goToNextScene() {
        let request = FirstSceneEntity.PushButton.Request(enteredText: textField.text)
        interactor?.userPushedButton(request)
    }
    
    func displayLoadScene(_ viewModel: FirstSceneEntity.LoadScene.ViewModel) {
        activityIndicator.isHidden = !viewModel.isActivityIndicatorActive
        textField.placeholder = viewModel.placeHolderText
    }
    
    func displayUserPushedButton(_ viewModel: FirstSceneEntity.PushButton.ViewModel) {
        if viewModel.shouldNavigateToNextScene {
            router?.navigateToNextScrene()
            return
        }
        
        activityIndicator.isHidden = !viewModel.isActivityIndicatorActive
        viewModel.isActivityIndicatorActive
        ? activityIndicator.startAnimating()
        : activityIndicator.stopAnimating()
    }
    
}

