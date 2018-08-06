//
//  PlantTableViewCell.swift
//  Plants
//
//  Created by viplab on 2018/8/6.
//  Copyright © 2018年 viplab. All rights reserved.
//

import UIKit

class PlantTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var plantImageView: UIImageView!{
        didSet{
            plantImageView.layer.cornerRadius = plantImageView.bounds.width/2
            plantImageView.clipsToBounds = true
        }
    }
    @IBOutlet var descriptionLabel: UILabel!

}
