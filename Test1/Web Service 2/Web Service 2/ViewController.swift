//
//  ViewController.swift
//  Web Service 2
//
//  Created by Satya Syahputra on 9/22/17.
//  Copyright © 2017 satyadara. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func GET(_ sender: Any) {
        performSegue(withIdentifier: "getMahasiswaList", sender: (Any).self)
    }
    @IBAction func GETONE(_ sender: Any) {
        performSegue(withIdentifier: "getMahasiswa", sender: (Any).self)
    }
    
}

