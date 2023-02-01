//
//  MainRouter.swift
//  testModule
//
//  Created by Anna Sverdlova on 31.01.2023.
//

import Foundation
import UIKit

protocol MainRouterInterface {
    func showDetail()
}

class MainRouter {
        
    static func createMainModule() -> MainViewController {
        let mainVC = UIStoryboard(name: "MainView", bundle: nil).instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
        
        let presenter = MainPresenter()
        
        let interactor = MainInteractor()
        interactor.presenter = presenter
        let router = MainRouter()
        
        presenter.router = router
        presenter.view = mainVC
        presenter.interactor = interactor
        
        mainVC.presenter = presenter
        
        return mainVC
    }
}

extension MainRouter: MainRouterInterface {
    func showDetail() {
        // here will be code which will create next controller and push it to nac vc
    }
}
