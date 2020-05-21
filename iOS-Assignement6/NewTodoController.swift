//
//  NewTodoController.swift
//  iOS-Assignement6
//
//  Created by Administlator on 2020/05/20.
//  Copyright © 2020 Administlator. All rights reserved.
//

import UIKit

class NewTodoController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        navigationItem.title = "Add Todo Item"
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(onTapCancel))
        navigationItem.leftBarButtonItem = cancelButton
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(onTapDone))
        navigationItem.rightBarButtonItems = [doneButton]
    }
    
    @objc func onTapCancel() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func onTapDone() {
        navigationController?.popViewController(animated: true)
    }

}
