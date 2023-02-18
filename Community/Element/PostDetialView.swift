//
//  PostDetialView.swift
//  GIFTU
//
//  Created by 张健毓 on 2022/12/15.
//

import SwiftUI

struct PostDetailView: View {
    
    let post: Post
    
    var body: some View {
        List {
            PostCell(post: post)
                .listRowInsets(EdgeInsets())
                .padding(.vertical)
            
            //商品链接及一键加入Giftlist的按键
            HStack{
                Spacer()
                //商品链接
                Button(action: {
                    //待定
                    
                }){
                    HStack{
                        Text("我也想要")
                            .font(.headline)
                            .foregroundColor(.white)
                        Image(systemName: "plus.circle")
                            .resizable()
                            .frame(width: 30,height: 30)
                            .foregroundColor(.white)
                    }.frame(width:120,height:32)
                        .background(Color.pink)
                        .cornerRadius(10)
                        .shadow(radius: 2,y: 0)
                        .padding(2)
                }
            }
            
            
            ForEach(1...10, id: \.self) { i in
                Text("评论\(i)")
            }
        }.listStyle(PlainListStyle())
        .navigationBarTitle("详情", displayMode: .inline)
    }
}

struct PostDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let userDataC = UserDataC()
        return PostDetailView(post: userDataC.recommendPostList.list[0]).environmentObject(userDataC)
    }
}
