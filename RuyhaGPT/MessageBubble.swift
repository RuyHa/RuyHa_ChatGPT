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
                    .padding()
                    .background(message.received ? Color("gptChatColor") : Color("myChatColor"))
                    .cornerRadius(30)
            }
            .frame(maxWidth: .infinity, alignment: message.received ? .leading : .trailing)
        }
        .frame(maxWidth: .infinity, alignment: message.received ? .leading : .trailing)
        .padding(message.received ? .leading : .trailing)
    }
}
//
//struct MessageBubble_Previews: PreviewProvider {
//    static var previews: some View {
//        MessageBubble(message: Message(id: "1", text: "안녕하세요 새벽에 코딩하느라 정싱줄을 놓고 있는 휴면입니다.", received: true))
//    }
//} 
