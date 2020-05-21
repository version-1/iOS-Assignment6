//
//  ViewController.swift
//  iOS-Assignement6
//
//  Created by Administlator on 2020/05/19.
//  Copyright © 2020 Administlator. All rights reserved.
//

import UIKit

class ViewController: UITableViewController, UITableViewDragDelegate , UITableViewDropDelegate {
        
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
    
    var editingButton : UIBarButtonItem?
    var doneButton : UIBarButtonItem?
    var deleteButton: UIBarButtonItem?
    var addButton: UIBarButtonItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        editingButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(onEditing))
        doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(onEditingDone))
        deleteButton = UIBarButtonItem(title: "Delete", style: .plain, target: self, action: #selector(onTapDelete))
        addButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(onTapNew))
        
        setHeader()
        setBody()
        
        tableView.dragInteractionEnabled = true
        tableView.dragDelegate = self
        tableView.dropDelegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    func setHeader() {
        self.navigationItem.leftBarButtonItem = editingButton
        self.navigationItem.rightBarButtonItems = [addButton!]
    }
    
    func setHeaderForEditing() {
        self.navigationItem.leftBarButtonItem = doneButton
        self.navigationItem.rightBarButtonItems = [deleteButton!]
        
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
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        toTodoView(indexPath: indexPath)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        label.frame = view.bounds
    }
    
    @objc func onEditing() {
        tableView.setEditing(true, animated: true)
        setHeaderForEditing()
    }
    
    @objc func onEditingDone() {
        tableView.setEditing(false, animated: true)
        setHeader()
    }
    
    @objc func onTapDelete() {
        
    }
    
    @objc func onTapNew() {
        toTodoView(indexPath: nil)
    }
    
    private func toTodoView(indexPath: IndexPath?) {
        let todoController = TodoController()
        todoController.list = list
        if indexPath != nil {
            todoController.todo = list[indexPath!.section][indexPath!.row]
            todoController.indexPath = indexPath
        }
        navigationController?.pushViewController(todoController, animated: true)
    }
}

