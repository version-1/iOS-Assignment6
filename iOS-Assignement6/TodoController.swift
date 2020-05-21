//
//  NewTodoController.swift
//  iOS-Assignement6
//
//  Created by Administlator on 2020/05/20.
//  Copyright © 2020 Administlator. All rights reserved.
//

import UIKit

class TodoController: UIViewController {
    
    var todo: Todo?
    var list: [[Todo]]?
    var indexPath: IndexPath?
    var isEditForm = false
    
    var cancelButton: UIBarButtonItem?
    var doneButton: UIBarButtonItem?
    
    struct PropertyKeys {
        static let high = "TodoCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setHeader()
        setBody()
    }
    
    func setHeader() {
        if self.todo != nil {
          isEditForm = true
          navigationItem.title = "Edit Todo Item"
        } else {
          navigationItem.title = "Add Todo Item"
          self.todo = Todo()
        }
        
        cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(onTapCancel))
        doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(onTapDone))
        navigationItem.leftBarButtonItem = cancelButton
        navigationItem.rightBarButtonItems = [doneButton!]
    }
    
    func setBody() {
        view.backgroundColor = UIColor.systemGray6
        
        let textField = UITextField()
        textField.frame = CGRect(x: 0, y: 150, width: UIScreen.main.bounds.size.width, height: 56)
        textField.text = todo!.title
        textField.placeholder = "Input Title"
        textField.backgroundColor = .white
        textField.keyboardType = .default
        textField.returnKeyType = .done
        textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        self.view.addSubview(textField)
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        self.todo?.title = textField.text ?? ""
    }
    
    @objc func onTapCancel() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func onTapDone() {
        if (isEditForm) {
            list![indexPath!.section][indexPath!.row] = todo!
        } else {
            list![1].append(todo!)
        }
        let controller = navigationController!.viewControllers[0] as! ViewController
        controller.list = list!
        navigationController?.popViewController(animated: true)
    }

}
