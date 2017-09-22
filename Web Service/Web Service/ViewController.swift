//
//  ViewController.swift
//  Web Service
//
//  Created by Satya Syahputra on 9/8/17.
//  Copyright © 2017 satyadara. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let JSON_URL:String = "https://satyadara.com/api/mahasiswa"
    var mhs_list = [Mahasiswa]()
    @IBOutlet weak var cellLabel: UILabel!
    
    var strNpm = String()
    var strNama = String()
    var strJurusan = String()
    var strFakultas = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        JsonParser(urlString: JSON_URL)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mhs_list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "cell")
        cell.textLabel?.text = mhs_list[indexPath.row].npm
        
        return cell
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
                            //from json to Data Object
                            for m in mhs    {
                                let data = Mahasiswa(json: m as! [String : Any])
                                
                                self.mhs_list.append(data)
                            }
                            
                            //print Data Object
                            for m in self.mhs_list   {
                                print(m.npm, " ", m.nama, " ", m.jurusan, " ", m.fakultas)
                            }
                        }
                    }
                    catch   {
                        print("catch error")
                    }
                }
            }
        }
        task.resume()
        
        
    }
    
}

