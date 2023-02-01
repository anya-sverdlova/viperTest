//
//  MainPresenter.swift
//  testModule
//
//  Created by Anna Sverdlova on 31.01.2023.
//

import Foundation

protocol MainPresenterInterface: AnyObject {
    var source: [String] {get}
    func getData()
    func errorLoadingData(_ error: Error)
    func dataLoaded()
    func showDetail()
}

class MainPresenter {
    weak var view: MainViewControllerInterface?
    var interactor: MainInteractorInterface?
    var router: MainRouterInterface?
}

extension MainPresenter: MainPresenterInterface {
    
    var source: [String] {
        return interactor?.source ?? []
    }
    
    func getData() {
        self.interactor?.getData()
    }
    
    func errorLoadingData(_ error: Error) {
        self.view?.errorLoadingData(error)
    }
    
    func dataLoaded() {
        self.view?.dataLoaded()
    }
    
    func showDetail() {
        self.router?.showDetail()
    }
}
