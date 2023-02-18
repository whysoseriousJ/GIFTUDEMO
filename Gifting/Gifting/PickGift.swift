//
//  Gift.swift
//  GIFTU
//
//  Created by 张健毓 on 2022/7/18.
//

import SwiftUI


struct PickGift: View {
    @EnvironmentObject var UserBData : ToGiftB 

    var body: some View {
        ScrollView{
         
            RadialGradient(colors: [.blue,.white], center: .center, startRadius: 15, endRadius: 90)
                .frame(width:300,height:180)
            VStack(spacing:50){
            Text("Ta想要这个")
                .fontWeight(.bold)
                .foregroundColor(.pink)
                .font(.largeTitle)

                Group{
                    Text(UserBData.ToGiftBList.isEmpty ? "The list is empty" : UserBData.ToGiftBList.randomElement()?.title ?? "")
                            .font(.title)
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                            .onAppear {
                                // Update the ToGiftList list in the UserData object.
                                UserBData.ToGiftBList = [
                                    SingleBTogift(title: "口红", duedate: Date(), isFavourite: false),
                                    SingleBTogift(title: "粉底液", duedate: Date(), isFavourite: false),
                                    SingleBTogift(title: "项链", duedate: Date(), isFavourite: false),
                                    SingleBTogift(title: "包包", duedate: Date(), isFavourite: false)]}
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

struct PickGift_Previews: PreviewProvider {
    static var previews: some View {
        PickGift().environmentObject(ToGiftB())
    }
}
