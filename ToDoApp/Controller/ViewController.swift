//
//  ViewController.swift
//  ToDoApp
//
//  Created by Nurmukhanbet Sertay on 06.08.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(TaskTableViewCell.self, forCellReuseIdentifier: TaskTableViewCell.identifier)
        
        return tableView
    }()
    
    var completedTasks = [Task(text: "Nur", isDone: true), Task(text: "Ser", isDone: true)]
    var incompleteTasks = [Task(text: "Nurmukh", isDone: false), Task(text: "Sertay", isDone: false)]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupConstraints()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func setupView() {
        view.addSubview(tableView)
    }
    
    func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return completedTasks.count
        } else {
            return incompleteTasks.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TaskTableViewCell.identifier, for: indexPath) as! TaskTableViewCell
            if indexPath.section == 0 {
                cell.taskLabel.text = completedTasks[indexPath.row].text
            } else {
                cell.taskLabel.text = incompleteTasks[indexPath.row].text
            }
            return cell
        }

        func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            if section == 0 {
                return "Выполненные задачи"
            } else {
                return "Не выполненные задачи"
            }
        }
    
    
}


