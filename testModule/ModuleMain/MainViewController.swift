//
//  MainViewController.swift
//  testModule
//
//  Created by Anna Sverdlova on 31.01.2023.
//

import UIKit

protocol MainViewControllerInterface: AnyObject {
    func dataLoaded()
    func errorLoadingData(_ error: Error)
}

class MainViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: MainPresenterInterface?
    var data: [String] {
        return presenter?.source ?? []
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.register(UINib.init(nibName: "MainTableViewCell", bundle: nil), forCellReuseIdentifier: "MainTableViewCell")
        tableView.isHidden = true
    }
    
    @IBAction func getDataTapped(_ sender: Any) {
        self.presenter?.getData()
    }
}

extension MainViewController: MainViewControllerInterface {
    func dataLoaded() {
        DispatchQueue.main.async {
            self.hideSpinner()
            self.tableView.isHidden = false
            self.tableView.reloadData()
        }
    }
    
    func errorLoadingData(_ error: Error) {
        DispatchQueue.main.async {
            self.hideSpinner()
            self.showErrorAlert(withMessage: error.localizedDescription)
        }
    }
}

private extension MainViewController {
    
    func showSpinner() {
        let child = SpinnerViewController()
        
        addChild(child)
        child.view.frame = view.frame
        view.addSubview(child.view)
        child.didMove(toParent: self)
    }
    
    func hideSpinner() {
        if let child = self.children.first(where: {$0.isKind(of: SpinnerViewController.self)}) {
            child.willMove(toParent: nil)
            child.view.removeFromSuperview()
            child.removeFromParent()
        }
    }
    
    func showErrorAlert(withMessage message: String) {
        let alert = UIAlertController.init(title: "Error", message: message, preferredStyle: .alert)
        let close = UIAlertAction.init(title: "OK", style: .cancel, handler: {_ in
            self.dismiss(animated: true, completion: nil)
        })
        alert.addAction(close)
        self.present(alert, animated: true, completion: nil)
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell", for: indexPath) as! MainTableViewCell
        cell.setup(data[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.presenter?.showDetail()
    }
}
