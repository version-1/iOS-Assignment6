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

    override func viewDidLoad() {
        super.viewDidLoad()
        setHeader()
        setBody()
    }
    
    func setHeader() {
        if self.todo != nil {
          navigationItem.title = "Edit Todo Item"
        } else {
          navigationItem.title = "Add Todo Item"
          self.todo = Todo()
        }
        
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(onTapCancel))
        navigationItem.leftBarButtonItem = cancelButton
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(onTapDone))
        navigationItem.rightBarButtonItems = [doneButton]
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
        navigationController?.popViewController(animated: true)
    }

}
