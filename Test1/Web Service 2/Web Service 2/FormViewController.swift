//
//  FormViewController.swift
//  Web Service 2
//
//  Created by Satya Syahputra on 9/29/17.
//  Copyright © 2017 satyadara. All rights reserved.
//

import UIKit

class FormViewController: UIViewController {

    @IBOutlet weak var npmText: UITextField!
    @IBOutlet weak var namaText: UITextField!
    @IBOutlet weak var jurusanText: UITextField!
    @IBOutlet weak var fakultasText: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func doPost(_ sender: Any) {
        
        let NPM = Int(self.npmText.text!) ?? -1
        let NAMA = self.namaText.text!
        let JURUSAN = self.jurusanText.text!
        let FAKULTAS = self.jurusanText.text!
        
        postMahasiswa(npm: NPM,
                      nama: NAMA,
                      jurusan: JURUSAN,
                      fakultas: FAKULTAS)
        
        self.navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
    }
    
    
    fileprivate func postMahasiswa(npm: Int, nama: String, jurusan: String, fakultas: String)    {
        let parameters: [String : Any] = ["npm" : npm, "nama" : nama, "jurusan" : jurusan, "fakultas": fakultas]
        
        guard let url = URL(string: "https://satyadara.com/api/mahasiswa/create") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else { return }
        request.httpBody = httpBody
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, err) in
            if let response = response  {
                print(response)
            }
            if let data = data {
                do  {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                }catch {
                    print(error)
                }
            }
            }.resume()
    }
    
}
