//
//  CommentInputView.swift
//  GIFTU
//
//  Created by 张健毓 on 2022/12/15.
//

import SwiftUI

struct CommentInputView: View {
    
    let post: Post
    
    @State var presentComment: Bool = true
    
    var body: some View {
        HStack(spacing: 0) {
            Button(action: {
                
                print("Cancel")
                self.presentComment = false
            }) {
                Text("取消").padding()
            }
            
            Spacer()
            
           
            Button(action: {
                print("Send")
            }) {
                Text("发送").padding()
            }
        }
        .font(.system(size: 18))
        .foregroundColor(.black)
    }
}

struct CommentInputView_Previews: PreviewProvider {
    static var previews: some View {
        CommentInputView(post: UserDataC().recommendPostList.list[0])
    }
}

