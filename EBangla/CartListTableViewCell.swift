//
//  CartListTableViewCell.swift
//  EBangla
//
//  Created by Sunny Chowdhury on 1/7/19.
//  Copyright © 2019 Sunny Chowdhury. All rights reserved.
//

import UIKit


class CartListTableViewCell: UITableViewCell {

    
    @IBOutlet weak var IsSelectedImageView: UIImageView!
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var noOfItemLbl: UILabel!
    @IBOutlet weak var subtractButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    
    var counter : Int = 1
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func IncreaseItem(_ sender: Any) {
        
        print("Increase Item")
        counter += 1
        noOfItemLbl.text = String(counter)
    }
    
    @IBAction func decreaseItem(_ sender: Any) {
        
        print("Increase Item")
        counter -= 1
        if counter < 1 {
            noOfItemLbl.text = "1"

        } else {
            noOfItemLbl.text = String(counter)
        }
        
    }
    
    
}
