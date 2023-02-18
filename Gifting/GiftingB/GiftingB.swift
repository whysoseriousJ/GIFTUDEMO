//
//  GiftingB.swift
//  GIFTU
//
//  Created by 张健毓 on 2022/7/18.
//

import SwiftUI

struct GiftingB: View {
    @State var isNavigationBarHidden: Bool = true
    
    var body: some View {
        NavigationView(content:{
            VStack{
                Text("")
                Text("")
                HStack{
                Text("Love is giving what")
                                  .font(.title2)
                                  .fontWeight(.heavy)
                                  .foregroundColor(.black)
                    Text("he wants")
                                      .font(.title2)
                                      .fontWeight(.heavy)
                                      .foregroundColor(.orange)
                    Text("as a")
                                      .font(.title2)
                                      .fontWeight(.heavy)
                                      .foregroundColor(.black)
                }
//                              HStack{
                                  Text("")
                                      .font(.title2)
                                      .fontWeight(.heavy)
                                      .foregroundColor(.black)
                Text("")
                Text("")
                                  Text("SUPRISE")
                                      .font(.largeTitle)
                                      .fontWeight(.heavy)
                                      .foregroundColor(.orange)
//                              }
                
                NavigationLink(destination: PickGiftB()
                    .environmentObject(ToGift()),
//    点击随机调取一个GIFT项，暂替
                               label: {
                    Text("GIFT TIME")
                        .font(.headline)
                        .fontWeight(.heavy)
                        .foregroundColor(.pink)
                        .padding(28.0)
                        .frame(height:120)
                        .background(Color.white)
                        .cornerRadius(10)
                    .shadow(radius: 5,x: 2,y: 5)
                }).navigationBarTitle("")
                    .navigationBarHidden(self.isNavigationBarHidden)
                    .onAppear {
                        self.isNavigationBarHidden = true
                    }
                .frame(height:300)
                
                
                    NavigationLink(destination:    ContentBView(UserBData: ToGiftB(dataa: [
                        SingleBTogift(title: "口红", duedate: Date(), isFavourite: false),
                        SingleBTogift(title: "粉底液", duedate: Date(), isFavourite: false),
                        SingleBTogift(title: "项链", duedate: Date(), isFavourite: false),
                        SingleBTogift(title: "包包", duedate: Date(), isFavourite: false)])),
                                   label: {
                        Text("MY GIFTLIST")
                            .font(.headline)
                            .fontWeight(.heavy)
                            .foregroundColor(.blue)
                            .padding()
                            .frame(height:120)
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 5,x: 2,y: 5)
                })
                Spacer()
            } .navigationTitle(" ")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarHidden(true)
            }).navigationBarHidden(true)
        .navigationViewStyle(StackNavigationViewStyle())
        .environmentObject(ToGift())
    }
}

struct GiftingB_Previews: PreviewProvider {
    static var previews: some View {
        GiftingB()
    }
}

