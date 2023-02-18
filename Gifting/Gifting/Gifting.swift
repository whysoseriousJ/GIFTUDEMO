//
//  Gifting.swift
//  GIFTU
//
//  Created by 张健毓 on 2022/7/15.
//

import SwiftUI

struct Gifting: View {
    @State var isNavigationBarHidden: Bool = true
    
    var body: some View {
        
        NavigationView(content:{
            VStack(spacing:20){
                HStack{           
                Text("Love is giving what")
                                  .font(.title2)
                                  .fontWeight(.heavy)
                                  .foregroundColor(.black)
                    Text("she wants")
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
                Text("SUPRISE")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                                      .foregroundColor(.orange)
//                              }
                
                NavigationLink(destination:    PickGift().environmentObject(ToGiftB()),
//    点击随机调取一个GIFT项
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
                
                
                    NavigationLink(destination: ContentView(UserData: ToGift(data: [
                        SingleTogift(title: "手表", duedate: Date(), isFavourite: false),
                        SingleTogift(title: "腰带", duedate: Date(), isFavourite: false),
                        SingleTogift(title: "滑板", duedate: Date(), isFavourite: false),
                        SingleTogift(title: "球鞋", duedate: Date(), isFavourite: false)])),
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
            }
                    .navigationTitle("")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarHidden(true)
            })        .navigationBarTitle("")
            .navigationBarHidden(true)
        .navigationViewStyle(StackNavigationViewStyle())
        .environmentObject(ToGiftB())
    }
}


struct Gifting_Previews: PreviewProvider {
    static var previews: some View {
        Gifting()
    }
}

