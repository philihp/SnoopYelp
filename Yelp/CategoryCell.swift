//
//  CategoryCell.swift
//  Yelp
//
//  Created by Philihp Busby on 2016-05-29.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import UIKit

class CategoryCell: UITableViewCell {

    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var valueSwitch: UISwitch!
    var code: String?
    let defaults = NSUserDefaults.standardUserDefaults()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func valueChanged(sender: AnyObject) {
        let value = valueSwitch.on
        defaults.setBool(value, forKey: "snoop.yelp.categories.\(code)")
        defaults.synchronize()
    }
}
