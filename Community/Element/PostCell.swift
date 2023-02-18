//
//  PostCell.swift
//  GIFTU
//
//  Created by 张健毓 on 2022/12/15.
//

import SwiftUI

struct PostCell: View {
    
    let post: Post
    
    var bindingPost: Post {
        userDataC.post(forId: post.id)!
    }
    
    @State var presentComment: Bool = false
    
    @EnvironmentObject var userDataC: UserDataC
    
    var body: some View {
        // 局部变量覆盖属性
        var post = bindingPost
        
        return VStack(alignment: .leading, spacing: 10) {
            HStack(spacing: 5) {
                
                post.avatarImage
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .overlay(
                        PostVIPBadge(isVip: post.vip)
                            .offset(x: 16, y: 16)
                    )
                
                VStack(alignment: .leading, spacing: 5) {
                    Text(post.name)
                        .font(.system(size: 16)) // nil
                        .foregroundColor(Color(red: 242 / 255, green: 99 / 255, blue: 4 / 255))
                        .lineLimit(1)
                    Text(post.date)
                        .font(.system(size: 11))
                        .foregroundColor(.gray)
                }
                .padding(.leading, 10)
                
                // 未关注
                if !post.isFollowed {
                    Spacer()

                    Button(action: {
                        post.isFollowed = true
                        print("Button clicked")
                        // 调用函数更新UserData
                        self.userDataC.update(post)
                    }) {
                        Text("关注")
                            .font(.system(size: 14))
                            .foregroundColor(.blue)
                            .frame(width: 50, height: 26)
                            .overlay(RoundedRectangle(cornerRadius: 13)
                                        .stroke(Color.blue, lineWidth: 1))
                    }
                    
                    .buttonStyle(BorderlessButtonStyle())
                    
                }else{
                    Spacer()

                    Button(action: {
                        post.isFollowed = false
                        print("Button Clicked")
                        // 调用函数更新UserData
                        self.userDataC.update(post)
                    }) {
                        Text("√")
                            .font(.system(size: 14))
                            .foregroundColor(.blue)
                            .frame(width: 35, height: 26)
                            .overlay(RoundedRectangle(cornerRadius: 13)
                                        .stroke(Color.blue, lineWidth: 1))
                    }
                    
                    .buttonStyle(BorderlessButtonStyle())
                    
                    
                }
                
                
            }
            
            Text(post.text)
                .font(.system(size: 17))
                .frame(minWidth: 0, maxWidth: .infinity)
            
            if !post.images.isEmpty {
                PostImageCell(images: post.images, width: UIScreen.main.bounds.width - 30)
            }
            
            Divider()
            
            HStack(spacing: 0) {
                
                Spacer()
                
                PostCellToolbarButton(image: "message",
                                      text: post.commentCountText,
                                      color: .black)
                {
                    self.presentComment = true
                }
                .sheet(isPresented: $presentComment) {
                    CommentInputView(post: post)
                }
                
                Spacer()
                
                PostCellToolbarButton(image: post.isLiked ? "heart.fill" : "heart",
                                      text: post.likeCountText,
                                      color: post.isLiked ? .red : .black)
                {
                    if post.isLiked {
                        post.isLiked = false
                        post.likeCount -= 1
                    } else {
                        post.isLiked = true
                        post.likeCount += 1
                    }
                    self.userDataC.update(post)
                }
                
                Spacer()
            }
            
            
//            Rectangle()
//                .padding(.horizontal, -15)
//                .frame(height: 5)
//                .foregroundColor(Color(red: 238 / 255, green: 238 / 255, blue: 238 / 255))
        }
        .padding(.horizontal, 15.5)
        .padding(.top, 2)
    }
}

struct PostCell_Previews: PreviewProvider {
    static var previews: some View {
        let userDataC = UserDataC()
        return PostCell(post: userDataC.recommendPostList.list[0]).environmentObject(userDataC)
    }
}
