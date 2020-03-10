//
//  CellModels.swift
//  TFS-Chat
//
//  Created by a.kramerov on 03.03.2020.
//  Copyright © 2020 a.kramerov. All rights reserved.
//

import Foundation

struct ConversatonCellModel {
    let name: String
    let message: String?
    let date: Date
    let isOnline: Bool
    let hasUnreadMessage: Bool
}
struct MessageCellModel {
    let text: String
}
