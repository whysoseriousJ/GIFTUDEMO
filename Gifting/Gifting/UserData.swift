//
//  UserData.swift
//  GIFTU
//
//  Created by 张健毓 on 2022/7/8.
//

import Foundation
import SwiftUI

var encorder = JSONEncoder()
var decorder = JSONDecoder()

class ToGift:ObservableObject{
    @Published var ToGiftList:[SingleTogift]
    var count = 0
    
    func pickRandomTitle() -> String {
            let randomGift = self.ToGiftList.randomElement()
            return randomGift?.title ?? ""
        }
    
    init(){
        self.ToGiftList = []
    }
    init(data:[SingleTogift]){
        self.ToGiftList=[]
        for item in data{
            self.ToGiftList.append(SingleTogift(title: item.title, duedate: item.duedate, isFavourite: item.isFavourite, id: self.count))
            count += 1
        }
    }
    
    func check(id:Int){
        self.ToGiftList[id].isChecked.toggle()
        self.dataStore()
    }
    
    func add(data:SingleTogift){
                self.ToGiftList.append(SingleTogift(title: data.title, duedate: data.duedate, isFavourite: data.isFavourite, id: self.count))
        self.count += 1
        
        self.sort()
        self.dataStore()
    }
    
    func edit(id:Int,data:SingleTogift){
         self.ToGiftList[id].title = data.title
         self.ToGiftList[id].duedate = data.duedate
         self.ToGiftList[id].isChecked = false
        self.ToGiftList[id].isFavourite = data.isFavourite
        
        self.sort()
        
        self.dataStore()
     }
    
    func delete(id:Int){
        self.ToGiftList[id].deleted = true
        self.sort()
        
        self.dataStore()
    }
    
    func sort(){
        self.ToGiftList.sort(by:{(data1,data2) in
            return data1.duedate.timeIntervalSince1970<data2.duedate.timeIntervalSince1970
        })
        for i in 0..<self.ToGiftList.count{
            self.ToGiftList[i].id = i
        }
        self.dataStore()
    }
    
    func dataStore(){
        let dataStored = try! encorder.encode(self.ToGiftList)
        UserDefaults.standard.set(dataStored, forKey: "ToGiftList")
    }
}

func initUserData() -> [SingleTogift]{
    var output:[SingleTogift] = []
    if let dataStored = UserDefaults.standard.object(forKey: "ToGiftList")as? Data{
        let data = try! decorder.decode([SingleTogift].self, from: dataStored)
        for item in data{
            if !item.deleted{
                output.append(SingleTogift(title: item.title, duedate: item.duedate,isChecked: item.isChecked, isFavourite: item.isFavourite,id: output.count))
            }
        }
    }
    return output
}
                    
struct SingleTogift: Identifiable,Codable{
    
    var title : String = ""
    var duedate : Date = Date()
    var isChecked : Bool = false
    
    var isFavourite : Bool = false
    
    var deleted : Bool = false
    
    var id:Int = 0
}


