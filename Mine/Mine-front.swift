//
//  Mine-front.swift
//  GIFTU
//
//  Created by 张健毓 on 2022/12/11.
//

import SwiftUI

struct Mine_front: View {
    var body: some View {
        NavigationView{
            VStack {
                HStack {
                    NavigationLink(destination:Profile()){
                        Image("profile_picture")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                        .shadow(radius: 10)}
                    
                    VStack(alignment: .leading) {
                        Text("Your Name")
                            .font(.title)
                        Text("your@email.com")
                            .font(.subheadline)
                    }
                    .padding(.leading, 20)
                    
                    Spacer()
                }
                .padding()
                
                List {
                    Section(header: Text("MY ACCOUNT")) {
                        NavigationLink(destination: Profile()) {
                            HStack {
                                Image(systemName: "person.crop.circle")
                                Text("Profile")
                            }
                        }
                        NavigationLink(destination: Orders()) {
                            HStack {
                                Image(systemName: "bag")
                                Text("Orders")
                            }
                        }
                        NavigationLink(destination: Setting()) {
                            HStack {
                                Image(systemName: "gear")
                                Text("Settings")
                            }
                        }
                    }
                    
                    Section(header: Text("HELP")) {
                        NavigationLink(destination: Help()) {
                            HStack {
                                Image(systemName: "questionmark.circle")
                                Text("Help")
                            }
                        }
                        NavigationLink(destination: Feedback()) {
                            HStack {
                                Image(systemName: "bubble.left")
                                Text("Feedback")
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("")
        }
    }
}

struct Mine_front_Previews: PreviewProvider {
    static var previews: some View {
        Mine_front()
    }
}
