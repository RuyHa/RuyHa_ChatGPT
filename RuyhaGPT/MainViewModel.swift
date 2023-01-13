//
//  MainViewModel.swift
//  RuyhaGPT
//
//  Created by Ruyha on 2023/01/10.
//
import OpenAISwift
import Foundation

final class MainViewModel : ObservableObject {
    init() {}
    
    private var client : OpenAISwift?
    
    func setup(){
        //https://beta.openai.com/account/api-keys 에서 키를 발급해 넣어주세요.
        client = OpenAISwift(authToken: RuyhaKey.shared.chatGPTauthToken)
    }
    
    func send(text: String, completion: @escaping (String) -> Void) {
        client?.sendCompletion(with: text , maxTokens: 2000  ,completionHandler: { result in
            switch result {
            case .success(let model):
                let output = model.choices.first?.text ?? ""
                completion(self.removelineBreak(text: output))
            case .failure(let error):
                completion("에러발생:"+error.localizedDescription)
            }
            
        })
    }
    
    // 한국어 응답의 경우 응답의 첫 두줄에 \n이 포함된 경우가 많아서 제거 하는 코드
    func removelineBreak(text:String)-> String{
        var myArray = Array(text)
        var count = 0
        for x in myArray {
            if x == "\n" {
                count += 1
            }else{
                break
            }
        }
        myArray.removeSubrange(0..<count)
        return String(myArray)
    }
    
    // 굳이 이렇게 안만들어도 되는데 MainView에 텍스트 길게 들어가는거 싫어서...
    func setGuideMsg() -> Message{
        Message(id: UUID(), text: "안녕하세요 저는 ChatGPT입니다.\n질문을 던져주세요." , received: true)
    }
}
