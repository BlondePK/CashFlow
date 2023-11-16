//
//  AmountAsseet.swift
//  CashFlow
//
//  Created by joakim simonsen on 16/11/2023.
//


import SwiftUI

struct categoriesView: View {
    @ObservedObject var categories = Categorys()
    @State private var didMakeList: Bool = false
    let columns = [
        GridItem(.adaptive(minimum: 80))
    ]
    
    
    var body: some View {
        ZStack{
            //Background Color
            Color.background.ignoresSafeArea(.all)
            
            
            VStack{
                
                //Search Field
                
                //Categories
                
                ScrollView{
                    ForEach(0..<categories.AllCatgegories.count, id: \.self){i in
                        let subCat = categories.AllCatgegories[i]
                        
                        VStack{
                            HStack{
                                Text("\(subCat[0].mainCategory)")
                                Spacer()
                            }
                            Divider()
                            
                            LazyVGrid(columns: columns, alignment: .center, spacing: 20){
                                ForEach(0..<subCat.count, id: \.self){ s in
                                    Button{
                                        //
                                    }label: {
                                        VStack{
                                            ZStack{
                                                Circle()
                                                    .frame(width: 40, alignment: .center)
                                                    .foregroundStyle(categories.CategoryColors[subCat[s].colorInt])
                                                
                                                Image(systemName: "\(subCat[s].icon)")
                                                    .font(.subheadline)
                                                    .foregroundStyle(Color.background)
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                
            }
        }.onAppear{
            if didMakeList == false{
                categories.combineAllCategories()
            }
        }
    }
}

#Preview {
    categoriesView(categories: Categorys())
}
