//
//  TableViewController.swift
//  Web Service 2
//
//  Created by Satya Syahputra on 9/22/17.
//  Copyright © 2017 satyadara. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    let URL_JSON = "https://satyadara.com/api/mahasiswa/"
    var mahasiswa = [Mahasiswa]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getJson(urlString: URL_JSON)
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
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return mahasiswa.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mycell", for: indexPath)
        
        cell.textLabel?.text = mahasiswa[indexPath.row].npm
        
        return cell
    }
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
