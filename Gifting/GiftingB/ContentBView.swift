//
//  ContentBView.swift
//  GIFTU
//
//  Created by 张健毓 on 2022/7/16.
//

import SwiftUI

func initUserBData() -> [SingleBTogift]{
    var output:[SingleBTogift] = []
    if let dataStored1 = UserDefaults.standard.object(forKey: "ToGiftBList")as? Data{
        let dataa = try! decorder2.decode([SingleBTogift].self, from: dataStored1)
        for item in dataa{
            if !item.deleted{
                output.append(SingleBTogift(title: item.title, duedate: item.duedate,isChecked: item.isChecked, isFavourite: item.isFavourite,id: output.count))
            }
        }
    }
    return output
}

struct ContentBView: View {
    
    @ObservedObject var UserBData: ToGiftB = ToGiftB(dataa: initUserBData())
    
    @State var showEditingBPage = false
    @State var editingBMode = false
    @State var showFavouriteOnly1 = false
    
    @State var selectionB: [Int] = []
                                         
    var body: some View {
        
        ZStack{
            NavigationView{
                ScrollView(.vertical,showsIndicators: true){
                    VStack{
                        ForEach(self.UserBData.ToGiftBList){item in
                            if !item.deleted{
                                if !showFavouriteOnly1 || item.isFavourite{
                                    Singlecardview2(index: item.id,editingBMode: self.$editingBMode,selectionB: self.$selectionB)
                                        .environmentObject(self.UserBData)
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
                    if self.editingBMode{
                        Delete1Button(selectionB: self.$selectionB, editingBMode: self.$editingBMode)
                            .environmentObject(self.UserBData)
                        ShowFav1Button(selectionB: self.$selectionB, editingBMode: self.$editingBMode)
                            .environmentObject(self.UserBData)
                    }
                    if !self.editingBMode{
                        ShowFavourite1Button(showFavouriteOnly1: self.$showFavouriteOnly1)
                    }
                    Editing1Button(editingBMode: self.$editingBMode,selectionB: self.$selectionB)
                })
        }        
                HStack{
                    Spacer()
                    VStack{
                        Spacer()
                        Button(action: {
                            self.showEditingBPage = true
                        }){
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width:60)
                            .foregroundColor(.blue)
                            .padding(.trailing)
                            .padding(10)
                    }
                        .sheet(isPresented: self.$showEditingBPage, content: {
                            EditingBPage()
                                .environmentObject(self.UserBData)
                        })
                }
            }
        }
    }
}

struct ShowFav1Button:View{
    
    @EnvironmentObject var UserBData: ToGiftB
    @Binding var selectionB: [Int]
    @Binding var editingBMode : Bool
    
    var body: some View{
        Image(systemName: "star.lefthalf.fill")
            .imageScale(.large)
            .foregroundColor(.yellow)
            .onTapGesture {
                for i in self.selectionB{
                    self.UserBData.ToGiftBList[i].isFavourite.toggle()
                }
                self.editingBMode = false
            }
    }
}


struct ShowFavourite1Button:View{
    
    @Binding var showFavouriteOnly1: Bool
    var body: some View{
        Button (action: {
            self.showFavouriteOnly1.toggle()
        }){
            Image(systemName: self.showFavouriteOnly1 ? "star.fill" : "star")
                .imageScale(.large)
                .foregroundColor(.yellow)
            }
    }
}

struct Editing1Button: View{
    
    @Binding var editingBMode: Bool
    @Binding var selectionB : [Int]
    
    
    var body: some View{
        Button(action:{
            self.editingBMode.toggle()
            self.selectionB.removeAll()
        }){
            Image(systemName: "gear")
                .imageScale(.large)
        }
    }
}

struct Delete1Button: View{
    
    @Binding var selectionB: [Int]
    @EnvironmentObject var userBData : ToGiftB
    @Binding var editingBMode : Bool
    
    var body: some View{
        Button(action:{
            for i in self.selectionB{
                self.userBData.delete1(id: i)
            }
            self.editingBMode = false
        }){
            Image(systemName: "trash")
                .imageScale(.large)
        }
    }
}



struct Singlecardview2: View {
    
    @EnvironmentObject var UserBData:ToGiftB
    var index : Int
    
    @State var showEditingBPage = false
    @Binding var editingBMode: Bool
    @Binding var selectionB:[Int]
    
    var body: some View {
        HStack{
            if self.editingBMode{
                Button(action: {
                    self.UserBData.delete1(id: self.index)
                    self.editingBMode = false
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
                if !self.editingBMode{
                    self.showEditingBPage = true
                }
            }){
                Group{
                    VStack(alignment: .leading, spacing: 6.0){
                        Text(self.UserBData.ToGiftBList[index].title)
                            .font(.headline)
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                        Text(self.UserBData.ToGiftBList[index].duedate.description)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    .padding(.leading)
                    
                    Spacer()
                }
            }
            .sheet(isPresented: self.$showEditingBPage, content: {
                EditingBPage(title:self.UserBData.ToGiftBList[index].title,duedate: self.UserBData.ToGiftBList[index].duedate,
                            isFavourite:self.UserBData.ToGiftBList[index].isFavourite
                ,id:self.index)
                    .environmentObject(self.UserBData)
            })
            
            if self.UserBData.ToGiftBList[index].isFavourite{
                Image(systemName: "star.fill")
                    .imageScale(.large)
                    .foregroundColor(.yellow)
            }
                
            if !self.editingBMode{
                Image(systemName: self.UserBData.ToGiftBList[index].isChecked ? "checkmark.square.fill" : "square")
                    .imageScale(.large)
                    .padding(.trailing)
                    .onTapGesture {
                        self.UserBData.check1(id: self.index)
                    }
            }
            else{
                Image(systemName: self.selectionB.firstIndex(where: {$0 == self.index}) == nil ? "circle" : "checkmark.circle.fill")
                    .imageScale(.large)
                    .padding(.trailing)
                    .onTapGesture {
                        if self.selectionB.firstIndex(where: {
                            $0 == self.index
                        }) == nil{
                            self.selectionB.append(self.index)
                        }
                        else{
                            self.selectionB.remove(at: self.selectionB.firstIndex(where: {$0 == self.index
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
        
struct ContentBView_Previews: PreviewProvider {
    static var previews: some View {
        ContentBView(UserBData: ToGiftB(dataa: [
            SingleBTogift(title: "口红", duedate: Date(), isFavourite: false),
            SingleBTogift(title: "粉底液", duedate: Date(), isFavourite: false),
            SingleBTogift(title: "项链", duedate: Date(), isFavourite: false),
            SingleBTogift(title: "包包", duedate: Date(), isFavourite: false)]))
    }
}
