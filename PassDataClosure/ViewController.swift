//
//  ViewController.swift
//  PassDataClosure
//
//  Created by Taof on 4/28/20.
//  Copyright © 2020 taoquynh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addAction))
        self.navigationItem.rightBarButtonItem = addButton
        
        title = "Home"
        myTextView.isEditable = false // để khoá không cho edit dữ liệu của TextView
    }
    
    @objc func addAction(){
        let secondVC = SecondViewController()
        secondVC.hiText = "Chào bạn"
        
        // bước 3: hứng dữ liệu
        secondVC.passData = { [weak self] data in
            guard let strongSelf = self else { return }
            strongSelf.myTextView.text += """
            -----
            \(data.name),
            \(data.phone)
            \n
            """
        }
        
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
    
    
}

