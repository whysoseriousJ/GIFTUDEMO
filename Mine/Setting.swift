//
//  Setting.swift
//  GIFTU
//
//  Created by 张健毓 on 2022/12/11.
//

import SwiftUI

struct Setting: View {
    @State var isWechatBingding = true
    @State var isTiktokBingding = false
    @State var isWeiboBingding = false
    
    @State var isFullSelected = true
    @State var isIndividuationSelected = true
    @State var isChoicenessSelected = true
    @State var isInformationSelected = true
    
    var body: some View {
        VStack{
            Form {
                Section {
                    Toggle(isOn: $isFullSelected) {
                        VStack(alignment: .leading, spacing: 5) {
                            Text("完整版功能")
                                .font(.system(size: 17))
                                .foregroundColor(.black)
                            Text("开启后可享有完整功能，建议开启")
                                .font(.system(size: 14))
                                .foregroundColor(.gray)
                        }
                    }
                    Toggle(isOn: $isIndividuationSelected) {
                        VStack(alignment: .leading, spacing: 5) {
                            Text("个性化推荐")
                                .font(.system(size: 17))
                                .foregroundColor(.black)
                            Text("开启后将根据您的喜好进行内容推荐")
                                .font(.system(size: 14))
                                .foregroundColor(.gray)
                        }
                    }
                    Toggle(isOn: $isChoicenessSelected) {
                        VStack(alignment: .leading, spacing: 5) {
                            Text("精选内容推送")
                                .font(.system(size: 17))
                                .foregroundColor(.black)
                            Text("开启后将享有精选内容推荐")
                                .font(.system(size: 14))
                                .foregroundColor(.gray)
                        }
                    }
                    Toggle(isOn: $isInformationSelected) {
                        VStack(alignment: .leading, spacing: 5) {
                            Text("消息推送")
                                .font(.system(size: 17))
                                .foregroundColor(.black)
                            Text("关闭后将无法收到及时通知，建议开启")
                                .font(.system(size: 14))
                                .foregroundColor(.gray)
                        }
                    }
                }.padding(.vertical, 5)
                Section {
                    listItemView(itemImage:Image(systemName: "phone.circle"), itemName: "手机号", itemContent: "15600000000")
                    listItemView(itemImage:Image(systemName: "keyboard.fill"), itemName: "修改密码", itemContent: "")
                }
                Section(header: Text("第三方账号")) {
                    Toggle(isOn: $isWechatBingding) {
                        Text("微信")
                    }
                    Toggle(isOn: $isTiktokBingding) {
                        Text("抖音")
                    }
                    Toggle(isOn: $isWeiboBingding) {
                        Text("新浪微博")
                    }
                }.padding(.vertical, 5)
                Section {
                    cancelAccount
                }
            }
            }
        }
    

        // 注销账号
        private var cancelAccount: some View {
            Button(action:{
                //待填充
            }) {
                Text("注销账号")
                    .font(.system(size: 17))
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 30, maxHeight: 30)
                    .foregroundColor(.red)
                    .cornerRadius(8)
                    .padding(.vertical, 5)
                
            }
        }
    }


struct Setting_Previews: PreviewProvider {
    static var previews: some View {
        Setting()
    }
}
