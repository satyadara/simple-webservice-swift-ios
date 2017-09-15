//
//  ViewController.swift
//  Web Service
//
//  Created by Satya Syahputra on 9/8/17.
//  Copyright © 2017 satyadara. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let JSON_URL:String = "https://satyadara.com/api/mahasiswa"
    var mhs_list = [Mahasiswa]()
    
    @IBOutlet weak var npm: UILabel!
    @IBOutlet weak var nama: UILabel!
    @IBOutlet weak var jurusan: UILabel!
    @IBOutlet weak var fakultas: UILabel!
    
    var strNpm = String()
    var strNama = String()
    var strJurusan = String()
    var strFakultas = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        JsonParser(urlString: JSON_URL)
        
    }
    
    fileprivate func JsonParser(urlString: String)    {
        
        let url = URL(string: urlString)
        
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error != nil {
                print("Error ", error ?? "" )
            } else {
                if let usableData = data {
                    do  {
                        let myJson = try JSONSerialization.jsonObject(with: usableData, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                    
                        if let mhs = myJson["mahasiswa"] as! [AnyObject]? {
                            for m in mhs    {
                                let data = Mahasiswa(json: m as! [String : Any])
                                
                                self.mhs_list.append(data)
                            }
                            
                            for m in self.mhs_list   {
                                print(m.npm, " ", m.nama, " ", m.jurusan, " ", m.fakultas)
                            }
                        }
                        //print(myjson)
                        
                        // PENGAMBILAN SUB
//                        if let face = myjson["face"] as AnyObject?  {
//                            if let mouth = face["mouth"] as! NSArray?    {
//                                let mo = mouth as? [String]
//                                var mm = [String]()
//                                for m in mo!     {
//                                    mm.append(m)
//                                }
//                                
//                                for m in mm {
//                                    print(m)
//                                }
//                            }
//                        }
                        
                    }
                    catch   {
                        
                    }
                }
            }
        }
        task.resume()
        
        
    }
    
}

