//
//  ViewController.swift
//  iOS-Assignement6
//
//  Created by Administlator on 2020/05/19.
//  Copyright © 2020 Administlator. All rights reserved.
//

import UIKit

class ViewController: UITableViewController, UITableViewDragDelegate , UITableViewDropDelegate{
    
    
    
    struct PropertyKeys {
        static let todoCell = "TodoCell"
    }
    
    let headers = ["High Priority", "Medium Priority", "Low Priority"]
    
    let label = UILabel()
    var list: [[Todo]] = [
        [Todo(id: 1, title: "hoge", priority: 1, status: 0)],
        [Todo(id: 2, title: "fuga", priority: 1, status: 0)],
        [Todo(id: 3, title: "page", priority: 1, status: 0)]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setHeader()
        setBody()
        
        tableView.dragInteractionEnabled = true
        tableView.dragDelegate = self
        tableView.dropDelegate = self
    }
    
    func setHeader() {
        let editButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(onTapLeftItem))
        self.navigationItem.leftBarButtonItem = editButton
        let deleteButton = UIBarButtonItem(title: "Delete", style: .plain, target: self, action: #selector(onTapDelete))
        let addButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(onTapNew))
        self.navigationItem.rightBarButtonItems = [addButton, deleteButton]
    }
    
    func setBody() {
        view.backgroundColor = UIColor.white
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: PropertyKeys.todoCell)
        tableView.allowsMultipleSelectionDuringEditing = true
    }
    
    func tableView(_ tableView: UITableView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        return []
    }
    
    func tableView(_ tableView: UITableView, performDropWith coordinator: UITableViewDropCoordinator) {
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list[section].count
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
      return self.list.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
       return headers[section]
    }
    
    // create a cell for each table view row
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PropertyKeys.todoCell, for: indexPath)
        
        // set the text from the data model
        cell.textLabel?.text = self.list[indexPath.section][indexPath.row].title
        cell.accessoryType = .detailButton
        
        return cell
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        label.frame = view.bounds
    }
    
    @objc func onTapLeftItem() {
        tableView.setEditing(true, animated: true)
    }
    
    @objc func onTapDelete() {
        
    }
    
    @objc func onTapNew() {
        let newTodo = NewTodoController()
        navigationController?.pushViewController(newTodo, animated: true)
    }
}

