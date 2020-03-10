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
    override func layoutSubviews() {
        super.layoutSubviews()
        outcomeMessageView.layer.cornerRadius = outcomeMessageView.frame.height * 0.2
        //print("Исходящая в layout - \(outcomeMessageView.frame.width * 0.04)")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        //outcomeMessageView.layer.cornerRadius = outcomeMessageView.frame.width * 0.04
        //print("Исходящая в prepare - \(outcomeMessageView.frame.width * 0.04)")
    }
    
    func configure(with model: OutcomeMessageCell.ConfigurationModel) {
        outcomeMessageLabel.text = model.text
    }
    
}
