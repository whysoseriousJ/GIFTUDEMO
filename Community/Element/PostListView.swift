//
//  PostListView.swift
//  GIFTU
//
//  Created by 张健毓 on 2022/12/15.
//

import SwiftUI

struct PostListView: View {
    
    let category: PostListCategory
    
    @EnvironmentObject var userDataC: UserDataC
    
    var body: some View {
        // 每一次取出一个元素
        List {
            ForEach(userDataC.postList(for: category).list) { post in
                // ZStack垂直与屏幕方向的排列
//                ZStack{
//                    PostCell(post: post)
                    NavigationLink(
                        destination: PostDetailView(post: post)) {
                            PostCell(post: post)
                                .padding(.leading)
//                            EmptyView()
//                        }.listRowInsets(EdgeInsets())
//                    .hidden()
                }
            }

        }.listStyle(PlainListStyle())

    }
}

struct PostListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            // 默认显示推荐栏
            PostListView(category: .recommend)
                .navigationTitle("")
                .navigationBarHidden(true)
        }
        .environmentObject(UserDataC())
    }
}
