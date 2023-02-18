//
//  Login.swift
//  GIFTU
//
//  Created by 张健毓 on 2022/7/13.
//

import Foundation
import SwiftUI


struct login: View {
    @StateObject var loginM: LoginModel=LoginModel()
    
    var body: some View{
        NavigationView {
            VStack{
                RadialGradient(colors: [.blue,.white], center: .center, startRadius: 5, endRadius: 50)
                VStack{
                    Spacer()
                    HStack{
                        Text("THE ")
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .foregroundColor(Color.blue)
                        Text("GIFTED")
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .foregroundColor(Color.blue)
                            .multilineTextAlignment(.center)
                    }
                                Text("给TA想要的惊喜")
                                 .foregroundColor(Color.blue)
                                 .fontWeight(.medium)
                                 .padding(20)
                                 .padding(.bottom)
                                 .cornerRadius(10)
                        }
                .frame(width:300,height:180)
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 10,y: 10)
                .padding(50)
                VStack(alignment:.leading,spacing:4){
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.black.opacity(0.13))
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.blue,lineWidth: 1)
                            .opacity(loginM.userNameFailFocus == true ? 1:0)
                      //输入账号
                        TextField("请输入用户名",text: $loginM.userName,onEditingChanged: {editChange in
                            withAnimation{
                                loginM.userNameFailFocus = editChange
                            }
                        })
                        .padding(.horizontal,20)
                        .padding(9)
                        
                    }
                    .frame(height: 35)
                    
                    Text(loginM.verityUserNameError ?? "")
                        .font(.system(size: 12,weight: .semibold))
                        .foregroundColor(.red)
                        .padding(.leading,20)
                }
                Spacer(minLength: 20)
                VStack(alignment:.leading,spacing:4){
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.black.opacity(0.13))
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.blue,lineWidth: 1)
                            .opacity(loginM.userNameFailFocus == false ? 1:0)
                  //输入密码
                        SecureField("请输入密码",text: $loginM.passWord)
                            .padding(.horizontal,20)
                            .padding(9)
                    }
                    .frame(height: 35)
                    
                    Text(loginM.verityPassWordError ?? "")
                        .font(.system(size: 12,weight: .semibold))
                        .foregroundColor(.red)
                        .padding(.leading,20)
                }
                Spacer(minLength: 40)
                    Button{
                        print("执行登录")
                        print("用户名：\(loginM.userName)")
                        print("密码：\(loginM.passWord)")
                        //跳转到Gifting
                    }label: {
                        NavigationLink(destination: Gender()){
                            Text("登录")
                                .foregroundColor(.white)
                                .lineLimit(nil)
                                .padding(.vertical,8)
                                .padding(.horizontal,40)
                                .background(
                                    Capsule().fill(Color.blue.opacity(loginM.isVerity ? 1:0.3)))
                                .scaleEffect(1.3)
                        }
                        .disabled(!loginM.isVerity)
                    }
                Spacer(minLength: 55)
                HStack{
                    //链接微信、支付宝的登录方式
                    Image(systemName: "iphone")
                        .imageScale(.large)
                        .padding()
                        .foregroundColor(.blue)
                        .scaleEffect(2)
                }
                Spacer(minLength: 50)
            }
            .padding(.horizontal,16)
        }
        .navigationBarTitle("")
            .navigationBarHidden(true)
    }
}

struct login_Previews: PreviewProvider {
    static var previews: some View {
        login()
    }
}
