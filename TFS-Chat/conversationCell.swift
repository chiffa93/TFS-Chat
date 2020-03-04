//
//  ConversationCell.swift
//  TFS-Chat
//
//  Created by a.kramerov on 03.03.2020.
//  Copyright © 2020 a.kramerov. All rights reserved.
//

import Foundation
import UIKit

protocol ConfigurableView {
    associatedtype ConfigurationModel
    func configure(with model: ConfigurationModel)
}

class ConversationCell: UITableViewCell, ConfigurableView {
    typealias ConfigurationModel = ConversatonCellModel
    
    @IBOutlet var senderPicture: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var messageLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        senderPicture.layer.borderColor = UIColor.black.cgColor
        senderPicture.layer.borderWidth = 0.5
        senderPicture.layer.cornerRadius = contentView.frame.width * 0.1
    }
    
    func configure(with model: ConversationCell.ConfigurationModel) {
        nameLabel.text = model.name
        messageLabel.text = model.message
        let dateFormatter = DateFormatter()
        switch Calendar.current.component(.day, from: model.date)  {
        case Calendar.current.component(.day, from: Date()):
            dateFormatter.dateFormat = "HH:mm"
        default:
            dateFormatter.dateFormat = "dd MMM"
        }
        let dateString = dateFormatter.string(from: model.date)
        dateLabel.text = dateString
        model.isOnline ? contentView.backgroundColor = UIColor.init(red: 255.0/255.0, green: 254.0/255.0, blue: 161.0/255.0, alpha: 1) : ()
        model.hasUnreadMessage ? messageLabel.font = UIFont.boldSystemFont(ofSize: 17.0) : ()
        model.message == nil ? messageLabel.text = "No messages yet" : ()
        model.message == nil ? messageLabel.font = UIFont.italicSystemFont(ofSize: 17.0) : ()
    }
}
