//
//  ViewController.swift
//  Web Service Swift4
//
//  Created by Satya Syahputra on 9/25/17.
//  Copyright © 2017 satyadara. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let mahasiswa = [Mahasiswa]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        guard let url = URL(string: "https://satyadara.com/api/mahasiswa") else { return }
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            do  {
                guard let data = data else { return }
                
                do {
                    let res = try JSONDecoder().decode(MyResponse.self, from: data)
                    print(res)
                }catch  {
                    
                }
            }
        }.resume()
        
    }
    
    
}

