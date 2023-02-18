//
//  Community-front.swift
//  GIFTU
//
//  Created by 张健毓 on 2022/12/11.
//

import SwiftUI



struct Community_front: View {
    

    var body: some View {

        HomeView().environmentObject(UserDataC())
 
        }
    }




struct Community_front_Previews: PreviewProvider {
    static var previews: some View {
        Community_front()
    }
}






