//
//  LOGINMODEL1.swift
//  GIFTU
//
//  Created by 张健毓 on 2022/12/10.
//

import SwiftUI

struct Gender: View {
    var body: some View {
        NavigationView{
            HStack{
                Spacer()
                NavigationLink(destination: TapView()){
                    Image(systemName: "m.circle.fill")
                        .resizable()
                        .foregroundColor(.blue)
                        .padding(28.0)
                        .frame(height:200)
                        .background(Color.white)
                        .cornerRadius(80)
                        .shadow(radius: 10,x: -2,y:10)
                }
                Spacer()
                NavigationLink(destination: TapViewB()){
                    Image(systemName: "f.circle.fill")
                        .resizable()
                        .foregroundColor(.pink)
                        .padding(28.0)
                        .frame(height:200)
                        .background(Color.white)
                        .cornerRadius(80)
                        .shadow(radius: 10,x: 2,y: 10)
                    Spacer()
                }
            }
        }        .navigationBarTitle("")
            .navigationBarHidden(true)
        
    }
}


struct Gender_Previews: PreviewProvider {
    static var previews: some View {
        Gender()
    }
}
