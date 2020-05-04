//
//  SecondViewController.swift
//  PassDataClosure
//
//  Created by Taof on 4/28/20.
//  Copyright © 2020 taoquynh. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var hiLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var PhoneTextField: UITextField!
    
    var hiText: String?
    
    // bước 1: tạo closure
    var passData: ((User) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Screen2"
        
        if let text = hiText {
            hiLabel.text = text
        }
        
        let backButton = UIBarButtonItem(title: "Back", style: .done, target: self, action: #selector(back))
        self.navigationItem.leftBarButtonItem = backButton
    }
    
    @objc func back(){
        guard let name = nameTextField.text,
            let phone = PhoneTextField.text else {
            return
        }
        
        // bước 2: truyền dữ liệu
        passData?(User(name: name, phone: phone))
        self.navigationController?.popViewController(animated: true)
    }
}
