//
//  ViewController.swift
//  Lifecycle Logger
//
//  Created by a.kramerov on 14.02.2020.
//  Copyright © 2020 a.kramerov. All rights reserved.
//

import UIKit

class ConversationsListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, imageDataDelegate {

    @IBOutlet var conversationsTable: UITableView!
    
    let myView = UIView(frame: CGRect(x: 0, y: 0, width: 40,height: 40))
    let button = UIButton(frame: CGRect.init(x: 0, y: 0, width: 40, height: 40))
    var messagesArray: [ConversatonCellModel] = [ConversatonCellModel(name: "Алексей Крамеров", message: "Твоя мама - это чудо!", date: Date.init(timeIntervalSince1970: 123456), isOnline: true, hasUnreadMessage: true), ConversatonCellModel(name: "Владислав Киреев", message: "Рэп - это жизнь!", date: Date.init(timeIntervalSince1970: 1234567), isOnline: false, hasUnreadMessage: false), ConversatonCellModel(name: "Стас Клецкий", message: "Беларусь - это родина!", date: Date.init(timeIntervalSince1970: 1583319600), isOnline: false, hasUnreadMessage: false), ConversatonCellModel(name: "Конрад Снежана", message: "Орда - это навсегда!", date: Date.init(timeIntervalSince1970: 1583265600), isOnline: true, hasUnreadMessage: false), ConversatonCellModel(name: "Илья Кондратов", message: "Кореана - это страсть!", date: Date.init(timeIntervalSince1970: 1583265600), isOnline: true, hasUnreadMessage: true), ConversatonCellModel(name: "Игорь Василенко", message: nil, date: Date.init(timeIntervalSince1970: 1583265600), isOnline: true, hasUnreadMessage: false)]

        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.title = "Tinkoff Chat"
        let image = UIImage(named: "placeholder-user")
        button.setImage(image, for: .normal)
        myView.addSubview(button)
        button.clipsToBounds = true
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.black.cgColor
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: myView)
        let nib = UINib(nibName: "ConversationCellView", bundle: nil)
        conversationsTable.register(nib, forCellReuseIdentifier: "ConversationCellId")
        conversationsTable.delegate = self
        conversationsTable.dataSource = self
        conversationsTable.tableFooterView = UIView()
        if let image = getSavedImage(named: "profilePicture") {
//            profileButton.setImage(image, for: .normal)
            button.setImage(image, for: .normal)
        }
        
    }
    
    override func viewDidLayoutSubviews() {
//        profileButton.layer.cornerRadius =  profileButton.frame.width / 2
    }
    
    func getSavedImage(named: String) -> UIImage? {
        if let dir = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) {
            return UIImage(contentsOfFile: URL(fileURLWithPath: dir.absoluteString).appendingPathComponent(named).path)
        }
        return nil
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ProfileViewController {
            destination.delegate = self
        }
    }
    
    @objc func buttonAction (sender: UIButton) {
        performSegue(withIdentifier: "ProfileSeguey", sender: self)
    }
    
    func passImage(image: UIImage) {
        self.button.setImage(image, for: .normal)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Online"
        case 1:
            return "History"
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return messagesArray.map{$0.isOnline}.filter{$0 == true}.count
        } else {
            return messagesArray.map{$0.isOnline}.filter{$0 == false}.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ConversationCellId", for: indexPath) as! ConversationCell
            cell.configure(with: messagesArray.filter{$0.isOnline == true}[indexPath.row])
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ConversationCellId", for: indexPath) as! ConversationCell
            cell.configure(with: messagesArray.filter{$0.isOnline == false}[indexPath.row])
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        guard let conversationViewController = storyBoard.instantiateViewController(withIdentifier: "conversation") as? ConversatonViewController else {
            return print("error")
        }
        self.navigationController?.pushViewController(conversationViewController, animated: true)
        
        let cell = tableView.cellForRow(at: indexPath) as! ConversationCell
        cell.isSelected = false
        conversationViewController.navigationItem.title = cell.nameLabel.text
    }
}

