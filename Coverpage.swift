//
//  Coverpage.swift
//  GIFTU
//
//  Created by 张健毓 on 2022/7/13.
//

//import SwiftUI
//
//struct Coverpage: View {
//
////    @State var showlogin = false
////    @State var showCoverpage = false
//
//    var body: some View {
//        NavigationView{
//
//            NavigationLink(destination:login()){
//                VStack{
//                    RadialGradient(colors: [.blue,.white], center: .center, startRadius: 15, endRadius: 80)
//        //            Button(action: {
//        ////                self.showlogin.toggle()
//        //            }){
//                        VStack{
//                            Spacer()
//                            HStack{
//                                Text("THE ")
//                                    .font(.largeTitle)
//                                    .fontWeight(.heavy)
//                                    .foregroundColor(Color.blue)
//                                Text("GIFTED")
//                                    .font(.largeTitle)
//                                    .fontWeight(.heavy)
//                                    .foregroundColor(Color.blue)
//                                    .multilineTextAlignment(.center)
//                            }
//
//                                        Text("给TA想要的惊喜")
//                                         .foregroundColor(Color.blue)
//                                         .fontWeight(.medium)
//                                         .padding(20)
//                                         .padding(.bottom)
//                                         .cornerRadius(10)
//                                }
//                        .frame(width:300,height:180)
//                        .background(Color.white)
//                        .cornerRadius(10)
//                        .shadow(radius: 10,y: 10)
//                        .padding(50)
//                    Spacer()
//                    Spacer(minLength: 200)
//                    }
//        //            if showlogin {
//        //                login()
//        //            }
//        //            Spacer()
//        //            Spacer(minLength: 200)
//                }
//            }
//        .navigationBarTitle("")
//        .navigationBarHidden(true)
//        //}
//            }
//
//}
//struct Coverpage_Previews: PreviewProvider {
//    static var previews: some View {
//        Coverpage()
//    }
//}

import SwiftUI

struct Coverpage: View {
    
    @State var showlogin = false
    
    var body: some View {
        NavigationView{
            
            VStack{
                if !showlogin {
                    Button(action: {
                        self.showlogin = true
                    }){
                        VStack{  RadialGradient(colors: [.blue,.white], center: .center, startRadius: 15, endRadius: 80)
                            VStack{
                                Spacer()
                                HStack{
                                    Text("THE ")
                                        .font(.largeTitle)
                                        .fontWeight(.heavy)
                                        .foregroundColor(Color.blue)
                                    Text("GIFTED")
                                        .font(.largeTitle)
                                        .fontWeight(.heavy)
                                        .foregroundColor(Color.blue)
                                        .multilineTextAlignment(.center)
                                }
                                
                                Text("给TA想要的惊喜")
                                    .foregroundColor(Color.blue)
                                    .fontWeight(.medium)
                                    .padding(20)
                                    .padding(.bottom)
                                    .cornerRadius(10)
                            }
                            .frame(width:300,height:180)
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 10,y: 10)
                            .padding(50)
                            Spacer()
                            Spacer(minLength: 200)
                        }
                    }
                }
                if showlogin {
                    login()
                }
            }
        }
    }
}
struct Coverpage_Previews: PreviewProvider {
    static var previews: some View {
        Coverpage()
    }
}
