//
//  PickGiftB.swift
//  GIFTU
//
//  Created by 张健毓 on 2022/7/25.
//

import SwiftUI

struct PickGiftB: View {
    @EnvironmentObject var UserData : ToGift
    //    var random : Int
    
    var body: some View {
        ScrollView{
            
            RadialGradient(colors: [.blue,.white], center: .center, startRadius: 15, endRadius: 90)
                .frame(width:300,height:180)
            VStack(spacing:50){
                Text("Ta想要这个")
                    .fontWeight(.bold)
                    .foregroundColor(.pink)
                    .font(.largeTitle)
                
                //随机显示一个GIFT
                Group{
                    Text(UserData.ToGiftList.isEmpty ? "The list is empty" : UserData.ToGiftList.randomElement()?.title ?? "")
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                        .onAppear {
                            // Update the ToGiftList list in the UserData object.
                            UserData.ToGiftList = [
                                SingleTogift(title: "手表", duedate: Date(), isFavourite: false),
                                SingleTogift(title: "腰带", duedate: Date(), isFavourite: false),
                                SingleTogift(title: "滑板", duedate: Date(), isFavourite: false),
                                SingleTogift(title: "球鞋", duedate: Date(), isFavourite: false)]}
                    }
        }
                .frame(width:300,height:300)
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 10,y: 10)
                .padding(50)
            }
        }
    }

struct PickGiftB_Previews: PreviewProvider {
    static var previews: some View {
        PickGiftB()
            .environmentObject(ToGift())
    }
}
