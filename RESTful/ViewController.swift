//
//  ViewController.swift
//  RESTful
//
//  Created by Decagon on 01/08/2021.
//

import UIKit

let domainUrl = "https://www.orangevalleycaa.org/api"


class Music: Codable {
    
    var changedId: String?
    var music_url: String?
    var name: String?
    var description: String?
    
    enum  CodingKeys: String, CodingKey {
        case changedId = "id"
        case music_url, name, description
    }
    
    static func fetch(withid id: Int) {
        let urlString = domainUrl + "/music/id/\(id)"
        
        if let url = URL.init(string: urlString) {
            let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
//                print(String.init(data: data!, encoding: .ascii) ?? "No data")
                if let newMusic = try? JSONDecoder().decode(Music.self, from: data!) {
                    print(newMusic.changedId ?? "no id")
                    print(newMusic.description ?? "description not found")
                }
            }
            dataTask.resume()
        }
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        Music.fetch(withid: 1)
    }

}

