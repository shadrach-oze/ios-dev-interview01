//
//  ViewController.swift
//  DevChallenge
//
//  Created by OZE-Shadrach on 12/8/20.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    let tableView = UITableView(frame: .zero, style: .insetGrouped)

    var users:[(name:String,url:String)] = []
    
    
    var viewModel : MainViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        viewModel = MainViewModel(useCase: MianUseCase())
        viewModel.fetchUsersList()
        
        configureUI()
    }
    
    private func configureUI(){
        tableView.frame = view.frame
        view.addSubview(tableView)
        tableView.backgroundColor = .systemGroupedBackground
        tableView.dataSource = self
        tableView.delegate = self
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        cell.textLabel?.text = users[indexPath.row].name
        cell.detailTextLabel?.text = users[indexPath.row].url
        cell.accessoryType = .disclosureIndicator
        return cell
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        UITableView.automaticDimension
    }

}

