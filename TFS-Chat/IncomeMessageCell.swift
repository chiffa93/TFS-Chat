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
    override func layoutSubviews() {
        super.layoutSubviews()
        incomeMessageView.layer.cornerRadius = incomeMessageView.frame.height * 0.2
//        print("Входящая в layout - \(incomeMessageView.frame.width * 0.04)")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
//        incomeMessageView.layer.cornerRadius = incomeMessageView.frame.width * 0.04
//        print("Входящая в prepare - \(incomeMessageView.frame.width * 0.04)")
    }
    
    func configure(with model: IncomeMessageCell.ConfigurationModel) {
        incomeMessageLabel.text = model.text
    }
    
}
