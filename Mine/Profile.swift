//
//  Profile.swift
//  GIFTU
//
//  Created by 张健毓 on 2022/12/11.
//

import SwiftUI

struct Profile: View {
    var body: some View {
        ZStack {
            Color(red: 246 / 255, green: 246 / 255, blue: 246 / 255).edgesIgnoringSafeArea(.all)
            VStack(spacing: 20) {
                Image("me")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color(.systemGray5), lineWidth: 1))
                Text("修改头像")
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
                
                Form {
                    Section {
                        listItemView(itemImage:Image(systemName: "person.circle.fill"), itemName: "用户名", itemContent: "Jerry")
                        listItemView(itemImage:Image(systemName: "heart.circle"), itemName: "LOVER", itemContent: "Wendy")
                        listItemView(itemImage:Image(systemName: "rectangle.badge.person.crop"), itemName: "ID", itemContent: "whysoserious")
                        listItemView(itemImage:Image(systemName: "phone.circle"), itemName: "电话号码", itemContent: "15600000000")
                        listItemView(itemImage:Image(systemName: "envelope.fill"), itemName: "邮箱", itemContent: "zjy454608228@gmail.com")
                        listItemView(itemImage:Image(systemName: "location.circle.fill"), itemName: "地址", itemContent: "广东省深圳市")
                    }
                }
            }.padding(.top, 40)
        }.navigationBarTitle("个人信息", displayMode: .inline)
    }
}

struct listItemView: View {
    var itemImage: Image
    var itemName: String
    var itemContent: String

    var body: some View {
        HStack {
            itemImage
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 20)

            Text(itemName)
                .font(.system(size: 14))
                .foregroundColor(.gray)

            Spacer()

            Text(itemContent)
                .font(.system(size: 14))
                .foregroundColor(.gray)
        }
    }
}


struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
    }
}
