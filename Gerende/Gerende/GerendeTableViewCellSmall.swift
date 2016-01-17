//
//  GerendeTableViewCellSmall.swift
//  Gerende
//
//  Created by 堀 正洋 on 2016/01/16.
//  Copyright © 2016年 masahiro_hori. All rights reserved.
//

import UIKit

class GerendeTableViewCellSmall: UITableViewCell {

    @IBOutlet weak var gerendeImageViewSmall: UIImageView!
    @IBOutlet weak var gerendeTextLavelSmall: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
