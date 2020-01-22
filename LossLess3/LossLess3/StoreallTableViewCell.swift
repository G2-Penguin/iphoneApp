//
//  StoreallTableViewCell.swift
//  LossLess3
//
//  Created by 森大樹 on 2020/01/22.
//  Copyright © 2020 LossLess. All rights reserved.
//

import UIKit

class StoreallTableViewCell: UITableViewCell {
    
    @IBOutlet weak var label: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func bindData(text: String) {
        label.text = text
    }
    
}
