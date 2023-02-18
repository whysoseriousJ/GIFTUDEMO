//
//  ContentView.swift
//  GIFTU
//
//  Created by 张健毓 on 2022/7/8.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var UserData: ToGift = ToGift(data: initUserData())

    @State var showEditingPage = false
    @State var editingMode = false
    @State var showFavouriteOnly = false
    
    @State var selection: [Int] = []
                                         
    var body: some View {
        
        ZStack{
            NavigationView{
                ScrollView(.vertical,showsIndicators: true){
                    VStack{
                        ForEach(self.UserData.ToGiftList){item in
                            if !item.deleted{
                                if !showFavouriteOnly || item.isFavourite{
                                    Singlecardview(index: item.id,editingMode: self.$editingMode,selection: self.$selection)
                                        .environmentObject(self.UserData)
                                        .padding(.top)
                                        .padding(.horizontal)
                                        .animation(.spring(),value: 1)
                                        .transition(.slide)
                                }
                            }
                        }
                        
                }
            }
                .navigationTitle("GIFT LIST")
                .navigationBarItems(trailing:
                    HStack(spacing:20){
                    if self.editingMode{
                        DeleteButton(selection: self.$selection, editingMode: self.$editingMode)
                            .environmentObject(self.UserData)
                        ShowFavButton(selection: self.$selection, editingMode: self.$editingMode)
                            .environmentObject(self.UserData)
                    }
                    if !self.editingMode{
                        ShowFavouriteButton(showFavouriteOnly: self.$showFavouriteOnly)
                    }
                    EditingButton(editingMode: self.$editingMode,selection: self.$selection)
                })
        }.navigationViewStyle(StackNavigationViewStyle())
            
                HStack{
                    Spacer()
                    VStack{
                        Spacer()
                        Button(action: {
                            self.showEditingPage = true
                        }){
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width:60)
                            .foregroundColor(.blue)
                            .padding(.trailing)
                            .padding(10)
                    }
                        .sheet(isPresented: self.$showEditingPage, content: {
                            EditingPage()
                                .environmentObject(self.UserData)
                        })
                }
            }
        }
    }
}

struct ShowFavButton:View{
    
    @EnvironmentObject var UserData: ToGift
    @Binding var selection: [Int]
    @Binding var editingMode : Bool
    
    var body: some View{
        Image(systemName: "star.lefthalf.fill")
            .imageScale(.large)
            .foregroundColor(.yellow)
            .onTapGesture {
                for i in self.selection{
                    self.UserData.ToGiftList[i].isFavourite.toggle()
                }
                self.editingMode = false
            }
    }
}


struct ShowFavouriteButton:View{
    
    @Binding var showFavouriteOnly: Bool
    var body: some View{
        Button (action: {
            self.showFavouriteOnly.toggle()
        }){
            Image(systemName: self.showFavouriteOnly ? "star.fill" : "star")
                .imageScale(.large)
                .foregroundColor(.yellow)
            }
    }
}

struct EditingButton: View{
    
    @Binding var editingMode: Bool
    @Binding var selection : [Int]
    
    
    var body: some View{
        Button(action:{
            self.editingMode.toggle()
            self.selection.removeAll()
        }){
            Image(systemName: "gear")
                .imageScale(.large)
        }
    }
}

struct DeleteButton: View{
    
    @Binding var selection: [Int]
    @EnvironmentObject var userData : ToGift
    @Binding var editingMode : Bool
    
    var body: some View{
        Button(action:{
            for i in self.selection{
                self.userData.delete(id: i)
            }
            self.editingMode = false
        }){
            Image(systemName: "trash")
                .imageScale(.large)
        }
    }
}



struct Singlecardview: View {
    

    @EnvironmentObject var UserData:ToGift
    var index : Int
    
    @State var showEditingPage = false
    @Binding var editingMode: Bool
    @Binding var selection:[Int]
    
    var body: some View {
        HStack{
            if self.editingMode{
                Button(action: {
                    self.UserData.delete(id: self.index)
                    self.editingMode = false
                }){
                    Image(systemName: "trash")
                        .imageScale(.large)
                        .padding(.leading)
                        .foregroundColor(.black)
                }
            }
            Rectangle()
                .frame(width:6)
                .foregroundColor(Color("card" + String(self.index % 6)))
            Button(action:{
                if !self.editingMode{
                    self.showEditingPage = true
                }
            }){
                Group{
                    VStack(alignment: .leading, spacing: 6.0){
                        Text(self.UserData.ToGiftList[index].title)
                            .font(.headline)
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                        Text(self.UserData.ToGiftList[index].duedate.description)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    .padding(.leading)
                    
                    Spacer()
                }
            }
            .sheet(isPresented: self.$showEditingPage, content: {
                EditingPage(title:self.UserData.ToGiftList[index].title,duedate: self.UserData.ToGiftList[index].duedate,
                            isFavourite:self.UserData.ToGiftList[index].isFavourite
                ,id:self.index)
                    .environmentObject(self.UserData)
            })
            
            if self.UserData.ToGiftList[index].isFavourite{
                Image(systemName: "star.fill")
                    .imageScale(.large)
                    .foregroundColor(.yellow)
            }
                
            if !self.editingMode{
                Image(systemName: self.UserData.ToGiftList[index].isChecked ? "checkmark.square.fill" : "square")
                    .imageScale(.large)
                    .padding(.trailing)
                    .onTapGesture {
                        self.UserData.check(id: self.index)
                    }
            }
            else{
                Image(systemName: self.selection.firstIndex(where: {$0 == self.index}) == nil ? "circle" : "checkmark.circle.fill")
                    .imageScale(.large)
                    .padding(.trailing)
                    .onTapGesture {
                        if self.selection.firstIndex(where: {
                            $0 == self.index
                        }) == nil{
                            self.selection.append(self.index)
                        }
                        else{
                            self.selection.remove(at: self.selection.firstIndex(where: {$0 == self.index
                            })!)
                        }
                    }
                }
        }
        .frame(height:80)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5,x: 2,y: 5)
    }
}
        
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(UserData: ToGift(data: [
            SingleTogift(title: "手表", duedate: Date(), isFavourite: false),
            SingleTogift(title: "腰带", duedate: Date(), isFavourite: false),
            SingleTogift(title: "滑板", duedate: Date(), isFavourite: false),
            SingleTogift(title: "球鞋", duedate: Date(), isFavourite: false)]))
    }
}
