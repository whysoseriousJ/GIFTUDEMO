//
//  LoginModel.swift
//  GIFTU
//
//  Created by 张健毓 on 2022/7/13.
//

import Foundation
import Combine

class LoginModel : ObservableObject{
    
    @Published var userNameFailFocus:Bool?
    @Published var isVerity:Bool = false
    
    //用户名
    @Published var userName:String = ""
    //检测用户名合法性的错误提示
    @Published var verityUserNameError:String?

    //密码
    @Published var passWord:String = ""
    //检测密码合法性的错误提示
    @Published var verityPassWordError:String?
    
    
    private var cancellableSet: Set<AnyCancellable>=[]
    
    private var verityUserNamePublisher:AnyPublisher<String?,Never>{
        $userName
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .removeDuplicates()
            .map{_userName in
                if _userName.isEmpty{
                    return "用户名不能为空"
                }else if _userName.count<4||_userName.count>16{
            return "用户名字数在4至16字符之间"
                    }else {
                        return nil
                    }
    }
    .eraseToAnyPublisher()
}


     private var verityPassWordPublisher:AnyPublisher<String?,Never>{
         $passWord
             .debounce(for: 0.5, scheduler: RunLoop.main)
             .removeDuplicates()
             .map{_passWord in
                 
            if _passWord.isEmpty{
                return "密码不能为空"
            }else if _passWord.count<6||_passWord.count>20{
        return "密码位数需大于6"
                }else {
                    return nil
                }
        }
        .eraseToAnyPublisher()
}

init(){
    
    Publishers.CombineLatest(verityUserNamePublisher,verityPassWordPublisher)
        .dropFirst()
        .sink{_verityUserNameError,_verityPassWordError in
            self.isVerity=_verityUserNameError == nil && _verityPassWordError == nil
        }
        .store(in: &cancellableSet)
    
    verityUserNamePublisher
        .dropFirst()
        .sink{_verityUserNameError in
            self.verityUserNameError = _verityUserNameError
            
        }
        .store(in: &cancellableSet)

verityPassWordPublisher
    .dropFirst()
    .sink{_verityPassWordError in
        self.verityPassWordError = _verityPassWordError
        
    }
    .store(in: &cancellableSet)
}
}
