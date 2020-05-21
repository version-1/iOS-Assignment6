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
          view.backgroundColor = UIColor.white
          label.text = "Hello World"
          label.textAlignment = .center
          view.addSubview(label)
      }

      override func viewDidLayoutSubviews() {
          super.viewDidLayoutSubviews()
          label.frame = view.bounds
      }
}

