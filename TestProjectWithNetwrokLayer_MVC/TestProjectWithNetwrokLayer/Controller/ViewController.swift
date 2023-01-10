//
//  ViewController.swift
//  TestProjectWithNetwrokLayer
//
//  Created by BKS-GGS on 10/01/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var newsTableView: UITableView!
    
    var hitsArray : [Hits] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        APIManager().getNewsFrom(url: SERVER.NewsURL.rawValue) { response in
            if let hitsArray = response {
                self.hitsArray = hitsArray.hits ?? []
                DispatchQueue.main.async {
                    self.newsTableView.reloadData()
                }
            }
        }
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.hitsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell") as? NewsCellTableViewCell
        cell?.configureCellData(hit: self.hitsArray[indexPath.row])
        return cell!
    }
}

