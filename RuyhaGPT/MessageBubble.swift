//
//  MessageBubble.swift
//  RuyhaGPT
//
//  Created by Ruyha on 2023/01/10.
//

import SwiftUI

struct MessageBubble: View {
    var message : Message
    
    var body: some View {
        VStack(alignment: message.received ? .leading : .trailing){
            HStack{
                Text(message.text)
                    .textSelection(.enabled)
                    .padding()
                    .background(message.received ? Color("gptChatColor") : Color("myChatColor"))
                    .cornerRadius(30)
            }
            .frame(maxWidth: .infinity, alignment: message.received ? .leading : .trailing)
        }
        .frame(maxWidth: .infinity, alignment: message.received ? .leading : .trailing)
        .padding(message.received ? .trailing : .leading)
    }
    
}
