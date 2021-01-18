//
//  ViewController.swift
//  DevChallenge
//
//  Created by OZE-Shadrach on 12/8/20.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    let tableView = UITableView(frame: .zero, style: .insetGrouped)
    let cellReuseIdentifier = "cell"
    let viewModel = UserViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupViewModel()
    }
    private func setupTableView(){
        tableView.frame = view.frame
        view.addSubview(tableView)
        tableView.backgroundColor = .systemGroupedBackground
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func setupViewModel(){
        viewModel.fetchCompletedDelegate = self
        viewModel.fetchUserData()
    }


    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.users.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellReuseIdentifier)
        cell.textLabel?.text = viewModel.users[indexPath.row].name
        cell.detailTextLabel?.text = viewModel.users[indexPath.row].website
        cell.accessoryType = .disclosureIndicator
        return cell
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        UITableView.automaticDimension
    }

}


extension ViewController: DataFetchProtocol {
    func onFetchCompleted() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func onFetchFailed(error: Error) {
        DispatchQueue.main.async {
            self.showAlert(title: "Oops!", message: error.localizedDescription)
        }
    }
}
