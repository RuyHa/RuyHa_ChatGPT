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
    @State var model = [String]()
    
    var body: some View {
        
        VStack(alignment: .leading) {
            ScrollView{
                VStack(alignment: .leading){
                    ForEach(model, id: \.self){ string in
                        Text(string )
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
        guard !text.trimmingCharacters(in: .whitespaces).isEmpty else {
            return
        }
        
        model.append("나: \(text)")
        self.text = ""
        mainViewModel.send(text: text) { reponse in
            DispatchQueue.main.async {
                self.model.append("류하: " + reponse)
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
