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

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.frame = view.frame
        view.addSubview(tableView)
        tableView.backgroundColor = .systemGroupedBackground
        tableView.dataSource = self
        tableView.delegate = self
        URLSession.shared.dataTask(with:URL(string: "https://jsonplaceholder.typicode.com/users")!) { data, _, _ in
            let json = try! JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [[String:Any]]
            json?.forEach({ item in
                let name = item["name"] as! String
                let web = item["website"] as! String
                self.users.append((name,web))
            })
            self.tableView.reloadData()
        }
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

