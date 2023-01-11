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
            ScrollViewReader{ proxy in
                ScrollView{
                    VStack(alignment: .leading){
                        ForEach(model,id: \.id) { msg in
                            MessageBubble(message: msg)
                        }
                    }
                }
                .onChange(of: model.last?.id) { id in
                    withAnimation{
                        proxy.scrollTo(id!, anchor: .bottom)
                    }
                }
                
            }
            .onAppear (perform : UIApplication.shared.hideKeyboard)
            
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
        guard !text.trimmingCharacters(in: .whitespaces).isEmpty else {
            return
        }
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
