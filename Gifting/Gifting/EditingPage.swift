//
//  EditingPage.swift
//  GIFTU
//
//  Created by 张健毓 on 2022/7/8.
//

import SwiftUI

struct EditingPage: View {
    
    @EnvironmentObject var UserData: ToGift
    
    @State var title: String = ""
    @State var duedate: Date = Date()
    @State var isFavourite = false
    
    var id:Int? = nil
    
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("礼物项")){
                    TextField("What do you want?",text: self.$title)
                        .autocorrectionDisabled()
                    DatePicker(selection: self.$duedate, label: { Text("Expected Time") })
                }
                Section{
                    Toggle(isOn: self.$isFavourite){
                        HStack{
                            Image(systemName: "star.fill").foregroundColor(.yellow)
                            Text("Important").foregroundColor(.gray)
                        }
                    }
                }
                Section{
                    Button(action: {
                        if self.id == nil{
                            self.UserData.add(data: SingleTogift(title: self.title, duedate: self.duedate,isFavourite: self.isFavourite))
                        }
                        else{
                            self.UserData.edit(id: self.id!, data: SingleTogift(title: self.title, duedate: self.duedate, isFavourite: self.isFavourite))
                        }
                        self.presentation.wrappedValue.dismiss()
                    }){
                    Text("Confirm")
                    }
                    Button(action: {
                        self.presentation.wrappedValue.dismiss()
                    }){
                        Text("Cancel")
                    }
                }
            }
            .navigationTitle("KISS KISS")
        }
    }
}



struct EditingPage_Previews: PreviewProvider {
    static var previews: some View {
        EditingPage()
    }
}
