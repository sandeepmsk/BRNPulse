//
//  ProfileTableViewCell.swift
//  BRNPulse
//
//  Created by Sandeep on 1/26/18.
//  Copyright © 2018 BRN. All rights reserved.
//

import UIKit

class ProfileTableViewCell: UITableViewCell
{
    @IBOutlet weak var profilePicImgView: UIImageView!
    @IBOutlet weak var studetnNameLbl: UILabel!
    @IBOutlet weak var batchIDLbl: UILabel!
    @IBOutlet weak var studentIDLbl: UILabel!
    
    
    
    
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
