//
//  HomeNavigationBar.swift
//  GIFTU
//
//  Created by 张健毓 on 2022/12/15.
//

import SwiftUI

private let kLabelWidth: CGFloat = 60
private let kButtonHeight: CGFloat = 24

struct HomeNavigationBar: View {
    // 0 for left, 1 for right
    @Binding var leftPercent: CGFloat
    
    var body: some View {
        HStack(alignment: .top, spacing: 0) {
            Button(action: {
                print("Click camera button")
            }) {
                Image(systemName: "camera")
                    .resizable()
                    .scaledToFit()
                    .frame(width: kButtonHeight, height: kButtonHeight)
                    .padding(.horizontal, 15)
                    .padding(.top, 5)
                    .foregroundColor(.black)
            }
            
            Spacer()
            
            VStack(spacing: 3) {
                HStack(spacing: 0) {
                    Text("关注")
                        .bold()
                        .frame(width: kLabelWidth, height: kButtonHeight)
                        .padding(.top, 5)
                        .opacity(Double(1 - leftPercent * 0.5))
                        .onTapGesture {
                            withAnimation {
                                self.leftPercent = 0
                            }
                            
                        }
                    
                    Spacer()
                    
                    Text("逛逛")
                        .bold()
                        .frame(width: kLabelWidth, height: kButtonHeight)
                        .padding(.top, 5)
                        .opacity(Double(0.5 + leftPercent * 0.5))
                        .onTapGesture {
                            withAnimation {
                                self.leftPercent = 1
                            }
                            
                        }
                    
                }
                .font(.system(size: 20))
                
                                RoundedRectangle(cornerRadius: 2)
                                    .foregroundColor(.blue)
                                    .frame(width: 30, height: 4)
                                    .offset(x: UIScreen.main.bounds.width * 0.3 * (self.leftPercent - 0.5) + kLabelWidth * CGFloat(0.5 - self.leftPercent))
            }
            .frame(width: UIScreen.main.bounds.width * 0.3)
            
            Spacer()
            
            Button(action: {
                print("Click add button")
            }) {
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: kButtonHeight, height: kButtonHeight)
                    .padding(.horizontal, 15)
                    .padding(.top, 5)
                    .foregroundColor(.blue)
            }
        }
        .frame(width: UIScreen.main.bounds.width)
    }
}

struct HomeNavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        // 默认显示在推荐上
        HomeNavigationBar(leftPercent: .constant(0))
    }
}
