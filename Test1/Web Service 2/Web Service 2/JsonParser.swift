//
//  JsonParser.swift
//  Web Service 2
//
//  Created by Satya Syahputra on 9/22/17.
//  Copyright © 2017 satyadara. All rights reserved.
//

import UIKit

class JsonParser: NSObject {

    func getJson(urlString: String)  {
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with: url!) { (data, response, err) in
            if err != nil{
                print("error", err ?? "")
            } else {
                if let useable = data {
                    do {
                        let jsonObject = try JSONSerialization.jsonObject(with: useable, options: .mutableContainers) as AnyObject
                        //print(jsonObject)
                        
                        if let mahasiswa = jsonObject["mahasiswa"] as! [AnyObject]?{
                            for mhs in mahasiswa {
                                let m = Mahasiswa(json: mhs as! [String: Any])
                                self.mahasiswa.append(m)
                            }
                            
                            for mhs in self.mahasiswa {
                                mhs.printdata()
                            }
                            
                            //REALOAD TABLE
                            DispatchQueue.main.async(execute: {
                                self.tableView.reloadData()
                            })
                        }
                        
                    }
                    catch {
                        print("error catch")
                    }
                }
            }
            }.resume()
        
        
    }

}
