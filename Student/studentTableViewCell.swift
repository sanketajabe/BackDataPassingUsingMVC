//
//  studentTableViewCell.swift
//  Student
//
//  Created by Apple on 08/11/22.
//

import UIKit

class studentTableViewCell: UITableViewCell {

    @IBOutlet var studentRollNoLabel: UILabel!
    
    @IBOutlet var studentFirstNameLabel: UILabel!
    
    @IBOutlet var studentLastNameLabel: UILabel!
    
    @IBOutlet var studentPercentage: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }
    
}
