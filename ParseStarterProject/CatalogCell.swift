//
//  CatalogCell.swift
//  ParseStarterProject
//
//  Created by PekkiPo (Aleksei Petukhov) on 19/10/15.
//  Copyright (c) 2015 Parse. All rights reserved.
//

import UIKit

class CatalogCell: UITableViewCell {

    
    @IBOutlet weak var catalogcategoryimage: UIImageView!
    
    @IBOutlet weak var categoryname: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
