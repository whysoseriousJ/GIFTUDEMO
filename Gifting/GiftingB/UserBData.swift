//
//  UserBData.swift
//  GIFTU
//
//  Created by 张健毓 on 2022/7/16.
//

import Foundation
import SwiftUI

var encorder2 = JSONEncoder()
var decorder2 = JSONDecoder()

class ToGiftB:ObservableObject{
    @Published var ToGiftBList:[SingleBTogift]
    var title: String = ""
    var count = 0
    
    init(){
        self.ToGiftBList = []
    }
    init(dataa:[SingleBTogift]){
        self.ToGiftBList=[]
        for item in dataa{
            self.ToGiftBList.append(SingleBTogift(title: item.title, duedate: item.duedate, isFavourite: item.isFavourite, id: self.count))
            count += 1
        }
    }
    
    func check1(id:Int){
        self.ToGiftBList[id].isChecked.toggle()
        self.dataStore1()
    }
    
    func add1(dataa:SingleBTogift){
                self.ToGiftBList.append(SingleBTogift(title: dataa.title, duedate: dataa.duedate, isFavourite: dataa.isFavourite, id: self.count))
        self.count += 1
        
        self.sort1()
        self.dataStore1()
    }
    
    func edit1(id:Int,dataa:SingleBTogift){
         self.ToGiftBList[id].title = dataa.title
         self.ToGiftBList[id].duedate = dataa.duedate
         self.ToGiftBList[id].isChecked = false
        self.ToGiftBList[id].isFavourite = dataa.isFavourite
        
        self.sort1()
        
        self.dataStore1()
     }
    
    func delete1(id:Int){
        self.ToGiftBList[id].deleted = true
        self.sort1()
        
        self.dataStore1()
    }
    
    func sort1(){
        self.ToGiftBList.sort(by:{(dataa1,dataa2) in
            return dataa1.duedate.timeIntervalSince1970<dataa2.duedate.timeIntervalSince1970
        })
        for i in 0..<self.ToGiftBList.count{
            self.ToGiftBList[i].id = i
        }
        self.dataStore1()
    }
    
    func dataStore1(){
        let dataStored1 = try! encorder2.encode(self.ToGiftBList)
        UserDefaults.standard.set(dataStored1, forKey: "ToGiftBList")
    }
}

struct SingleBTogift: Identifiable,Codable{
    
    var title: String = ""
    var duedate:Date = Date()
    var isChecked: Bool = false
    
    var isFavourite:Bool = false
    
    var deleted = false
    
    var id:Int = 0
}
