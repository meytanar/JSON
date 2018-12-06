//
//  ViewController.swift
//  JSON
//
//  Created by BSH_MRM on 5.12.2018.
//  Copyright © 2018 BSH_MRM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = "https://jsonplaceholder.typicode.com/todos/1"
        
        if let url = URL(string: url){
            let request = URLRequest(url: url)
           
            URLSession.shared.dataTask(with: request){ (data, response, err) in
                let Json = JSONDecoder()
                do {
                    let newJson = try Json.decode(JSONDataText.self, from: data!)
                    DispatchQueue.main.sync {
                        print(newJson.title)
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }.resume()
        }
    }


}

