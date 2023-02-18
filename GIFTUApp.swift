//
//  GIFTUApp.swift
//  GIFTU
//
//  Created by 张健毓 on 2022/7/8.
//

import SwiftUI

@main
struct GIFTUApp: App {
    var body: some Scene {
        WindowGroup {
            Coverpage()
        }
    }
}


import SwiftUI

struct TapView: View {
    var body: some View {
    
        TabView(selection: /*@START_MENU_TOKEN@*/ /*@PLACEHOLDER=Selection@*/.constant(1)/*@END_MENU_TOKEN@*/) {
            Gifting()
                .tabItem {
                    Image(systemName: "giftcard.fill").imageScale(.large)
                    Text("礼物")
            }.tag(1)
            Community_front()
                .tabItem {
                    Image(systemName: "eyes.inverse").imageScale(.large)
                    Text("看看")
            }.tag(2)
            Market_front()
                .tabItem {
                    Image(systemName: "cart.fill.badge.plus").imageScale(.large)
                    Text("商城")
            }.tag(3)
            Mine_front()
                .tabItem {
                    Image(systemName: "person.fill").imageScale(.large)
                    Text("我的")
            }.tag(4)
        }

    }
}

struct TapView_Previews: PreviewProvider {
    static var previews: some View {
        TapView()
        
    }
}
struct TapViewB: View {
    var body: some View {
    
        TabView(selection: /*@START_MENU_TOKEN@*/ /*@PLACEHOLDER=Selection@*/.constant(1)/*@END_MENU_TOKEN@*/) {
            GiftingB()
                .tabItem {
                    Image(systemName: "giftcard.fill").imageScale(.large)
                    Text("礼物")
            }.tag(1)
            Community_front().environmentObject(UserDataC())
                .tabItem {
                    Image(systemName: "eyes.inverse").imageScale(.large)
                    Text("看看")
            }.tag(2)
            Market_front()
                .tabItem {
                    Image(systemName: "cart.fill.badge.plus").imageScale(.large)
                    Text("商城")
            }.tag(3)
            Mine_front()
                .tabItem {
                    Image(systemName: "person.fill").imageScale(.large)
                    Text("我的")
            }.tag(4)
        }
    }
}

struct TapViewB_Previews: PreviewProvider {
    static var previews: some View {
        TapViewB()
    }
}
