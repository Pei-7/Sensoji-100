//
//  ExplainTableViewCell.swift
//  Sensoji
//
//  Created by 陳佩琪 on 2023/8/19.
//

import UIKit

class ExplainTableViewCell: UITableViewCell {
    
    @IBOutlet var explainTextView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
