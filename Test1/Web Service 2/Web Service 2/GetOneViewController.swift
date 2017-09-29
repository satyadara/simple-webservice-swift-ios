//
//  GetOneViewController.swift
//  Web Service 2
//
//  Created by Satya Syahputra on 9/22/17.
//  Copyright © 2017 satyadara. All rights reserved.
//

import UIKit

class GetOneViewController: UIViewController {
    
    @IBOutlet weak var fakultasLabel: UILabel!
    @IBOutlet weak var jurusanLabel: UILabel!
    @IBOutlet weak var namaLabel: UILabel!
    @IBOutlet weak var npmLabel: UILabel!
    
    @IBOutlet weak var cariText: UITextField!
    var mahasiswa:Mahasiswa? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    fileprivate func getJson(urlString: String)  {
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with: url!) { (data, response, err) in
            if err != nil{
                print("error", err ?? "")
            } else {
                if let useable = data {
                    do {
                        let jsonObject = try JSONSerialization.jsonObject(with: useable, options: .mutableContainers) as AnyObject
                        
                        if let mhs = jsonObject["mahasiswa"] as! [AnyObject]? {
                            if !(mhs.isEmpty) {
                                print(mhs)
                                self.mahasiswa = Mahasiswa(json: mhs[0] as! [String: Any])
                                self.mahasiswa?.printdata()
                                //SET LABEL PADA TAMPILAN
                                self.setMahasiswa()
                            }
                            else{
                                print("nil")
                            }
                        }
                        
                    }
                    catch {
                        print("error catch")
                    }
                }
            }
            }.resume()
    }
    
    @IBAction func cariClicked(_ sender: Any) {
        getJson(urlString: "https://satyadara.com/api/mahasiswax/" + cariText.text!)
    }
    
    fileprivate func setMahasiswa()  {
        DispatchQueue.main.async(execute: {
            self.npmLabel.text = self.mahasiswa?.npm
            self.namaLabel.text = self.mahasiswa?.nama
            self.fakultasLabel.text = self.mahasiswa?.fakultas
            self.jurusanLabel.text = self.mahasiswa?.jurusan
        })
    }
}
