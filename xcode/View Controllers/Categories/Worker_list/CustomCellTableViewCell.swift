//
//  CustomCellTableViewCell.swift
//  FinalProject
//
//  Created by Luis Javier Canto Hurtado on 26/04/21.
//

import UIKit

class CustomCellTableViewCell: UITableViewCell {

    @IBOutlet weak var employerLabel: UILabel!
    @IBOutlet weak var employerImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
