//
//  PostCell.swift
//  
//
//  Created by Sravya Balasa on 5/1/21.
//

import UIKit

class PostCell: UITableViewCell {
    @IBOutlet var photoView: UIImageView!
    @IBOutlet var captionLabel: UILabel!
    @IBOutlet var usernameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
