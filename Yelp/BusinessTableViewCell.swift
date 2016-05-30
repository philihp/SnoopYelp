//
//  BusinessTableViewCell.swift
//  Yelp
//
//  Created by Philihp Busby on 2016-05-26.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import UIKit

class BusinessTableViewCell: UITableViewCell {
   
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var starsImage: UIImageView!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var tagsLabel: UILabel!
    @IBOutlet weak var reviewsLabel: UILabel!
    
    var data: Business! {
        didSet {
            self.titleLabel.text = data.name
            self.addressLabel.text = data.address
            self.tagsLabel.text = data.categories
            self.reviewsLabel.text = "\(data.reviewCount ?? 0) Reviews"
            self.distanceLabel.text = data.distance
            if let imageURL = data.imageURL {
                self.avatarImage.setImageWithURL(imageURL)
            }
            if let ratingImageURL = data.ratingImageURL {
                self.starsImage.setImageWithURL(ratingImageURL)
            }
        }
    }


    override func awakeFromNib() {
        super.awakeFromNib()
        avatarImage.layer.cornerRadius = 5
        avatarImage.clipsToBounds = true
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
