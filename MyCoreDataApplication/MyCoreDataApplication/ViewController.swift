//
//  ViewController.swift
//  MyCoreDataApplication
//
//  Created by etudiant on 16/11/2016.
//  Copyright © 2016 etudiant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if let context = DataManager.shared.objectContext {
            print(context)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

