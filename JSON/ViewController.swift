//
//  ViewController.swift
//  JSON
//
//  Created by BSH_MRM on 5.12.2018.
//  Copyright © 2018 BSH_MRM. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var titleDizi = [String]();
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = "https://jsonplaceholder.typicode.com/todos"
        
        if let url = URL(string: url){
            let request = URLRequest(url: url)
           
            URLSession.shared.dataTask(with: request){ (data, response, err) in
                
                do {
                    let newJson = try JSONDecoder().decode([JSONDataText].self, from: data!)
                 
                    for post in newJson {
                            DispatchQueue.main.sync {
                                self.titleDizi.append(post.title)
                                
                            }
                        self.tableView.reloadData()
                    }
                } catch {
                }
            }.resume()
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleDizi.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = titleDizi[indexPath.row]
        return cell
    }
}

