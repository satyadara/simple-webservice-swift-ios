//
//  Mahasiswa.swift
//  Web Service
//
//  Created by Satya Syahputra on 9/15/17.
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
}
