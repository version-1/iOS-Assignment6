//
//  ViewController.swift
//  iOS-Assignement6
//
//  Created by Administlator on 2020/05/19.
//  Copyright © 2020 Administlator. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setHeader()
        setBody()
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
        label.text = "Hello World"
        label.textAlignment = .center
        view.addSubview(label)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        label.frame = view.bounds
    }
    
    @objc func onTapLeftItem() {
        
    }
    
    @objc func onTapDelete() {
        
    }
    
    @objc func onTapNew() {
        let newTodo = NewTodoController()
        navigationController?.pushViewController(newTodo, animated: true)
    }
}

