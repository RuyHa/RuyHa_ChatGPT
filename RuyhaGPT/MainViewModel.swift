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
        client = OpenAISwift(authToken: "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")
    }
    
    func send(text: String, completion: @escaping (String) -> Void) {
        client?.sendCompletion(with: text , maxTokens: 500  ,completionHandler: { result in
            
            switch result {
            case .success(let model):
                let output = model.choices.first?.text ?? ""
                completion(output)
            case .failure(let error):
                completion("ERR:"+error.localizedDescription)
            }
            
        })
    }
}
