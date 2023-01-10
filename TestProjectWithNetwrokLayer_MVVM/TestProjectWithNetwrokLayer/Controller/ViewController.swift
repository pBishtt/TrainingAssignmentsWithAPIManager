//
//  ViewController.swift
//  TestProjectWithNetwrokLayer
//
//  Created by BKS-GGS on 10/01/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var newsTableView: UITableView!
    let newsVM = NewViewVM()
    var hitsArray : [Hits] = []
    
    fileprivate func updateTable() {
        DispatchQueue.main.async {
            self.newsTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.newsVM.fetchNews { hitsArray in
            if let hits = hitsArray {
                self.hitsArray = hits
                self.updateTable()
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

