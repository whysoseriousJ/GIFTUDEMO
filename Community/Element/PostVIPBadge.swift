//
//  PostVIPBadge.swift
//  GIFTU
//
//  Created by 张健毓 on 2022/12/15.
//

import SwiftUI

struct PostVIPBadge: View {
    let isVip: Bool
    
    var body: some View {
        Group {
            if isVip {
                Text("V")
                    .bold()
                    .font(.system(size: 11))
                    .frame(width: 15, height: 15)
                    .background(Color.red)
                    .clipShape(Circle())
                    .overlay(
                        RoundedRectangle(cornerRadius: 7.5)
                            .stroke(Color.white, lineWidth: 1)
                    )
            }
        }
      
    }
}

struct PostVIPBadge_Previews: PreviewProvider {
    static var previews: some View {
        PostVIPBadge(isVip: true)
    }
}
