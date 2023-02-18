//
//  Markethome.swift
//  GIFTU
//
//  Created by 张健毓 on 2022/12/11.
//



import SwiftUI

struct Markethome: View {
    @State private var search: String = ""
    @State private var selectedIndex: Int = 1
    @State private var selectedCategory: String = "All"
    private var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible())]

    private let categories = ["推荐", "关注","创意", "穿搭", "饰品","数码", "实用", "摆件", "玩具", "其他"]
    var body: some View {
        NavigationView {
            ZStack {
                Color(#colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.937254902, alpha: 1))
                    .ignoresSafeArea()
                
                VStack (alignment: .leading) {
                    
//                    AppBarView()
//
//                        TagLineView()
//                            .padding()
                    
                    SearchAndScanView(search: $search)
                    
                ScrollView (showsIndicators: false) {
                   
                        ScrollView (.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(0..<categories.count, id: \.self) { i in
                                    Button(action: {
                                        selectedCategory = categories[i]
                                    }) {
                                        CategoryView(isActive: selectedCategory == categories[i], text: categories[i])
                                    }


//                                    Button(action: {selectedIndex = i}) {
//                                        CategoryView(isActive: selectedIndex == i, text: categories[i])
//                                    }
                                }
                            }
                            .padding()
                        }
                        
                        Text("Popular")
                            .font(.custom("PlayfairDisplay-Bold", size: 24))
                            .padding(.horizontal)
                        
                        ScrollView (.horizontal, showsIndicators: false) {
                            HStack (spacing: 0) {
                                ForEach(0 ..< 4) { i in
                                    NavigationLink(
                                        destination: Marketcontent(),
                                        label: {
                                            ProductCardView(image: Image("chair_\(i+1)"), size: 210)
                                        })
                                        .navigationBarHidden(true)
                                        .foregroundColor(.black)
                                }
                                .padding(.leading)
                            }
                        }
                        .padding(.bottom)
                        
                        Text("Best")
                            .font(.custom("PlayfairDisplay-Bold", size: 24))
                            .padding(.horizontal)
                        
                        ScrollView (.horizontal, showsIndicators: false) {
                            HStack (spacing: 0) {
                                ForEach(0 ..< 4) { i in
                                    ProductCardView(image: Image("chair_\(4-i)"), size: 180)
                                }
                                .padding(.leading)
                            }
                        }
                    
                    Spacer(minLength: 30)

                    
                    //Lazygrid
                    ScrollView{
                        LazyVGrid(columns: gridItemLayout){
                            ForEach(0 ..< 4) { i in
                                ProductCardView(image: Image("chair_\(4-i)"), size: 180)
                            }
                        }
                        
                    }
                        
                    }
                }
                
                VStack {
                    Spacer()
//                    BottomNavBarView()
                }
            }
        }
//        .navigationBarTitle("") //this must be empty
//        .navigationBarHidden(true)
//        .navigationBarBackButtonHidden(true)
    }
}

struct Markethome_Previews: PreviewProvider {
    static var previews: some View {
        Markethome()
    }
}





struct SearchAndScanView: View {
    @Binding var search: String
    var body: some View {
        HStack {
            
    //菜单: 分类、我的订单、我的关注、客服
            Button(action: {
                //待插入
            }) {
                Image("menu")
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10.0)
            }
            
    //搜索引擎，包含扫码识别、拍照识别
            HStack {
                Image("Search")
                    .padding(.trailing, 8)
                TextField("Search", text: $search)
                Button(action: {
//                    let results = searchForProducts(search)
                }) {
                    //扫描&拍照识别
                    Image(systemName: "camera.on.rectangle")
                        .foregroundColor(.brown)
                        .cornerRadius(10.0)
                }
            }
            .padding(.all, 10)
            .background(Color.white)
            .cornerRadius(10.0)
            
    //购物车
            Button(action: {
             //打开购物车
//                NavigationLink(destination: Cart()){
//                    EmptyView()
//                }
            }) {
                Image(systemName: "cart")
                    .resizable()
                    .frame(width: 28, height: 25)
                    .foregroundColor(.brown)
                    .padding(.all,9)
                    .background(Color.white)
                    .cornerRadius(10)
            }
        }
        .padding(.horizontal)
    }
}

struct CategoryView: View {
    let isActive: Bool
    let text: String
    var body: some View {
        VStack (alignment: .leading, spacing: 0) {
            Text(text)
                .font(.system(size: 18))
                .fontWeight(.medium)
                .foregroundColor(isActive ? Color("Primary") : Color.black.opacity(0.5))
            if (isActive) { Color("Primary")
                .frame(width: 35, height: 2)
                .clipShape(Capsule())
            }
        }
        .padding(.trailing)
    }
}

struct ProductCardView: View {
    let image: Image
    let size: CGFloat
    
    var body: some View {
        VStack {
            image
                .resizable()
                .frame(width: size, height: 200 * (size/210))
                .cornerRadius(20.0)
            Text("Luxury Swedian chair").font(.title3).fontWeight(.bold)
            
            HStack (spacing: 2) {
                ForEach(0 ..< 5) { item in
                    Image("star")
                }
                Spacer()
                Text("$1299")
                    .font(.title3)
                    .fontWeight(.bold)
            }
        }
        .frame(width: size)
        .padding()
        .background(Color.white)
        .cornerRadius(20.0)
        
    }
}


struct BottomNavBarView: View {
    var body: some View {
        HStack {
            BottomNavBarItem(image: Image("Home"), action: {})
            BottomNavBarItem(image: Image("fav"), action: {})
            BottomNavBarItem(image: Image("shop"), action: {})
            BottomNavBarItem(image: Image("User"), action: {})
        }
        .padding()
        .background(Color.white)
        .clipShape(Capsule())
        .padding(.horizontal)
        .shadow(color: Color.blue.opacity(0.15), radius: 8, x: 2, y: 6)
    }
}

struct BottomNavBarItem: View {
    let image: Image
    let action: () -> Void
    var body: some View {
        Button(action: action) {
            image
                .frame(maxWidth: .infinity)
        }
    }
}



//struct AppBarView: View {
//    var body: some View {
//        HStack {
//            Button(action: {
//                //待插入
//            }) {
//                Image("menu")
//                    .padding()
//                    .background(Color.white)
//                    .cornerRadius(10.0)
//            }
//
//            Spacer()
//
//            Button(action: {
//                //待插入
//            }) {
//                Image(uiImage: #imageLiteral(resourceName: "Profile"))
//                    .resizable()
//                    .frame(width: 42, height: 42)
//                    .cornerRadius(10.0)
//            }
//        }
//        .padding(.horizontal)
//    }
//}

//struct TagLineView: View {
//    var body: some View {
//        Text("Find the \nBest ")
//            .font(.custom("PlayfairDisplay-Regular", size: 28))
//            .foregroundColor(Color("Primary"))
//            + Text("Furniture!")
//            .font(.custom("PlayfairDisplay-Bold", size: 28))
//            .fontWeight(.bold)
//            .foregroundColor(Color("Primary"))
//    }
//}
