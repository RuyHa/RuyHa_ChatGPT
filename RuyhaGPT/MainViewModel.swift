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
}
