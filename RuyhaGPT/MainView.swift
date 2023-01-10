//
//  MainView.swift
//  RuyhaGPT
//
//  Created by Ruyha on 2023/01/10.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var mainViewModel = MainViewModel()
    @State var text = ""
    @State var model = [Message]()
    
    var body: some View {
        
        VStack(alignment: .leading) {
            ScrollView{
                VStack(alignment: .leading){
                    ForEach(model,id: \.id) { msg in
                        MessageBubble(message: msg)
                    }
                }
            }
            
            Spacer()
            
            HStack(){
                TextField("입력",text: $text)
                Button("전송"){
                    send()
                }
            }
        }
        .onAppear{
            mainViewModel.setup()
        }
        .padding()
    }
    
    func send(){
        print("ppap!1! : \(text)")
        guard !text.trimmingCharacters(in: .whitespaces).isEmpty else {
            return
        }
        //내가 보낸 메시지 추가
        model.append(Message(id: UUID(), text: text , received: false))
        mainViewModel.send(text: text) { reponse in
            DispatchQueue.main.async {
                self.model.append(Message(id: UUID(), text: reponse , received: true))
            }
        }
        
        self.text = ""
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
