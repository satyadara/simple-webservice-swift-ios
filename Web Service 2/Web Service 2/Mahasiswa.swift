//
//  Mahasiswa.swift
//  Web Service 2
//
//  Created by Satya Syahputra on 9/22/17.
//  Copyright © 2017 satyadara. All rights reserved.
//

import UIKit

class Mahasiswa: NSObject {
    let npm: String
    let nama: String
    let jurusan: String
    let fakultas: String
    
    init(json: [String: Any])  {
        self.npm = json["npm"] as? String ?? ""
        self.nama = json["nama"] as? String ?? ""
        self.jurusan = json["jurusan"] as? String ?? ""
        self.fakultas = json["fakultas"] as? String ?? ""
    }
    
    func printdata()    {
        print("npm : ", self.npm, "nama : ", self.nama, "jurusan : ", self.jurusan, "fakulas : ", self.fakultas)
    }
}
