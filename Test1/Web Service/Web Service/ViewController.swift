//
//  ViewController.swift
//  Web Service
//
//  Created by Satya Syahputra on 9/8/17.
//  Copyright © 2017 satyadara. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let urlString = URL(string: "https://api.adorable.io/avatars/list")
        
        if let url = urlString {
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print("Error")
                } else {
                    if let usableData = data {
                        do  {
                            let myjson = try JSONSerialization.jsonObject(with: usableData, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                            print(myjson)
                            /* PENGAMBILAN SUB
                            if let face = myjson["face"] as AnyObject?  {
                                
                                if let mouth = face["mouth"] as! NSArray?    {
                                    for i in 0..<3  {
                                        print(mouth[i])
                                    }
                                }
                            } */
                        }
                        catch   {
                            
                        }
                    }
                }
            }
            task.resume()
        }
    }

}

