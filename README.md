# ChatGPT를 사용한 앱을 만들어보자...
  
  

##  주의사항
ChatGPT API키는 직접 발급후 사용해주세요.
MainViewModel.swift 파일의 setup()안의 코드를 수정해주세요.
```swift
    func setup(){
        //https://beta.openai.com/account/api-keys 에서 키를 발급해 넣어주세요.
        //아래의 예시 처럼 본인이 발급 받은 키를 넣어 수정해주시면됩니다.
        //ex  client = OpenAISwift(authToken: "sk~~~~")
        client = OpenAISwift(authToken: RuyhaKey.shared.chatGPTauthToken)
    }
```
해당 작업 이후 Ignore 폴더를 삭제해 주시면 실행 가능합니다.

## 📝 설명
  
ChatGPT를 이용한 장난감을 만들고 싶어서 제작하게 되었습니다.
  
**참고한 유튜브**  
- https://www.youtube.com/watch?v=bUDCW2NeO8Y&list=WL&index=3
- ChatGPT를 SwiftUI로 사용가능하도록 설명 되어 있습니다.    
- https://www.youtube.com/watch?v=Zz9XQy8PRpQ&list=WL&index=2
- 채팅형태로 구현 가능한 코드를 참고 하였습니다.
  
## 📚 Library

```swift
//First party library
import SwiftUI
import OpenAISwift
```
