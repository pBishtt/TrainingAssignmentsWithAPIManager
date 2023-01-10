//
//  NewsCellTableViewCell.swift
//  TestProjectWithNetwrokLayer
//
//  Created by BKS-GGS on 10/01/23.
//

import UIKit

class NewsCellTableViewCell: UITableViewCell {
    @IBOutlet weak var lblTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCellData(hit: Hits) {
        var titleString = ""
        if let title = hit.title {
            titleString = title
        }
        titleString += " - "
        titleString += "\(hit.points)" as String
        self.lblTitle.text = titleString
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
