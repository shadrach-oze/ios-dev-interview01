//
//  ViewController.swift
//  DevChallenge
//
//  Created by OZE-Shadrach on 12/8/20.
//

import UIKit

class ViewController: UIViewController {

    let tableView = UITableView(frame: .zero, style: .insetGrouped)

    var users:[Users] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.frame = view.frame
        view.addSubview(tableView)
        tableView.backgroundColor = .systemGroupedBackground
        tableView.dataSource = self
        tableView.delegate = self
        
        let dataLoader = DataLoader()
        dataLoader.delegate = self
        dataLoader.getNames()
    }
}

extension ViewController: UITableViewDataSource,UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: StringConstants.cellIdentifier)
        cell.textLabel?.text = users[indexPath.row].name
        cell.detailTextLabel?.text = users[indexPath.row].website
        cell.accessoryType = .disclosureIndicator
        return cell
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        UITableView.automaticDimension
    }
}

extension ViewController: DataLoaderProtocol {
    func loadNames(users: [Users]) {
        self.users = users
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
