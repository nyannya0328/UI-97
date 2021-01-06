//
//  CardModel.swift
//  UI-97
//
//  Created by にゃんにゃん丸 on 2021/01/06.
//

import SwiftUI
import RealmSwift

class Card: Object,Identifiable {
    
    @objc dynamic var id : Date = Date()
    @objc dynamic var title = ""
    @objc dynamic var detail = ""
}


