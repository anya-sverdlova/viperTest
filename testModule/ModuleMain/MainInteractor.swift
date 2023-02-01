//
//  MainInteractor.swift
//  testModule
//
//  Created by Anna Sverdlova on 31.01.2023.
//

import Foundation

protocol MainInteractorInterface {
    var source: [String] {get}
    func getData()
}

class MainInteractor {
    private var entity = Entity()
    weak var presenter: MainPresenterInterface?
    
    var source: [String] {
        return entity.items
    }
}

extension MainInteractor: MainInteractorInterface {
    func getData() {
        NetworkManager.shared.getData() { [unowned self] result, error in
            if let error = error {
                self.presenter?.errorLoadingData(error)
            } else {
                self.entity.items = result
                self.presenter?.dataLoaded()
            }
        }
    }
}

