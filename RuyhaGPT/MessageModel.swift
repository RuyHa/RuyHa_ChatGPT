//
//  MessageModel.swift
//  RuyhaGPT
//
//  Created by Ruyha on 2023/01/10.
//

import Foundation

struct Message: Identifiable, Codable {
    var id: UUID
    var text: String
    var received: Bool
}
 
