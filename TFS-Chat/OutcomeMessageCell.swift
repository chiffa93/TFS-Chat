//
//  OutcomeMessageCell.swift
//  TFS-Chat
//
//  Created by a.kramerov on 09.03.2020.
//  Copyright © 2020 a.kramerov. All rights reserved.
//

import UIKit

class OutcomeMessageCell: UITableViewCell, ConfigurableView {
    
    @IBOutlet var outcomeMessageLabel: UILabel!
    @IBOutlet var outcomeMessageView: UIView!
    
    typealias ConfigurationModel = MessageCellModel

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(with model: OutcomeMessageCell.ConfigurationModel) {
        outcomeMessageLabel.text = model.text
    }
    
}
