//
//  messageCell.swift
//  TFS-Chat
//
//  Created by a.kramerov on 09.03.2020.
//  Copyright © 2020 a.kramerov. All rights reserved.
//

import UIKit

class IncomeMessageCell: UITableViewCell, ConfigurableView {
    
    @IBOutlet var incomeMessageView: UIView!
    @IBOutlet var incomeMessageLabel: UILabel!
    
    typealias ConfigurationModel = MessageCellModel
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func configure(with model: IncomeMessageCell.ConfigurationModel) {
        incomeMessageLabel.text = model.text
    }
    
}
