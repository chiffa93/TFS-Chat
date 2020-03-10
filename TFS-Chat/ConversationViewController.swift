//
//  ConversationViewController.swift
//  TFS-Chat
//
//  Created by a.kramerov on 09.03.2020.
//  Copyright © 2020 a.kramerov. All rights reserved.
//

import Foundation
import UIKit

class ConversatonViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var messagesTable: UITableView!
    enum senderState {
        case income
        case outcome
    }
    var messageArray: [(state: senderState, message: MessageCellModel)] = [(.income, MessageCellModel(text: "Привет")), (.outcome, MessageCellModel(text: "Как дела?")), (.income, MessageCellModel(text: "Нормально")), (.outcome, MessageCellModel(text: "Что делаешь?")), (.income, MessageCellModel(text: "Ничего")), (.outcome, MessageCellModel(text: "Ух, бля, а вот это реально большое сообщение, чтобы я мог всечь в то как обрабатывается текст в ячейке")), (.income, MessageCellModel(text: "Ну что я могу сказать, это рили заебись сообщение.")), (.income, MessageCellModel(text: "Да если бы я был Игоряном, я бы вообще подумал что это реальный чат")), (.outcome, MessageCellModel(text: "Это да\nОн никогда не отличался особым умом")), (.income, MessageCellModel(text: "Привет")), (.income, MessageCellModel(text: "Привет")), (.income, MessageCellModel(text: "Привет")), (.income, MessageCellModel(text: "Привет")), (.income, MessageCellModel(text: "Привет")), (.income, MessageCellModel(text: "Привет")), (.income, MessageCellModel(text: "Привет")), (.income, MessageCellModel(text: "Привет")), (.income, MessageCellModel(text: "Привет")), (.income, MessageCellModel(text: "Привет")), (.income, MessageCellModel(text: "Привет")), (.income, MessageCellModel(text: "Привет")), (.income, MessageCellModel(text: "Привет")), (.income, MessageCellModel(text: "Привет")), (.income, MessageCellModel(text: "Привет")), (.income, MessageCellModel(text: "Привет")), (.income, MessageCellModel(text: "Привет")), (.income, MessageCellModel(text: "Привет")), (.income, MessageCellModel(text: "Привет")), (.outcome, MessageCellModel(text: "Привет")), (.outcome, MessageCellModel(text: "Привет")), (.outcome, MessageCellModel(text: "Привет")), (.outcome, MessageCellModel(text: "Привет")), (.outcome, MessageCellModel(text: "Привет")), (.outcome, MessageCellModel(text: "Привет")), (.outcome, MessageCellModel(text: "Привет")), (.outcome, MessageCellModel(text: "Привет")), (.outcome, MessageCellModel(text: "Привет")), (.outcome, MessageCellModel(text: "Привет")), (.outcome, MessageCellModel(text: "Привет")), (.outcome, MessageCellModel(text: "Привет")), (.outcome, MessageCellModel(text: "Привет")), (.outcome, MessageCellModel(text: "Привет")), (.outcome, MessageCellModel(text: "Привет")), (.outcome, MessageCellModel(text: "Привет")), (.outcome, MessageCellModel(text: "Привет")), (.outcome, MessageCellModel(text: "Привет")), (.outcome, MessageCellModel(text: "Привет"))]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messagesTable.delegate = self
        messagesTable.dataSource = self
        let incomeCellNib = UINib(nibName: "IncomeMessageCellView", bundle: nil)
        messagesTable.register(incomeCellNib, forCellReuseIdentifier: "incomeMessageCellId")
        let outcomeCellNib = UINib(nibName: "OutcomeMessageCellView", bundle: nil)
        messagesTable.register(outcomeCellNib, forCellReuseIdentifier: "outcomeMessageCellId")
        messagesTable.transform = CGAffineTransform(scaleX: 1, y: -1)
        let view = UIView()
        messagesTable.tableFooterView = view
        messagesTable.separatorColor = UIColor.white
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reversedMessagesArray = Array(messageArray.reversed())
        switch reversedMessagesArray[indexPath.row].state {
        case .income:
            let cell = messagesTable.dequeueReusableCell(withIdentifier: "incomeMessageCellId", for: indexPath) as! IncomeMessageCell
            cell.transform = CGAffineTransform(scaleX: 1, y: -1)
            cell.configure(with: reversedMessagesArray[indexPath.row].message)
            cell.incomeMessageView.layer.cornerRadius = 10
            cell.isUserInteractionEnabled = false
            return cell
        case .outcome:
            let cell = messagesTable.dequeueReusableCell(withIdentifier: "outcomeMessageCellId", for: indexPath) as! OutcomeMessageCell
            cell.transform = CGAffineTransform(scaleX: 1, y: -1)
            cell.configure(with: reversedMessagesArray[indexPath.row].message)
            cell.outcomeMessageView.layer.cornerRadius = 10
            cell.isUserInteractionEnabled = false
            return cell
        }
    }
}
    
    

